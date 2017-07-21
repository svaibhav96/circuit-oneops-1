require_relative 'execute_powershell.rb'
module Serverspec
  module Helper
    module Type
      def session_state(name)
        Serverspec::Type::SessionState.new(name)
      end
    end
  end
end


module Serverspec
  module Type

    class SessionState < Base

      def initialize(name)
       @name = name
      end

      def having_desired_cookiename?
        script = ExecutePowershell.new("session_state.ps1", "session_state_cookiename" ,["#{@name}" , "ASP.NET_SessionId"])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end

      def having_desired_cookieless?
        script = ExecutePowershell.new("session_state.ps1", "session_state_cookieless" ,["#{@name}" , "UseCookies"])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end

      def having_desired_timeout?
        script = ExecutePowershell.new("session_state.ps1", "session_state_timeout" ,["#{@name}" , 20])
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
