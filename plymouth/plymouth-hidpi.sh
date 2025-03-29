#!/bin/bash

CONFIG_FILE="/etc/plymouth/plymouthd.conf"
HIDPI_THRESHOLD=180 # Min DPI of a HiDPI screen

TIMEOUT=300  # Set the maximum wait time in seconds
ELAPSED=0

# Wait until Gala is running or timeout occurs
while ! pgrep -x "gala" > /dev/null && [ $ELAPSED -lt $TIMEOUT ]; do
    sleep 1
    ((ELAPSED++))
done

if [ $ELAPSED -ge $TIMEOUT ]; then
    echo "Timeout reached while waiting for Gala to start" >&2
    exit 1
fi

# Get current DPI
export DISPLAY=":0"
DPI=$(xrdb -query | grep dpi | awk '{print $2}')

create_config() {
    cat <<EOF > "$CONFIG_FILE"
[Daemon]
DeviceScale=1
EOF
    logger -t plymouth-hidpi "Created new config: '$CONFIG_FILE' with HiDPI setting"
}

apply_hidpi_setting() {
    if [[ "$DPI" -ge "$HIDPI_THRESHOLD" ]]; then
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
