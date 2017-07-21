require 'spec_helper'
require_relative 'resource/dynamic_compression.rb'

describe dynamic_compression('iis-website-441810-1') do
  it { should be_enabled }
end
