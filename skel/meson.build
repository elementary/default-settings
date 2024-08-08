skeldir = sysconfdir / 'skel'

# AppCenter Flatpak Remote
if get_option('appcenter-flatpak')
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


