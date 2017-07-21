require 'spec_helper'

describe url_compression('iis-website-441810-1') do
  it{ should be_having_desired_maximum_diskusage_for_compression}
  it{ should be_having_desired_min_filesize_for_compression}
  it{ should be_having_desired_directory_location}

end
