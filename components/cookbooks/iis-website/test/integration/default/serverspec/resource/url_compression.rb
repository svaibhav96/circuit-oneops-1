require_relative 'execute_powershell.rb'
module Serverspec
  module Helper
    module Type
      def url_compression(name)
        Serverspec::Type::UrlCompression.new(name)
      end
    end
  end
end


module Serverspec
  module Type

    class UrlCompression < Base

      def initialize(name)
       @name = name
       @compression_max_disk_usage =100
       @compression_min_file_size=2400
       @directory="c:\\logs\\IISTemporaryCompressedFiles"
      end

      def having_desired_maximum_diskusage_for_compression?
        script = ExecutePowershell.new("url_compression.ps1", "iis_compression_max_disk_usage" ,["#{@name}",@compression_max_disk_usage])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end

      def having_desired_min_filesize_for_compression?
        script = ExecutePowershell.new("url_compression.ps1", "iis_compression_min_size_to_compress" ,["#{@name}",@compression_min_file_size])
        output = script.exec
        if(output.downcase == 'true')
          return true
        else
          return false
        end
      end



      def having_desired_directory_location?
        script = ExecutePowershell.new("url_compression.ps1", "iis_compression_directory" ,["#{@name}",@directory])
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
