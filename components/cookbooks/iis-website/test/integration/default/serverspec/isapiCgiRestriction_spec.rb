require 'spec_helper'

describe iis_isapicgirestriction('iis-website-441810-1') do
  it{ should_not be_allowing_listed_isapis }
  it{ should_not be_allowing_listed_cgis  }


end
