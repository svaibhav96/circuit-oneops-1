function Anonymous_authentication
{
	param($name)
	$anonAuthFilter =    "/system.WebServer/security/authentication/AnonymousAuthentication"
	$anonAuth = Get-WebConfigurationProperty  -Filter $anonAuthFilter -name Enabled -PSpath "IIS:\Sites\$($name)"
	#$anonAuth.value
	$var= $true
	if($anonAuth.value -eq $var)
	{
	$true
	}
	else
	{
	$false
	}

}
