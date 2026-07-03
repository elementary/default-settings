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
