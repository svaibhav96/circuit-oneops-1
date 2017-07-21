Import-Module ServerManager
Import-Module WebAdministration
function test_path
{
	param($directory1, $directory2)
	New-Item  $directory1\\r1r1.txt -type file
	$v1=Test-Path -Path $directory1\\r1r1.txt
	$v2=Test-Path -Path $directory2\\r1r1.txt
	Remove-Item $directory1\\r1r1.txt
	if($v1 -eq $true -and $v2 -eq $true)
	{$true}
	else
	{$false}
}
function iis_staticcompression_properties_mimeType
{
	param($name)
	$value2= @{"text/*" = "true"; "message/*" = "true"; "application/x-javascript" = "true" ; "application/atom+xml" = "true"; "application/json"= "true" ; "application/xml"="true"; "*/*"="false"}
	$path =    "/system.WebServer/httpCompression"
	$v = Get-WebConfigurationProperty  -Filter $path -name directory -PSPath "IIS:\Sites\${$name}"
	$sc_cpu_disable = (Get-WebConfigurationProperty  -Filter $path -name staticCompressionDisableCpuUsage -PSPath "IIS:\Sites\${$name}").value
	$sc_cpu_reenable = (Get-WebConfigurationProperty  -Filter $path -name staticCompressionEnableCpuUsage  -PSPath "IIS:\Sites\${$name}").value
	$t=(Get-WebConfiguration //system.WebServer/httpCompression -Location "IIS:\Sites\${$name}").collection
	$sc_directory=$v.value
	$sc_level=$t.staticCompressionLevel
	$sc_enabled=$t.doStaticCompression
	$sc_mime_types=(Get-WebConfiguration //system.WebServer/httpCompression/staticTypes -Location "IIS:\Sites\${$name}").collection

	$mime_count=0
	$value2.GetEnumerator() | % {
    $v1=$_.key
	if( ($sc_mime_types | ? { $_.mimeType -eq $v1 -and $value2[$v1] -eq $_.enabled   }) )
	{
	 $mime_count ++
    }
	}
	if($sc_enabled -eq $true -and $mime_count -eq $value2.count  )
	{$true}
	else
	{$false}

}
function iis_staticcompression_properties_level
{
	param($name,$level)

	$path =    "/system.WebServer/httpCompression"
	$v = Get-WebConfigurationProperty  -Filter $path -name directory -PSPath "IIS:\Sites\${$name}"
	$sc_cpu_disable = (Get-WebConfigurationProperty  -Filter $path -name staticCompressionDisableCpuUsage -PSPath "IIS:\Sites\${$name}").value
	$sc_cpu_reenable = (Get-WebConfigurationProperty  -Filter $path -name staticCompressionEnableCpuUsage  -PSPath "IIS:\Sites\${$name}").value
	$t=(Get-WebConfiguration //system.WebServer/httpCompression -Location "IIS:\Sites\${$name}").collection
	$sc_directory=$v.value
	$sc_level=$t.staticCompressionLevel
	$sc_enabled=$t.doStaticCompression
	$dc_mime_types=(Get-WebConfiguration //system.WebServer/httpCompression/staticTypes -Location "IIS:\Sites\${$name}").collection

	if($sc_enabled -eq $true -and $level -eq $sc_level )
	{$true}
	else
	{$false}

}
function iis_staticcompression_properties_cpu_disable
{
	param($name,$cpu_disable)

	$path =    "/system.WebServer/httpCompression"
	$v = Get-WebConfigurationProperty  -Filter $path -name directory -PSPath "IIS:\Sites\${$name}"
	$sc_cpu_disable = (Get-WebConfigurationProperty  -Filter $path -name staticCompressionDisableCpuUsage -PSPath "IIS:\Sites\${$name}").value
	$sc_cpu_reenable = (Get-WebConfigurationProperty  -Filter $path -name staticCompressionEnableCpuUsage  -PSPath "IIS:\Sites\${$name}").value
	$t=(Get-WebConfiguration //system.WebServer/httpCompression -Location "IIS:\Sites\${$name}").collection
	$sc_directory=$v.value
	$sc_level=$t.staticCompressionLevel
	$sc_enabled=$t.doStaticCompression
	$dc_mime_types=(Get-WebConfiguration //system.WebServer/httpCompression/staticTypes -Location "IIS:\Sites\${$name}").collection

	if($sc_enabled -eq $true -and  $cpu_disable -eq $sc_cpu_disable )
	{$true}
	else
	{$false}

}
function iis_staticcompression_properties_cpu_reenable
{
	param($name,$cpu_reenable)

	$path =    "/system.WebServer/httpCompression"
	$v = Get-WebConfigurationProperty  -Filter $path -name directory -PSPath "IIS:\Sites\${$name}"
	$sc_cpu_disable = (Get-WebConfigurationProperty  -Filter $path -name staticCompressionDisableCpuUsage -PSPath "IIS:\Sites\${$name}").value
	$sc_cpu_reenable = (Get-WebConfigurationProperty  -Filter $path -name staticCompressionEnableCpuUsage  -PSPath "IIS:\Sites\${$name}").value
	$t=(Get-WebConfiguration //system.WebServer/httpCompression -Location "IIS:\Sites\${$name}").collection
	$sc_directory=$v.value
	$sc_level=$t.staticCompressionLevel
	$sc_enabled=$t.doStaticCompression
	$dc_mime_types=(Get-WebConfiguration //system.WebServer/httpCompression/staticTypes -Location "IIS:\Sites\${$name}").collection

	if($sc_enabled -eq $true -and $cpu_reenable -eq $sc_cpu_reenable )
	{$true}
	else
	{$false}

}
