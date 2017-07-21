require 'spec_helper'

describe static_compression_properties('iis-website-441810-1') do
  #it{ should be_having_defined_static_mime_types}
  it{ should be_having_defined_level}
  it{ should be_having_defined_sc_cpu_usage_to_disable}
  it{should be_having_defined_sc_cpu_usage_to_reenable}
end
