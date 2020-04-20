if get_option('default-gsettings-overrides')
    default_wallpaper = get_option('default-wallpaper')

    wallpaper_configuration = configuration_data()
    wallpaper_configuration.set('DEFAULT_WALLPAPER', default_wallpaper)

    settings_override = configure_file(
        input: 'default-settings.gschema.override.in',
        output: '@BASENAME@',
        configuration: wallpaper_configuration,
        install_dir: join_paths(schemadir)
    )
endif

# Install conditionally because it's dependent on our dockitems being installed
if get_option('plank-dockitems')
    install_data(
        'plank-dockitems.gschema.override',
        install_dir: join_paths(schemadir)
    )
endif
