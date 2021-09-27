# Outline: Setting Up DeskMate Workgroup Companion

This is a brief outline of the steps needed to make Workgroup Companion work between two machines using serial connections.  Please note this document does not cover how to get the files onto your Tandy system.  For those of you with networked systems, this is the easiest method.  Otherwise, if both machines have serial ports, you can always use Microsoft Interlnk and Intersvr and a serial cable/null modem adapter combination between them.  

You can find the necessary software on tvdog's Tandy 1000 Archive: http://www.oldskool.org/guides/tvdog/deskmate.html

## Prerequisites

* Comfort with configuring MS-DOS and using its utilites.  This is not a "hand-holding" style How-To.  
* An FTP client or browser extension to download files from tvdog's Tandy 1000 Archive.  The site uses FTP, and newer browsers may not include the FTP extension by default.  Command-line FTP utilities will also suffice.
* DeskMate 3.02 (only, I had problems with all other versions I tried).
* The DeskMate Workgroup Companion software.
* Software/hardware connectivity to get the necessary files onto your Tandy system.
* A way to unzip the files from tvdog's archive onto your system (or extract them before you transfer if needed).
* Copies of **SHARE.EXE** and **PRINT.EXE** for your version of MS-DOS.  Becuase of the wide variety of configurations, I can't point you to any particular copies.  Be prepared to use SETVER if you need to (particularly for PRINT.EXE).  If you're going to use version-mismatched files, you'll need MS-DOS 5.0 or later.

## Download the necessary files

Download the following files from tvdog's Tandy 1000 Archive:

### DeskMate 3.02 Itself
dm302dk1.zip
dm302dk2.zip
dm302dk3.zip
dm302drv.zip

### DeskMate Workgroup Companion
deskwork.zip

### My Additional Files (for WGSETUP to complete on the server)
dmlink.zip (from this GitHub repo)

### Files you'll need to find according to your version of DOS
(Note that some versions of DOS include these files, others have one or more of them on Supplemental disks, and yet others may not include one or both of them.  You may have to get clever with copies from older DOS versions and SETVER.)<br/>
print.exe
share.exe

## Install DeskMate Workgroup Companion

You'll need to perform these steps on both systems.  Some steps apply only to the server side, which I'll note in the relevant steps.  Copy the ZIP files you downloaded to each Tandy machine.  After you do, perform the following steps:

1. Create two directories in the root of your C: drive: **DM302**(both systems) **DMLINK**(server only)
2. Extract each of the dm302dk**?**.zip files into C:\DM302
3. Extract the dm302drv.zip file into C:\DM302
4. Extract the deskwork.zip file into C:\DM302.  If asked to overwrite any files, say Yes.  If you're using PKUZIP, you can hit A instead of Y to avoid repeated prompts for subsequent file overwrites.
5. **(Server only)** Extract the dmlink.zip file into C:\DMLINK
6. Create **DESK.BAT** in the root directory of your C: drive with the following content:
```
SET DMCONFIG=C:\DM302
SET PATH=%PATH%;C:\DM302
CD \DM302
DESK
```
7. On the **server** machine, start DeskMate using the .BAT file you just created and run the WGSETUP.PDM program.  You can find this in the PROGRAMS list or by hitting F2, choosing Run, and typing WGSETUP.PDM when prompted. 
8. Set the **Connection** Settings by giving the system a client name (8 characters or less) and choosing **RS-232** as the connection type.
9. Set the **Options** as follows: **Remote Load**: Yes (**No** on the server), **Notification**: Yes, **Remote Print**: No.
10. Set the **RS-232 Options** as follows: **PORT**: [Your COM port; probably COM1:], **Baud Rate**: 19200 (lower if you have issues)
11. Leave **Network Options** set to the defaults.
12. In **Servers**, set up as follows: **Name**: WRKGROUP (on the server) or whatever name you chose in Step 8 for the client, **File Server**: Yes, **Print Server**: No, **Database Server**: Yes (Server, choose No for client), **Drive**: C
13. Hit ESC to exit.  Following the file checks, you'll be informed of the need to restart your system.  If you get errors that the following files couldn't be verified, double-check that you extracted the contents of dmlink.zip into the correct directory on the server system (see Step 5): **DBSTATUS.EXE NETINIT.COM NETWORK.CAL SHARED.ADR**
14. Exit DeskMate.
15. Edit your DM302.BAT file, and add the following line:
```
SET DMCONFIG=C:\DM302
SET PATH=%PATH%;C:\DM302
CD \DM302
WRKGROUP.EXE
DESK
```
16. Restart DeskMate using the newly-updated DM302.BAT file.  You should see WRKGROUP.EXE run and set up the netowrk.  At this point, DeskMate should start.  If you open the Communications accessory (F10 -> Setup), and then open the Communications settings, you should see your chosen serial port greyed out and with a notation that it's in use by Workgroup.
17.  Repeat all steps above on the client machine, skipping Step **5** (dmlink.zip is not needed on client systems).  The only differences are you'll set **Database Server** to No and the server name in **Servers** to the same name as the **Client** name. 
18.  At this point, both systems should be running DeskMate 3.02 with Workgroup Companion enabled.  

## Notes

* After WRKGROUP.EXE is loaded, it cannot be unloaded and reloaded.  If you make changes in WGSETUP.PDM, you must restart your system for the changes to take effect.
* The dmlink directory and ZIP file are only needed on the server side.
* If you set up the File Server on the client system, its name will be the same as the Client name you chose.  On the server, the File Server name must be **WRKGROUP**.
