require_relative 'execute_powershell.rb'
module Serverspec
  module Helper
    module Type
      def anonymous_authentication(name)
        Serverspec::Type::AnonymousAuthentication.new(name)
      end
    end
  end
end


module Serverspec
  module Type

    class AnonymousAuthentication < Base

      def initialize(name)
       @name = name
      end

      def enabled?
        script = ExecutePowershell.new("anonymous_authentication.ps1", "Anonymous_authentication" ,["#{@name}"])
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
