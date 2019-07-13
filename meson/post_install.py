#!/usr/bin/env python3

import os
import sys
import subprocess

if 'DESTDIR' not in os.environ:
    default_settings_datadir = sys.argv[1]

    print('Compiling GSettings schemas...')
    subprocess.call(['glib-compile-schemas',
                    os.path.join(default_settings_datadir, 'glib-2.0', 'schemas')])
