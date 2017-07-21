require 'serverspec'

require_relative 'resource/anonymous_authentication.rb'
require_relative 'resource/dynamic_compression.rb'
require_relative 'resource/static_compression.rb'
require_relative 'resource/recycle_app_pool.rb'
require_relative 'resource/session_state.rb'
require_relative 'resource/mime_type.rb'
require_relative 'resource/api_cgi_restriction.rb'
require_relative 'resource/iis_url_compression.rb'
require_relative 'resource/url_compression.rb'
require_relative 'resource/iis_sc_compression_properties.rb'
require_relative 'resource/iis_dc_compression_properties.rb'
require_relative 'resource/iis_logging.rb'
require_relative 'resource/iis_request_filtering.rb'

set :backend, :cmd
set :os, :family => 'windows'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html,:documentation
                                    # :json, CustomFormatterClass
end
