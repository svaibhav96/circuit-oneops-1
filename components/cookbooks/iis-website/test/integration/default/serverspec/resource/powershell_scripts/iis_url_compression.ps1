Import-Module ServerManager
#Add-WindowsFeature Web-Scripting-Tools
Import-Module WebAdministration


function iis_static_compression
{
	param ( $name  )

	$path =    "/system.WebServer/urlCompression"
	$do_sc_compression = (Get-WebConfigurationProperty  -Filter $path -name doStaticCompression -PSPath "IIS:\Sites\${$name}").value
	if($do_sc_compression -eq $true  )
	{$true}
	else
	{$false}
}

function iis_dynamic_compression
{
	param ( $name )

	$path =    "/system.WebServer/urlCompression"
	$do_dc_compression = (Get-WebConfigurationProperty  -Filter $path -name doDynamicCompression -PSPath "IIS:\Sites\${$name}").value
	if($do_dc_compression -eq $true )
	{$true}
	else
	{$false}
}

function iis_dynamic_compression_before_cache
{
	param ( $name , $dc_before_cache)
	$path =    "/system.WebServer/urlCompression"
	$do_dc_before_cache=(Get-WebConfigurationProperty  -Filter $path -name dynamicCompressionBeforeCache -PSPath "IIS:\Sites\${$name}").value
	if($do_dc_before_cache-eq  $true    )
	{$true}
	else
	{$false}
}
