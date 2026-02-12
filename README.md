This is my NixOS flake.
The goal here is to make a flake for 3 main compute systems.
1. Keystone - My laptop that I do most of my general day to day computing on.
2. Atlas - My desktop that I play games on.
3. Big Iron - My main compute server that does all my heavy lifting.

The flake breaks up applications into modules that can be enabled or disabled individually and then allows them to be bundled into bundles for easy implementation.
