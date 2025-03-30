#!/bin/bash

CONFIG_FILE="/etc/plymouth/plymouthd.conf"

TIMEOUT_SECONDS=300 # Maximum wait time in seconds
ELAPSED=0

# Wait until Gala is running or timeout occurs
while ! pgrep -x "gala" > /dev/null && [ $ELAPSED -lt $TIMEOUT_SECONDS ]; do
    sleep 5
    ((ELAPSED += 5))
done

if [ $ELAPSED -ge $TIMEOUT_SECONDS ]; then
    echo "Timeout reached while waiting for Gala to start" >&2
    exit 1
fi

# Get the active user based on the currently active graphical session
ACTIVE_USER=$(who | grep -E '(:[0-9]+)' | awk '{print $1}' | head -n 1)

if [[ -z "$ACTIVE_USER" ]]; then
    logger -t plymouth-hidpi "No active user with a graphical session."
    exit 1
fi

USER_HOME=$(eval echo ~$ACTIVE_USER)  # Get the home directory of the active user
MONITORS_XML="$USER_HOME/.config/monitors.xml"

if [[ ! -f "$MONITORS_XML" ]]; then
    logger -t plymouth-hidpi "Monitors XML file not found for user: $PRIMARY_USER"
    exit 1
fi

PRIMARY_MONITOR_SCALE=$(awk '
    /<primary>yes<\/primary>/ {print prev; exit}
    {prev=$0}
' $MONITORS_XML | grep -oP '<scale>\K[0-9]+')
# Scale=2 means 2x resolution ('Retina Display' in Apple computers)
logger -t plymouth-hidpi "Primary monitor scale: '$PRIMARY_MONITOR_SCALE'" 

create_config() {
    cat <<EOF > "$CONFIG_FILE"
[Daemon]
DeviceScale=1
EOF
    logger -t plymouth-hidpi "Created new config: '$CONFIG_FILE' with HiDPI setting"
}

apply_hidpi_setting() {
    if [[ "$PRIMARY_MONITOR_SCALE" -eq 2 ]]; then
        if [[ ! -f "$CONFIG_FILE" ]]; then
            create_config

            # Apply the changes
            update-initramfs -u
            logger -t plymouth-hidpi "Updated initramfs after HiDPI change"
        else
            logger -t plymouth-hidpi "HiDPI config file already exists, no changes made"
        fi
    else
        logger -t plymouth-hidpi "Skipped HiDPI settings (DPI: $DPI, Threshold: $HIDPI_THRESHOLD)"
    fi
}

apply_hidpi_setting
