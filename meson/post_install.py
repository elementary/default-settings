#!/usr/bin/env python3

import os
import sys
import subprocess

if 'DESTDIR' not in os.environ:
    schemadir = sys.argv[1]

    print('Compiling GSettings schemas...')
    subprocess.call(['glib-compile-schemas',
                    schemadir])
