#!/bin/bash

CONFIG_FILE="/etc/plymouth/plymouthd.conf"
DAEMON_SECTION="[Daemon]"
SCALE_SETTING="DeviceScale=1"
HIDPI_THRESHOLD=180 # Min DPI of a HiDPI screen

# Get current DPI
DPI=$(xrdb -query | grep dpi | awk '{print $2}')

# Adds
# [Daemon]
# DeviceScale=1
# only if missing in the file
add_setting() {
    # Remove first line if it's blank
    sed -i '1{/^$/d}' "$CONFIG_FILE"

    if ! grep -q "$DAEMON_SECTION" "$CONFIG_FILE"; then
        echo -e "$DAEMON_SECTION" >> "$CONFIG_FILE"
    fi

    sed -i "/$DAEMON_SECTION/a $SCALE_SETTING" "$CONFIG_FILE"
}

# Creates the configuration file with the necessary settings.
create_config() {
    echo -e "$DAEMON_SECTION\n$SCALE_SETTING" > "$CONFIG_FILE"
}

apply_hidpi_setting() {
    if [[ "$DPI" -ge "$HIDPI_THRESHOLD" ]]; then
        if [[ -f "$CONFIG_FILE" ]]; then
            if ! grep -q "^DeviceScale" "$CONFIG_FILE"; then
                add_setting
                logger -t plymouth-hidpi "Added '$SCALE_SETTING' to '$CONFIG_FILE'"
            else
                logger -t plymouth-hidpi "HiDPI setting already present in '$CONFIG_FILE' no changes made"
            fi
        else
            create_config
            logger -t plymouth-hidpi "Created new config: '$CONFIG_FILE' with HiDPI setting"
        fi

        # Apply the changes
        update-initramfs -u
        logger -t plymouth-hidpi "Updated initramfs after HiDPI change"
    else
        logger -t plymouth-hidpi "Skipped HiDPI settings (DPI: $DPI, Threshold: $HIDPI_THRESHOLD)"

    fi
}

apply_hidpi_setting
