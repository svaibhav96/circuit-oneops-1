require_relative 'execute_powershell.rb'
module Serverspec
  module Helper
    module Type
      def iis_isapicgirestriction (name)
        Serverspec::Type::IsApiCgiRestriction.new(name)
      end
    end
  end
end


module Serverspec
  module Type

    class IsApiCgiRestriction < Base

      def initialize(name)
       @name = name
      end

      def allowing_listed_isapis?
        script = ExecutePowershell.new("api_cgi_restriction.ps1", "not_listed_isapis_allowed" ,["#{@name}"])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end

      def allowing_listed_cgis?
        script = ExecutePowershell.new("api_cgi_restriction.ps1", "not_listed_cgis_allowed" ,["#{@name}"])
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
