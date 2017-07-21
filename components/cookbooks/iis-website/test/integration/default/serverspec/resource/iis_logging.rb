require_relative 'execute_powershell.rb'
module Serverspec
  module Helper
    module Type
      def iis_logging(name)
        Serverspec::Type::IisLogging.new(name)
      end
    end
  end
end


module Serverspec
  module Type

    class IisLogging < Base

      def initialize(name)
       @name = name
       @logFormat="W3C"
       @directory="c:\\logs"
       @enabled="True"
       @period= "daily"
       @logTargetW3C="File"
      end

      def having_defined_log_format?
        script = ExecutePowershell.new("iis_logging.ps1", "iis_Logging_log_format" ,["#{@name}",@logFormat])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end
      def having_defined_log_directory?
        script = ExecutePowershell.new("iis_logging.ps1", "iis_logging_log_directory" ,["#{@name}",@directory])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end
      def having_log_directory_enabled?
        script = ExecutePowershell.new("iis_logging.ps1", "iis_logging_log_enabled" ,["#{@name}",@enabled])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end
      def having_defined_log_period?
        script = ExecutePowershell.new("iis_logging.ps1", "iis_logging_log_period" ,["#{@name}",@period])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end

      def having_defined_logtarget?
        script = ExecutePowershell.new("iis_logging.ps1", "iis_logging_log_logtarget" ,["#{@name}",@logTargetW3C])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end

    end

  end
end
