require 'spec_helper'

describe iis_app_pool('iis-website-441810-1') do
  it{ should exist }
  it{should have_identity_type('ApplicationPoolIdentity') }
  it{ should_not have_identity_type('SpecificUser') }
  it{should have_dotnet_version('4.0') }
end


#custom resource

describe recycle_app_pool('iis-website-441810-1') do
  it {should be_recycled_on_events}
end
