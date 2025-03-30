# Configure Plymouth for HiDPI screens
install_data(
    'plymouth-hidpi.sh',
    install_dir: get_option('bindir'),
    install_mode: 'rwxr-xr-x'
)

configure_file(
    input: 'plymouth-hidpi.service.in',
    output: 'plymouth-hidpi.service',
    configuration: { 'BINDIR': join_paths(get_option('prefix'), get_option('bindir')) },
    install: true,
    install_dir: '/etc/systemd/system'
)
