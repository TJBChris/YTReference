# XTIDE Universal BIOS ROM images for Tandy Computers

This folder contains ROM images for the XTIDE Universal BIOS images for some of my Tandy computers.

Images (by folder):

## 1000RLX
* 1000rlx_xtide_rom.bin - 1000 RLX XT-IDE Universal BIOS offset by 4000H (set card to C800H, this will cause ROM to show up at CC00H).  Be sure to use SETUPRLX.COM to set the boot device to Disk and disconnect the internal XTA hard disk.  This is a 128K ROM image; trim as-needed for your part.
* 1000rlx_xtide_no_offset.bin - 1000 RLX XT-IDE Universal BIOS with no offset (starts at ROM address 0000H), with the remainder of ROM filled with FFH.  Set the card to D800H (for XT-CF-lite cards, JP1-1 open).  Within SETUPRLX.COM, set boot device to Disk and disconnect any internal XTA hard disk.  This is a 128K image; trim as-needed for your part.
* 1000rlx_xtide_rom_repeating.bin - 1000 RLX XT-IDE Universal BIOS with the BIOS repeating over and over on the 2K boundaries the BIOS checks for.  This, if I got it right, has the most chance of success.  Set the card to D800H (for XT-CF-lite cards, JP1-1 open).  Within SETUPRLX.COM, set boot device to Disk and disconnect any internal XTA hard disk.  This is a 128K image; trim as-needed for your part.

That's it for now...
