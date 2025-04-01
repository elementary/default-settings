#!/bin/bash

CONFIG_FILE="/etc/plymouth/plymouthd.conf"

logger -t plymouth-hidpi "Running plymouth-hidpi.sh..."

TIMEOUT_SECONDS=300 # Maximum wait time in seconds
ELAPSED=0

while [[ -z "$ACTIVE_USER" && $ELAPSED -lt $TIMEOUT_SECONDS ]]; do
    ACTIVE_USER=$(who | grep -E '(:[0-9]+)' | awk '{print $1}' | head -n 1)
    if [[ -z "$ACTIVE_USER" ]]; then
        logger -t plymouth-hidpi "No active user found yet."
        sleep 5
        ((ELAPSED += 5))
    fi
done

if [[ -z "$ACTIVE_USER" ]]; then
    logger -t plymouth-hidpi "No active user with a graphical session within timeout period."
    exit 1
fi

USER_HOME=$(eval echo ~$ACTIVE_USER)  # Get the home directory of the active user
MONITORS_XML="$USER_HOME/.config/monitors.xml"

if [[ ! -f "$MONITORS_XML" ]]; then
    logger -t plymouth-hidpi "Monitors XML file not found for user: $ACTIVE_USER"
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

update_device_scale_in_config() {
    if grep -q "^DeviceScale=" "$CONFIG_FILE"; then
        sed -i 's/^DeviceScale=.*/DeviceScale=1/' "$CONFIG_FILE"
        logger -t plymouth-hidpi "Updated DeviceScale setting in '$CONFIG_FILE'"
    elif grep -q "^\[Daemon\]" "$CONFIG_FILE"; then
        sed -i '/^\[Daemon\]/a DeviceScale=1' "$CONFIG_FILE"
        logger -t plymouth-hidpi "Added DeviceScale setting under [Daemon] in '$CONFIG_FILE'"
    else
        echo -e "[Daemon]\nDeviceScale=1" >> "$CONFIG_FILE"
        logger -t plymouth-hidpi "Created [Daemon] section and added DeviceScale setting in '$CONFIG_FILE'"
    fi
}

remove_device_scale_in_config() {
    sed -i '/^DeviceScale=/d' "$CONFIG_FILE"
    logger -t plymouth-hidpi "Removed DeviceScale setting from '$CONFIG_FILE'"
}

commit_changes() {
    update-initramfs -u
    logger -t plymouth-hidpi "$1"
}

apply_hidpi_setting() {
    if [[ "$PRIMARY_MONITOR_SCALE" -eq 2 ]]; then
        if [[ ! -f "$CONFIG_FILE" ]]; then
            create_config
            commit_changes "Updated initramfs after adding HiDPI setting"
        else
            update_device_scale_in_config
            commit_changes "Updated initramfs after modifying HiDPI setting"
        fi
    elif [[ -f "$CONFIG_FILE" ]] && grep -q "^DeviceScale=" "$CONFIG_FILE"; then
        remove_device_scale_in_config
        commit_changes "Updated initramfs after removing HiDPI setting"
    else
        logger -t plymouth-hidpi "Skipped HiDPI settings (scale: $PRIMARY_MONITOR_SCALE)"
    fi
}

apply_hidpi_setting
