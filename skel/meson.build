skeldir = sysconfdir / 'skel'

# AppCenter Flatpak Remote
if get_option('appcenter-flatpak')
    # remote for system-wide installation
    install_subdir(
        'flatpak',
        install_dir: sharedstatedir
    )
    # remote for per-user installation
    install_subdir(
        'flatpak',
        install_dir: skeldir / '.local' / 'share'
    )
endif

# Configuration file of GNU readline
install_data(
    '.inputrc',
    install_dir: skeldir
)


