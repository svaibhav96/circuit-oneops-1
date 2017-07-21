
#(Get-Service 'winmgmt').StartType

#(Get-Credential "winmgmt").Username

function config()
{
	param($service)

	New-PSDrive -PSProvider registry -Root HKEY_Local_Machine -Name HKCR
	$service_name=(Get-Service 'Server').name
	$p="HKCR:\SYSTEM\CurrentControlSet\Services\$($service_name)"
	$status=(Get-Service "$($service)").Status
	$start_type=(Get-Service 'Workstation').StartType
	$path = (Get-ItemProperty  $p).ImagePath
	#$username = (Get-Credential "$($service)").Username
	Get-Credential "$($service)"



	#$username
	$path
	$start_type
	$status
	$service_name

}

config("Server")
