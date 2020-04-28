dbus_dep = dependency('dbus-1')
dbus_interfaces_dir = dbus_dep.get_pkgconfig_variable('interfaces_dir', define_variable: ['datadir', datadir])

install_data(
    'io.elementary.pantheon.AccountsService.xml',
    install_dir: dbus_interfaces_dir
)

polkit_dep = dependency('polkit-gobject-1')
polkit_actiondir = polkit_dep.get_pkgconfig_variable('actiondir', define_variable: ['prefix', prefix])

install_data(
    'io.elementary.pantheon.AccountsService.policy',
    install_dir: polkit_actiondir
)

act_dep = dependency('accountsservice')
act_interfacesdir = act_dep.get_pkgconfig_variable('interfacesdir', define_variable: ['datadir', datadir], default: datadir /'accountsservice' / 'interfaces')

meson.add_install_script(
    symlink,
    join_paths(dbus_interfaces_dir, 'io.elementary.pantheon.AccountsService.xml'),
    join_paths(act_interfacesdir, 'io.elementary.pantheon.AccountsService.xml'),
)
