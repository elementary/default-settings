preinstall_files = [
    'appcenter.preinstall',
    'flathub.preinstall',
]

foreach file : preinstall_files
    install_data(
        file,
        install_dir: sysconfdir / 'flatpak' / 'preinstall.d'
    )
endforeach

systemd_system_unit_dir = get_option('systemdsystemunitdir')
if systemd_system_unit_dir != 'no'
    if systemd_system_unit_dir == ''
        systemd_dep = dependency('systemd')
        systemd_system_unit_dir = systemd_dep.get_variable('systemdsystemunitdir', pkgconfig_define: ['rootprefix', prefix])
    endif

    install_data(
        'flatpak-preinstalld.service',
        install_dir: systemd_system_unit_dir
    )
endif
