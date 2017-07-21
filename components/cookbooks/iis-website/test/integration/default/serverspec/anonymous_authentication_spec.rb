#require_relative "execute_powershell.rb"
#script = ExecutePowershell.new("annonymous_authentication.ps1", "Anonymous_authentication" ,["iis-website-441810-1"])
#puts script.exec
require 'spec_helper'
require_relative 'resource/anonymous_authentication.rb'



describe anonymous_authentication('iis-website-441810-1') do
  it { should be_enabled }
end
