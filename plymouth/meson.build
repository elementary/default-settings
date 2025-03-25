# Configure Plymouth for HiDPI screens
install_data(
    'plymouth-hidpi.sh',
    install_dir: '/usr/local/bin',
    install_mode: 'rwxr-xr-x'
)

install_data(
    'plymouth-hidpi.service',
    install_dir: '/etc/systemd/system'
)

# Enable the service so it runs once on boot
meson.add_install_script('systemctl', 'enable', 'plymouth-hidpi.service')

# Reload systemd daemon after installation
meson.add_install_script('systemctl', 'daemon-reload')

