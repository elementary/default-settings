project(
    'elementary-default-settings',
    version: '6.0.1',
)

prefix = get_option('prefix')
datadir = join_paths(prefix, get_option('datadir'))
sysconfdir = get_option('sysconfdir')
schemadir = join_paths(datadir, 'glib-2.0', 'schemas')

meson.add_install_script('meson/post_install.py', schemadir)

symlink = join_paths(meson.current_source_dir (), 'meson', 'create-symlink.sh')

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

# Default Appcenter hidden apps list
install_data(
    'appcenter/appcenter.hiddenapps',
    install_dir: join_paths(sysconfdir, 'io.elementary.appcenter')
)

# Default gsettings overrides
subdir('overrides')

# AccountsService extension for Greeter.
subdir('accountsservice')

# System skeleton
subdir('skel')
