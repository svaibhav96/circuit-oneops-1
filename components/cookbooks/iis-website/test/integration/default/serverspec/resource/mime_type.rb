require_relative 'execute_powershell.rb'
module Serverspec
  module Helper
    module Type
      def mime_type(name)
        Serverspec::Type::MimeType.new(name)
      end
    end
  end
end


module Serverspec
  module Type

    class MimeType < Base

      def initialize(name)
       @name = name
      end

      def having_defined_mime_types?
        #$value2= @{".dat" = "application/text" ; ".fat" = "application/octet-stream"}
        script = ExecutePowershell.new("mime_type.ps1", "FindMimeType" ,["#{@name}"])
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
