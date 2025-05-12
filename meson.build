project(
    'elementary-default-settings',
    version: '8.1.0',
    meson_version: '>= 0.58.0'
)

gnome = import('gnome')
prefix = get_option('prefix')
datadir = prefix / get_option('datadir')
sysconfdir = get_option('sysconfdir')
schemadir = datadir / 'glib-2.0' / 'schemas'

gnome.post_install(glib_compile_schemas: true)

symlink = meson.current_source_dir () / 'meson' / 'create-symlink.sh'

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

# So SessionInstaller can have an Icon
install_data(
    'sessioninstaller/sessioninstaller.desktop',
    install_dir: datadir / 'applications'
)

# xdg-desktop-portal configuration
install_data(
    'xdg-desktop-portal/pantheon-portals.conf',
    install_dir: datadir / 'xdg-desktop-portal'
)

# AppArmor Flatpak profile
install_data(
    'apparmor/bwrap-userns-restrict',
    install_dir: datadir / 'apparmor' / 'extra-profiles',
    rename: 'bwrap-userns-restrict-patched',
)

# Default gsettings overrides
subdir('overrides')

# AccountsService extension for Greeter.
subdir('accountsservice')

# System skeleton
subdir('skel')

# Geolocation settings
subdir('geoclue')

# GTK settings
subdir('gtk')
