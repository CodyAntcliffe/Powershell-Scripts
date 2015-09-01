$PRINTERS = (get-wmiobject -q "select * from win32_printer")
foreach($printerName in $PRINTERS) {$printerName.psbase.delete()}