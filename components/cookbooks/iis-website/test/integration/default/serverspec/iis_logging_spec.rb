require 'spec_helper'

describe iis_logging('iis-website-441810-1') do
  it{ should be_having_defined_log_format}
  it{ should be_having_log_directory_enabled}
  it{should be_having_defined_log_directory}
  it{should be_having_defined_log_period}
  it{should be_having_defined_logtarget}

end
