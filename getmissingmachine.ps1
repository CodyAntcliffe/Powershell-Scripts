#Remove previous lists
Remove-Item C:\scripts\GetMissingMachines\exceptionList.txt
Remove-Item C:\scripts\GetMissingMachines\wsus.txt
Remove-Item C:\scripts\GetMissingMachines\net.txt

#Gets the elements we need from netview
net view > C:\scripts\GetMissingMachines\netviewdump.txt

foreach($string in Get-Content C:\scripts\GetMissingMachines\netviewdump.txt){
	if($string.StartsWith("\\")){                             
		$output = $string.Substring(2,($string.IndexOf(" ")-2))
		$output | out-file C:\scripts\GetMissingMachines\net.txt -append
	}
}

#Gets the elements from get-WSUSComputer
Get-WsusComputer | Format-Table -HideTableHeaders -Property FullDomainName | Out-File C:\scripts\GetMissingMachines\wsusdump.txt

foreach($string in Get-Content C:\scripts\GetMissingMachines\wsusdump.txt){
	if($string.length -gt 0){
		$output = $string.Substring(0,($string.IndexOf(" ")))
		$output | out-file C:\scripts\GetMissingMachines\wsus.txt -append
	}		
}

$check = "false"
foreach($wsusmach in Get-Content C:\scripts\GetMissingMachines\wsus.txt){
foreach($netmach in Get-Content C:\scripts\GetMissingMachines\net.txt){
if($wsusmach -Match $netmach){
$check = "true"}
}
if($check -eq "false"){
$wsusmach | Out-File C:\scripts\GetMissingMachines\exceptionList.txt -append}
$check = "false"
}




