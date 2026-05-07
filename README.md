# discord-update
Downloads and updates Discord

## Usage
Add executable permissions after downloading (just once)

`chmod +x discord-update.sh`

Run the script from its directory:

`./discord-update.sh`

You can also copy it to `/usr/local/bin` to run it globally:

`sudo cp discord-update.sh /usr/local/bin`

## Notes
By default, the script compares the installed Discord version with the latest version available on the official Discord website.

To skip the version check and force an update, use the `--force` flag:

`./discord-update.sh --force`
