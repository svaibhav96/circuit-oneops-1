require_relative 'execute_powershell.rb'
module Serverspec
  module Helper
    module Type
      def iis_urlcompression(name)
        Serverspec::Type::IisUrlCompression.new(name)
      end
    end
  end
end


module Serverspec
  module Type

    class IisUrlCompression < Base

      def initialize(name)
       @name = name
      end

      def having_static_compression_enabled?
        script = ExecutePowershell.new("iis_url_compression.ps1", "iis_static_compression" ,["#{@name}"])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end
      def having_dynamic_compression_enabled?
        script = ExecutePowershell.new("iis_url_compression.ps1", "iis_dynamic_compression" ,["#{@name}"])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end
      def having_dynamic_compression_before_cache_disabled?
        script = ExecutePowershell.new("iis_url_compression.ps1", "iis_dynamic_compression_before_cache" ,["#{@name}"])
        output = script.exec
        if(output.downcase == 'true')
          return false
        else
          return true
        end
      end

    end

  end
end
