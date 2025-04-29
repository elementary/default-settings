# Configure GeoClue to use BeaconDB
if get_option('appcenter-flatpak')
    install_data(
        'beacondb.conf',
        rename: '99-beacondb.conf',
        install_dir: sysconfdir / 'geoclue' / 'conf.d'
    )
endif
