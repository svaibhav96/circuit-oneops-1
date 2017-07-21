
function exist
{
	param($task)

	$taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -like $task }

	if($taskExists) {
		$true
	} else {
		$false
	}
}

exist "Consolidator"	