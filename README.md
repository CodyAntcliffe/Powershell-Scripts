# Powershell-Scripts

A collection of various PS scripts that I write in order to automate some processes at work.  

getMissingMachine
============================
This script creates a text file containing a list of machines on a network obtained by the 'net view' command, and then creates a text file containing a list of machines obtained by the Get-WSUSComputer command.
The script then compares the two lists, and creates a final text file containing any machine names thats do not appear in both lists.

This is useful to see if you are indeed administering patches to all machines.

