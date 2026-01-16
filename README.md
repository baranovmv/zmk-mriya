## ZMK Config for the MRIYA Keyboard (for windows users)

Disabled nice_view_gem as it is not compatible with the newest zmk.

In order to build:

In zmk:
1. Init uv project in ZMK folder, add 
2. run "uv run west packages pip | xargs uv add"

In zmk-mriya run ./build_upload.sh
