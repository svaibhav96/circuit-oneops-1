function test_path
{
	param($directory1, $directory2)
	New-Item  "$($directory1)\\r1r1.txt" -type file
	$v1=Test-Path -Path $directory1\\r1r1.txt
	$v2=Test-Path -Path $directory2\\r1r1.txt
	#Remove-Item $directory1\\r1r1.txt
	if($v1 -eq $true -and $v2 -eq $true)
	{$true}
	else
	{$false}
}
function iis_compression_max_disk_usage
{
	param ( $name , $max_disk_usage)

	$path =    "/system.WebServer/httpCompression"
	$site_max_disk_usage =  (Get-WebConfigurationProperty  -Filter $path -name maxDiskSpaceUsage -PSPath "IIS:\Sites\${$name}").value
	$site_enabled=((Get-WebConfiguration //system.WebServer/httpCompression -Location "IIS:\Sites\${$name}").collection).doStaticCompression

	if($site_enabled -eq $true -and $site_max_disk_usage -eq $max_disk_usage)
	{$true}
	else
	{$false}


}
function iis_compression_min_size_to_compress
{
	param ( $name ,$min_size_to_compress )

	$path =    "/system.WebServer/httpCompression"
	$site_min_file_size = (Get-WebConfigurationProperty  -Filter $path -name minFileSizeForComp -PSPath "IIS:\Sites\${$name}").value
	$site_enabled=((Get-WebConfiguration //system.WebServer/httpCompression -Location "IIS:\Sites\${$name}").collection).doStaticCompression

	if($site_enabled -eq $true -and $site_min_file_size -eq $min_size_to_compress  )
	{$true}
	else
	{$false}



}
function iis_compression_directory
{
	param ( $name ,$directory)

	$path =    "/system.WebServer/httpCompression"
	$site_enabled=((Get-WebConfiguration //system.WebServer/httpCompression -Location "IIS:\Sites\${$name}").collection).doStaticCompression
	$sc_directory = (Get-WebConfigurationProperty  -Filter $path -name directory -PSPath "IIS:\Sites\${$name}").value


	if($site_enabled -eq $true -and $sc_directory -eq $directory)
	{$true}
	else
	{$false}

}
