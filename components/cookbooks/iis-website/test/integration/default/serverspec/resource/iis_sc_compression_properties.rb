require_relative 'execute_powershell.rb'
module Serverspec
  module Helper
    module Type
      def static_compression_properties(name)
        Serverspec::Type::StaticCompressionProperties.new(name)
      end
    end
  end
end


module Serverspec
  module Type

    class StaticCompressionProperties < Base

      def initialize(name)
       @name = name
       @level=7
       @cpu_disable=90
       @cpu_reenable=50
      end

      def having_defined_static_mime_types?
        #$value2= @{".dat" = "application/text" ; ".fat" = "application/octet-stream"}
        script = ExecutePowershell.new("iis_sc_properties.ps1", "iis_staticcompression_properties_mimeType" ,["#{@name}"])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end

      def having_defined_level?
        #$value2= @{".dat" = "application/text" ; ".fat" = "application/octet-stream"}
        script = ExecutePowershell.new("iis_sc_properties.ps1", "iis_staticcompression_properties_level" ,["#{@name}",@level])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end

      def having_defined_sc_cpu_usage_to_disable?
        #$value2= @{".dat" = "application/text" ; ".fat" = "application/octet-stream"}
        script = ExecutePowershell.new("iis_sc_properties.ps1", "iis_staticcompression_properties_cpu_disable" ,["#{@name}",@cpu_disable])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end

      def having_defined_sc_cpu_usage_to_reenable?
        #$value2= @{".dat" = "application/text" ; ".fat" = "application/octet-stream"}
        script = ExecutePowershell.new("iis_sc_properties.ps1", "iis_staticcompression_properties_cpu_reenable" ,["#{@name}",@cpu_reenable])
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
