repo_files = [
    'appcenter.flatpakrepo',
    'flathub.flatpakrepo',
]

# Install system-wide remotes
foreach repo_file : repo_files
    install_data(
        repo_file,
        install_dir: datadir / 'flatpak' / 'remotes.d'
    )
endforeach
