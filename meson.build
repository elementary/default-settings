project(
    'elementary-default-settings',
    version: '8.1.0',
    meson_version: '>= 1.3.0'
)

fs = import('fs')
gnome = import('gnome')
prefix = get_option('prefix')
datadir = prefix / get_option('datadir')
sysconfdir = get_option('sysconfdir')
schemadir = datadir / 'glib-2.0' / 'schemas'

gnome.post_install(glib_compile_schemas: true)

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

# AppArmor profiles for bwrap etc
if get_option('apparmor-profiles')
    subdir('apparmor')
endif

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

# Network settings
subdir('network')
