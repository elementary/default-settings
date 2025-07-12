install_data(
    '01-network-manager-all.yml',
    install_dir: sysconfdir / 'netplan'
)

# Override /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf shipped by NetworkManager
# See https://askubuntu.com/a/1075112
# TODO Remove when upstream fix is merged:
# https://code.launchpad.net/~tintou/network-manager/+git/network-manager/+merge/479821
install_data(
    '10-globally-managed-devices.conf',
    install_dir: sysconfdir / 'NetworkManager' / 'conf.d'
)
