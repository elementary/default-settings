dbus_dep = dependency('dbus-1')
dbus_interfaces_dir = dbus_dep.get_variable('interfaces_dir', pkgconfig_define: ['datadir', datadir])

install_data(
    'io.elementary.pantheon.AccountsService.xml',
    install_dir: dbus_interfaces_dir
)

polkit_dep = dependency('polkit-gobject-1')
polkit_actiondir = polkit_dep.get_variable('actiondir', pkgconfig_define: ['prefix', prefix])

install_data(
    'io.elementary.pantheon.AccountsService.policy',
    install_dir: polkit_actiondir
)

act_dep = dependency('accountsservice')
act_interfacesdir = act_dep.get_variable(
    'interfacesdir',
    pkgconfig_define: ['datadir', datadir],
    default_value: datadir /'accountsservice' / 'interfaces'
)

symlink = join_paths(meson.current_source_dir (), 'meson', 'create-symlink.sh')
meson.add_install_script(
    symlink,
    dbus_interfaces_dir / 'io.elementary.pantheon.AccountsService.xml',
    act_interfacesdir / 'io.elementary.pantheon.AccountsService.xml',
)
