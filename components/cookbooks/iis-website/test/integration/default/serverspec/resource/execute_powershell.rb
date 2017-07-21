class ExecutePowershell

  def initialize file_name, function_name, arguments
    @arguments = arguments.join(' ')
    @file_name = file_name
    @function_name = function_name
    @path = File.join(File.dirname(__FILE__), "/powershell_scripts/#{file_name}")
  end

  def exec
    powershell_command = "powershell -command '& { . #{ @path }; #{@function_name} #{@arguments} }'"
    output = `powershell.exe  #{powershell_command}`
    output.chomp
  end
end
