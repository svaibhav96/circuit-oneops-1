require 'spec_helper'

describe iis_requestfiltering('iis-website-441810-1') do

  it{ should be_having_defined_request_filtering_maximum_content_length}
  it{ should be_having_defined_request_filtering_maximum_url_length}
  it{should be_having_defined_request_filtering_maximum_query}
  it{should be_having_verbs_allowunlisted_disabled}
  it{should be_having_file_extensions_allowunlisted_enabled}
  it{should be_having_request_filtering_double_escape_disabled}
  it{should be_having_request_filtering_high_bit_charecters_enabled}

end
