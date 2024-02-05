if get_option('default-gsettings-overrides')
    default_wallpaper = get_option('default-wallpaper')
    default_wallpaper_dark = get_option('default-wallpaper-dark')

    wallpaper_configuration = configuration_data()
    wallpaper_configuration.set('DEFAULT_WALLPAPER', default_wallpaper)
    wallpaper_configuration.set('DEFAULT_WALLPAPER_DARK', default_wallpaper_dark)

    settings_override = configure_file(
        input: 'default-settings.gschema.override.in',
        output: '@BASENAME@',
        configuration: wallpaper_configuration,
        install_dir: schemadir
    )
endif
