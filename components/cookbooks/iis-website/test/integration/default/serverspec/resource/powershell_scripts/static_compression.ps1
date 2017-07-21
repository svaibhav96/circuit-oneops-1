function StaticCompression
{
  param($name)
  Import-Module ServerManager
	#Add-WindowsFeature Web-Scripting-Tools
	Import-Module WebAdministration
	$path=    "/system.WebServer/urlCompression"
	$anonAuth = Get-WebConfigurationProperty  -Filter $path -name doStaticCompression -PSpath "IIS:\Sites\$($name)"
	if( $anonAuth.value -eq $true )
	{
  $true
  }
	else
	{
	$false
	}

}
