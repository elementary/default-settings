project(
    'elementary-default-settings',
    version: '7.0.2',
    meson_version: '>= 0.61.0',
)

gnome = import('gnome')
prefix = get_option('prefix')
datadir = join_paths(prefix, get_option('datadir'))
sysconfdir = get_option('sysconfdir')
schemadir = join_paths(datadir, 'glib-2.0', 'schemas')

gnome.post_install(glib_compile_schemas: true)

# Setup system wide global environment for applications
install_subdir(
    'profile.d',
    install_dir: join_paths(sysconfdir, 'profile.d'),
    strip_directory : true
)

# Sudo password feedback in terminals
install_data(
    'sudoers.d/pwfeedback',
    install_dir: join_paths(sysconfdir, 'sudoers.d')
)

# CUPS Printing testpage
install_data(
    'cups/default-testpage.pdf',
    install_dir: join_paths(datadir, 'cups', 'data')
)

# GTK3 Settings
install_data(
    'gtk/settings.ini',
    install_dir: join_paths(sysconfdir, 'gtk-3.0')
)

# So SessionInstaller can have an Icon
install_data(
    'sessioninstaller/sessioninstaller.desktop',
    install_dir: join_paths(datadir, 'applications')
)

# Default gsettings overrides
subdir('overrides')

# AccountsService extension for Greeter.
subdir('accountsservice')

# System skeleton
subdir('skel')
