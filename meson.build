project(
    'elementary-default-settings',
    version: '5.1.0',
    default_options: 'sysconfdir=/etc',
)

prefix = get_option('prefix')
datadir = join_paths(prefix, get_option('datadir'))
sysconfdir = get_option('sysconfdir')

meson.add_install_script('meson/post_install.py', datadir)

# Planks Default DockItems
if get_option('plank-dockitems')
    install_subdir(
        'plank',
        install_dir: join_paths(sysconfdir, 'skel', '.config')
    )
endif

# Setup system wide global environment for applications
install_subdir(
    'profile.d',
    install_dir: join_paths(sysconfdir, 'profile.d'),
    strip_directory : true
)

# elementary Plymouth Theme
install_subdir(
    'plymouth/elementary',
    install_dir: join_paths(datadir, 'plymouth', 'themes')
)

install_data(
    'plymouth/ubuntu-text.plymouth',
    install_dir: join_paths(datadir, 'plymouth', 'themes')
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

# Default Appcenter Blacklist
install_data(
    'appcenter/appcenter.blacklist',
    install_dir: join_paths(sysconfdir, 'appcenter')
)

# Configuration file of GNU readline
install_data(
    'inputrc/.inputrc',
    install_dir: join_paths(sysconfdir, 'skel')
)

# Default gsettings overrides
subdir('overrides')

# AccountsService extension for Greeter.
subdir('accountsservice')
