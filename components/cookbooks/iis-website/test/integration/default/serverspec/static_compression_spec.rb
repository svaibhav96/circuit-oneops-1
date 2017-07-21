require 'spec_helper'
require_relative 'resource/static_compression.rb'

describe static_compression('iis-website-441810-1') do
  it { should be_enabled }
end
