Import-Module ServerManager
Import-Module WebAdministration
function iis_Logging_log_format
{
	param([string]$site_name,[string] $log_format)

	$s = ($site_name )
	$site = Get-Item "IIS:\Sites\$($s)"
	$logdir = $site.logfile
	if( $log_format -eq $logdir.logFormat	)
	{
	$true
	}
	else
	{
	$false
	}


}
function iis_logging_log_directory
{
	param([string]$site_name, [string]$log_directory)

	$s = ($site_name )
	$site = Get-Item "IIS:\Sites\$($s)"
	$logdir = $site.logfile

	if(  $logdir.directory -eq $log_directory)
	{
	$true
	}
	else
	{
	$false
	}


}

function iis_logging_log_enabled
{
	param([string]$site_name,[string]$log_enabled)

	$s = ($site_name)
	$site = Get-Item "IIS:\Sites\$($s)"
	$logdir = $site.logfile
	if( $log_enabled -eq $logdir.enabled )
	{
	$true
	}
	else
	{
	$false
	}


}
function iis_logging_log_period
{
	param([string]$site_name,[string]$log_period)

	$s = ($site_name )
	$site = Get-Item "IIS:\Sites\$($s)"
	$logdir = $site.logfile
	if(  $log_period -eq $logdir.period )
	{
	$true
	}
	else
	{
	$false
	}


}
function iis_logging_log_logtarget
{
	param([string]$site_name,$logtargetw3C)

	$s = ($site_name )
	$site = Get-Item "IIS:\Sites\$($s)"
	$logdir = $site.logfile
	if($logtargetw3C -eq $logdir.logTargetW3C	)
	{
	$true
	}
	else
	{
	$false
	}


}
