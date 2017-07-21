function iis_log_recycle
{
  param($name)
  Import-Module ServerManager
  #Add-WindowsFeature Web-Scripting-Tools
  Import-Module WebAdministration

	$v2= @("Time", "Requests", "Schedule", "Memory", "IsapiUnhealthy", "OnDemand", "ConfigChange", "PrivateMemory")
	$ans=Get-ItemProperty ("IIS:\AppPools\$($name)") -Name recycling.logEventOnRecycle
	$b = $ans.replace(' ','').split(',')
	$c=Compare-Object $v2 $b | ForEach-Object { $_.InputObject }
	if($c.count -gt 0)
	{$false}
	else
	{$true}

}
