require_relative 'execute_powershell.rb'
module Serverspec
  module Helper
    module Type
      def static_compression(name)
        Serverspec::Type::StaticCompression.new(name)
      end
    end
  end
end


module Serverspec
  module Type

    class StaticCompression < Base

      def initialize(name)
       @name = name
      end

      def enabled?
        script = ExecutePowershell.new("static_compression.ps1", "StaticCompression" ,["#{@name}"])
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
