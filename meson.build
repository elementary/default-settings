project(
    'elementary-default-settings',
    version: '7.0.2',
    meson_version: '>= 0.58.0',
)

gnome = import('gnome')
prefix = get_option('prefix')
datadir = prefix / get_option('datadir')
sysconfdir = get_option('sysconfdir')
schemadir = datadir / 'glib-2.0' / 'schemas'

gnome.post_install(glib_compile_schemas: true)

symlink = meson.current_source_dir () / 'meson' / 'create-symlink.sh'

# Setup system wide global environment for applications
install_subdir(
    'profile.d',
    install_dir: sysconfdir / 'profile.d',
    strip_directory : true
)

# Sudo password feedback in terminals
install_data(
    'sudoers.d/pwfeedback',
    install_dir: sysconfdir / 'sudoers.d'
)

# CUPS Printing testpage
install_data(
    'cups/default-testpage.pdf',
    install_dir: datadir / 'cups' / 'data'
)

# GTK3 Settings
install_data(
    'gtk/settings.ini',
    install_dir: sysconfdir / 'gtk-3.0'
)

# So SessionInstaller can have an Icon
install_data(
    'sessioninstaller/sessioninstaller.desktop',
    install_dir: datadir / 'applications'
)

# Default gsettings overrides
subdir('overrides')

# AccountsService extension for Greeter.
subdir('accountsservice')

# System skeleton
subdir('skel')
