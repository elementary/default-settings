skeldir = join_paths(sysconfdir, 'skel')

# Planks Default DockItems
if get_option('plank-dockitems')
    install_subdir(
        'plank',
        install_dir: join_paths(skeldir, '.config')
    )
endif

# AppCenter Flatpak Remote
if get_option('appcenter-flatpak')
    install_subdir(
        'flatpak',
        install_dir: join_paths(skeldir, '.local', 'share')
    )
endif

# Configuration file of GNU readline
install_data(
    '.inputrc',
    install_dir: skeldir
)


