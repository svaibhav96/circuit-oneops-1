require_relative 'execute_powershell.rb'
module Serverspec
  module Helper
    module Type
      def dynamic_compression(name)
        Serverspec::Type::DynamicCompression.new(name)
      end
    end
  end
end


module Serverspec
  module Type

    class DynamicCompression < Base

      def initialize(name)
       @name = name
      end

      def enabled?
        script = ExecutePowershell.new("dynamic_compression.ps1", "DynamicCompression" ,["#{@name}"])
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
