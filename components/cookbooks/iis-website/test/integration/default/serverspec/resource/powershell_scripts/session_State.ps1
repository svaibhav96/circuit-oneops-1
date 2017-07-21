Import-Module ServerManager
Import-Module WebAdministration

function session_state_cookiename
{
	param($name,$cookiename)
	$d=Get-WebConfigurationProperty  -Filter 'system.web/sessionstate' -name  cookiename -PSPath "IIS:\Sites\$($name)"
	$d=$d.value
	if( $d -eq $cookiename )
	{
	$true
	}
	else
	{
	$false
	}

}
function session_state_cookieless
{
	param($name,$cookieless)
	$a=(Get-WebConfigurationProperty  -Filter 'system.web/sessionstate' -name  cookieless -PSPath "IIS:\Sites\$($name)")
	if($a -eq $cookieless )
	{
	$true
	}
	else
	{
	$false
	}
}
function session_state_timeout
{
	param($name,$time_out)
	$b=Get-WebConfigurationProperty  -Filter 'system.web/sessionstate' -name  timeout -PSPath "IIS:\Sites\$($name)"
	$b=$b.value
	$b=$b.Minutes
	if($b -eq $time_out)
	{
	$true
	}
	else
	{
	$false
	}

}



#session_state "test1" "Cookieless" "Cookie name" 20
