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
function iis_dynamiccompression_properties_mimeType
{
	param($name)
	$value2= @{"text/*" = "true" ; "message/*" = "true"; "application/x-javascript" = "true" ;  "application/xml"= "true" ; "*/*"="false"}
	$path =    "/system.WebServer/httpCompression"
	$t=(Get-WebConfiguration //system.WebServer/httpCompression -Location "IIS:\Sites\${$name}").collection
	$dc_enabled=$t.doDynamicCompression
	$dc_mime_types=(Get-WebConfiguration //system.WebServer/httpCompression/dynamicTypes -Location "IIS:\Sites\${$name}").collection

	$mime_count=0
	$value2.GetEnumerator() | % {
    $v1=$_.key
	if( ($dc_mime_types | ? { $_.mimeType -eq $v1 -and $value2[$v1] -eq $_.enabled   }) )
	{
	 $mime_count ++
    }
	}

	if($dc_enabled -eq $true -and $mime_count -eq $value2.count  )
	{$true}
	else
	{$false}

}
function iis_dynamiccompression_properties_level
{
	param($name,$level)

	$path =    "/system.WebServer/httpCompression"
	$t=(Get-WebConfiguration //system.WebServer/httpCompression -Location "IIS:\Sites\${$name}").collection
	$dc_level=$t.dynamicCompressionLevel
	$dc_enabled=$t.doDynamicCompression

	if($dc_enabled -eq $true -and $level -eq $dc_level )
	{$true}
	else
	{$false}

}
function iis_dynamiccompression_properties_cpu_disable
{
	param($name,$cpu_disable)

	$path =    "/system.WebServer/httpCompression"
	$dc_cpu_disable = (Get-WebConfigurationProperty  -Filter $path -name dynamicCompressionDisableCpuUsage -PSPath "IIS:\Sites\${$name}").value
	$t=(Get-WebConfiguration //system.WebServer/httpCompression -Location "IIS:\Sites\${$name}").collection
	$dc_enabled=$t.doDynamicCompression
	if($dc_enabled -eq $true -and $cpu_disable -eq $dc_cpu_disable )
	{$true}
	else
	{$false}

}
function iis_dynamiccompression_properties_cpu_reenable
{
	param($name,$cpu_reenable)

	$path =    "/system.WebServer/httpCompression"
	$dc_cpu_reenable = (Get-WebConfigurationProperty  -Filter $path -name dynamicCompressionEnableCpuUsage  -PSPath "IIS:\Sites\${$name}").value
	$t=(Get-WebConfiguration //system.WebServer/httpCompression -Location "IIS:\Sites\${$name}").collection
	$dc_enabled=$t.doDynamicCompression

	if($dc_enabled -eq $true -and $cpu_reenable -eq $dc_cpu_reenable)
	{$true}
	else
	{$false}

}

#iis_dynamiccompression_properties "test1" $dc_mime_types 0 90 50 "e:\logs\IISTemporaryCompressedFiles"
