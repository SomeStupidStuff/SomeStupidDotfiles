#!/usr/bin/env python3

from i3ipc import Connection

i3 = Connection()
tree = i3.get_tree()

for conn in tree:
    if conn.name and "youtube" in conn.name.lower():
        conn.command("move scratchpad")
