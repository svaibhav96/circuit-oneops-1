Import-Module ServerManager
Import-Module WebAdministration
function iis_request_filtering_maximum_content_length
{
	param($name , $max_content_length)
	$var= Get-WebConfigurationProperty -Filter "/system.webServer/security/requestfiltering" -name requestLimits -PSPath "IIS:\Sites\$($name)"
	$max_allowed_content_length= $var.maxAllowedContentLength
	if( $max_allowed_content_length -eq $max_content_length)
	{ $true }
	else
	{ $false }

}

function iis_request_filtering_max_url_length
{
	param($name ,$max_url_length)
	$var= Get-WebConfigurationProperty -Filter "/system.webServer/security/requestfiltering" -name requestLimits -PSPath "IIS:\Sites\$($name)"
	$maximum_URL_length =$var.maxUrl

	if( $maximum_URL_length -eq  $max_url_length	)
	{ $true }
	else
	{ $false }
}

function iis_request_filtering_max_query
{
	param($name ,$max_query)
	$var= Get-WebConfigurationProperty -Filter "/system.webServer/security/requestfiltering" -name requestLimits -PSPath "IIS:\Sites\$($name)"
  $max_query_string = $var.maxQueryString

	if($max_query_string -eq  $max_query)
	{ $true }
	else
	{ $false }



}
function iis_request_filtering_verbs_allowunlisted
{
	param($name)
	$verbs= Get-WebConfigurationProperty -Filter "/system.webServer/security/requestfiltering" -name verbs -PSPath "IIS:\Sites\$($name)"
	if( $verbs.allowUnlisted -eq $true )
	{ $true }
	else
	{ $false }
}

function iis_request_filtering_file_extensions_allowunlisted
{
	param($name)
	$file_extensions= Get-WebConfigurationProperty -Filter "/system.webServer/security/requestfiltering" -name fileextensions -PSPath "IIS:\Sites\$($name)"
	if($file_extensions.allowUnlisted -eq $true)
	{ $true }
	else
	{ $false }
}

function iis_request_filtering_double_escape
{
	param($name)
	$double_escape= Get-WebConfigurationProperty -Filter "/system.webServer/security/requestfiltering" -name allowdoubleescaping -location "IIS:\Sites\$($name)"
	if($double_escape.Value -eq $false )
	{ $true }
	else
	{ $false }
}

function iis_request_filtering_high_bit_charecters
{
	param($name)
	$high_bit_character= Get-WebConfigurationProperty -Filter "/system.webServer/security/requestfiltering" -name allowhighbitcharacters -location "IIS:\Sites\$($name)"
	if($high_bit_character.Value -eq $true)
	{ $true }
	else
	{ $false }

}
