require 'spec_helper'

describe session_state('iis-website-441810-1') do
  it{ should be_having_desired_cookiename }
  it{ should be_having_desired_cookieless }
  it{ should be_having_desired_timeout}

end
