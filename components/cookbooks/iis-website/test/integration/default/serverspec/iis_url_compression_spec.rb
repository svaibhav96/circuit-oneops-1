require 'spec_helper'

describe iis_urlcompression('iis-website-441810-1') do
  it{ should be_having_static_compression_enabled}
  it{ should be_having_dynamic_compression_enabled}
  it{ should be_having_dynamic_compression_before_cache_disabled}

end
