require 'spec_helper'


describe windows_registry_key('HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\SSL 2.0\\Client') do
  it { should exist }
  it { should have_property_value('DisabledByDefault', :REG_DWORD, '1') }
  it { should have_property_value('Enabled', :REG_DWORD, '0') }
end

describe windows_registry_key('HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\SSL 2.0\\Server') do
  it { should exist }
  it { should have_property_value('DisabledByDefault', :REG_DWORD, '1') }
  it { should have_property_value('Enabled', :REG_DWORD, '0') }
end

describe windows_registry_key('HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\SSL 3.0\\Client') do
  it { should exist }
  it { should have_property_value('DisabledByDefault', :REG_DWORD, '1') }
  it { should have_property_value('Enabled', :REG_DWORD, '0') }
end

describe windows_registry_key('HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols\\SSL 3.0\\Server') do
  it { should exist }
  it { should have_property_value('DisabledByDefault', :REG_DWORD, '1') }
  it { should have_property_value('Enabled', :REG_DWORD, '0') }
end
