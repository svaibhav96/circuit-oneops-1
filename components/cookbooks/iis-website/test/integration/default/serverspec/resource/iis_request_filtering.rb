require_relative 'execute_powershell.rb'
module Serverspec
  module Helper
    module Type
      def iis_requestfiltering(name)
        Serverspec::Type::IisRequestFiltering.new(name)
      end
    end
  end
end


module Serverspec
  module Type

    class IisRequestFiltering < Base
      def initialize(name)
       @name = name
       @max_content_length=30000000
       @max_url_length=4096
       @max_query=2048
      end

      def having_defined_request_filtering_maximum_content_length?
        script = ExecutePowershell.new("iis_request_filtering.ps1", "iis_request_filtering_maximum_content_length" ,["#{@name}",@max_content_length])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end
      def having_defined_request_filtering_maximum_url_length?
        script = ExecutePowershell.new("iis_request_filtering.ps1", "iis_request_filtering_max_url_length" ,["#{@name}",@max_url_length])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end
      def having_defined_request_filtering_maximum_query?
        script = ExecutePowershell.new("iis_request_filtering.ps1", "iis_request_filtering_max_query" ,["#{@name}",@max_query])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end
      def having_verbs_allowunlisted_disabled?
        script = ExecutePowershell.new("iis_request_filtering.ps1", "iis_request_filtering_verbs_allowunlisted" ,["#{@name}"])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end

      def having_file_extensions_allowunlisted_enabled?
        script = ExecutePowershell.new("iis_request_filtering.ps1", "iis_request_filtering_file_extensions_allowunlisted" ,["#{@name}"])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end
      def having_request_filtering_double_escape_disabled?
        script = ExecutePowershell.new("iis_request_filtering.ps1", "iis_request_filtering_double_escape" ,["#{@name}"])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end
      def having_request_filtering_high_bit_charecters_enabled?
        script = ExecutePowershell.new("iis_request_filtering.ps1", "iis_request_filtering_high_bit_charecters" ,["#{@name}"])
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
