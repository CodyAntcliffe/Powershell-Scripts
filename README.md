# Powershell-Scripts

A collection of various PS scripts that I write in order to automate some processes at work.  

remove-printerDevices
=====================

A (very) short and simple PowerShell script for removing all printer devices on your computer.

We have several printers on our network, and for several of our clients only a local USB connected printer is necessary.  In order to eliminate any confusion as to which printer to choose, this script will delete any printers currently installed on the machine, leaving a clean slate for which to install/ plug-in necessary printer. This also removes the annoying (copy X) instance of the local printer.  

*Making This Execute On Login:*

I have this set on the necessary work machines to execute everytime the user logs in. Here is a list of instructions on how to make this happen:
https://docs.google.com/document/d/1DZGDfW5Fp33dQLZ1SVfKKGLmb7kwJjfx5Kd6DyuOQNA/edit?usp=sharing

getMissingMachine
============================
This script creates a text file containing a list of machines on a network obtained by the 'net view' command, and then creates a text file containing a list of machines obtained by the Get-WSUSComputer command.
The script then compares the two lists, and creates a final text file containing any machine names thats do not appear in both lists.

This was useful to us since it made it obvious which machines on our network weren't getting targeted for updates through WSUS.
