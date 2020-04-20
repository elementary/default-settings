skeldir = join_paths(sysconfdir, 'skel')

# Planks Default DockItems
if get_option('plank-dockitems')
    install_subdir(
        'plank',
        install_dir: join_paths(skeldir, '.config')
    )
endif

# Configuration file of GNU readline
install_data(
    '.inputrc',
    install_dir: skeldir
)


