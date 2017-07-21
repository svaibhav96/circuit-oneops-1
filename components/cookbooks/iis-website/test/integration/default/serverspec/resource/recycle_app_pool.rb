require_relative 'execute_powershell.rb'
module Serverspec
  module Helper
    module Type
      def recycle_app_pool(name)
        Serverspec::Type::RecycleOnEvents.new(name)
      end
    end
  end
end


module Serverspec
  module Type

    class RecycleOnEvents < Base
      def initialize(name)
       @name = name
      end
      def recycled_on_events?
        script = ExecutePowershell.new("recycle_app_pool.ps1", "iis_log_recycle" ,["#{@name}"])
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
