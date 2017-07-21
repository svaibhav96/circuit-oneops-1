Import-Module ServerManager
Import-Module WebAdministration

function FindMimeType
{
	param($name)
	$value2= @{".dat" = "application/text" ; ".fat" = "application/octet-stream"}
	$count=0

	$g=(Get-WebConfiguration //staticcontent "IIS:\Sites\$($name)").collection

	foreach($key in $value2.keys)
	{
		for ($i=0
		$i -le $g.count
		$i++)
		{
			if($g[$i].fileextension -eq $key )
			{
				$count++
			}
		}
		}
	if($count -eq $value2.count)
	{
		$true
	}
	else
	{
		$false
	}

}

#FindMimeType "iis-website-441810-1"
