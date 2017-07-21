function not_listed_isapis_allowed
{
	param($name)
	$checkifenabled_api=Get-WebConfigurationProperty -Filter "/system.webServer/security/isapiCgiRestriction" -name notListedIsapisAllowed
	$checkifenabled_api_value=$checkifenabled_api.value

	$checkifenabled_cgi=Get-WebConfigurationProperty -Filter "/system.webServer/security/isapiCgiRestriction" -name notListedCgisAllowed
	$checkifenabled_cgi_value=$checkifenabled_cgi.value


	if($checkifenabled_api_value -eq $false )
	{
	$false
	}
	else
	{
	$true
	}

}



function not_listed_cgis_allowed
{
	param($name)
	$checkifenabled_api=Get-WebConfigurationProperty -Filter "/system.webServer/security/isapiCgiRestriction" -name notListedIsapisAllowed
	$checkifenabled_api_value=$checkifenabled_api.value

	$checkifenabled_cgi=Get-WebConfigurationProperty -Filter "/system.webServer/security/isapiCgiRestriction" -name notListedCgisAllowed
	$checkifenabled_cgi_value=$checkifenabled_cgi.value


	if($checkifenabled_cgi_value -eq $false)
	{
	$false
	}
	else
	{
	$true
	}

}
