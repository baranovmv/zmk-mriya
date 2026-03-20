## ZMK Config for the MRIYA Keyboard (for windows users)

Disabled nice_view_gem as it is not compatible with the newest zmk.

In order to build:

0. Install cmake, ninja-build, [uv](https://docs.astral.sh/uv/getting-started/installation/)

In zmk:
1. Init uv project in ZMK folder, 
2. add west `uv add west`
3. run "uv run west packages pip | xargs uv add"
4. add toolkit: `uv run west sdk install`

In zmk-mriya run ./build_upload.sh
