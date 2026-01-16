#! bash

ZMK_FOLDER="../zmk/"
ZMK_MRIYA_FOLDER=$(pwd)

pushd $ZMK_FOLDER/app
echo "Build left side"
uv run west build -p -b nice_nano -- -DSHIELD="mriya_left_main_display nice_view_adapter nice_view" -DZMK_CONFIG=$ZMK_MRIYA_FOLDER/config -DZMK_EXTRA_MODULES=$ZMK_MRIYA_FOLDER
echo "Plug the left side and double-click the reset button, press any key when ready..."
read -n 1 -s -r

BOOTLOADER_FOLDER=$(df --output=target | grep "NICENANO")
if [[ ! $BOOTLOADER_FOLDER ]]; then
  echo "Can't find folder NICENANO"
  exit 1
else
  echo "Copying into $BOOTLOADER_FOLDER"
fi
cp build/zephyr/zmk.uf2 $BOOTLOADER_FOLDER
sync

echo "Build right side"
uv run west build -p -b nice_nano -- -DSHIELD="mriya_right_secondary_display nice_view_adapter nice_view" -DZMK_CONFIG=$ZMK_MRIYA_FOLDER/zmk-mriya/config -DZMK_EXTRA_MODULES=$ZMK_MRIYA_FOLDER
echo "Plug the right side and double-click the reset button, press any key when ready..."
read -n 1 -s -r

BOOTLOADER_FOLDER=$(df --output=target | grep "NICENANO")
if [[ ! $BOOTLOADER_FOLDER ]]; then
  echo "Can't find folder NICENANO"
  exit 1
else
  echo "Copying into $BOOTLOADER_FOLDER"
fi
cp build/zephyr/zmk.uf2 $BOOTLOADER_FOLDER
sync
popd
