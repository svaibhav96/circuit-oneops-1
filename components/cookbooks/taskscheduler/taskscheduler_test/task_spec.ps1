
function config()
{
	param($name)
	$task=Get-ScheduledTask -TaskName "$($name)"
	$task_state=$task.State
	$Trigger=($task.Triggers | select *)
	$trigger_enabled=$Trigger.Enabled
	$trigger_start_boundary=$Trigger.StartBoundary
	$principal=$task.Principal
	$description = $task.Description
	$action=$task.actions.Execute
	$user_id= $principal.UserId
	$path = $task.taskpath
	$frequency=$Trigger=($task.Triggers | select *).repetition
	$arguements=$task.actions.arguements
	$exec_time_limit= $Trigger.ExecutionTimeLimit
	$frequency_duration=$frequency.Duration
	$frequency_interval=$frequency.Interval

	
	$task_state
	$trigger_enabled
	$trigger_start_boundary

	$description
	$action
	$user_id
	$path
	$frequency_duration
	$frequency_interval
	$arguements
	$exec_time_limit
}
#$task
#$taskTrigger = $task.Triggers
#$taskTrigger



config "Consolidator"
