require 'spec_helper'

features = [
  'Web-Default-Doc',
  'Web-Http-Errors',
  'Web-Static-Content',
  'Web-Http-Redirect',
  'Web-Http-Logging',
  'Web-Request-Monitor',
  'Web-Http-Tracing',
  'Web-Stat-Compression',
  'Web-Dyn-Compression',
  'Web-Filtering',
  'Web-Basic-Auth',
  'Web-Windows-Auth',
  'Web-Net-Ext',
  'Web-Net-Ext45',
  'Web-Asp-Net',
  'Web-Asp-Net45',
  'Web-ISAPI-Ext',
  'Web-ISAPI-Filter',
  'Web-Mgmt-Console',
  'Web-Scripting-Tools',
  'Web-Mgmt-Service',
  'Net-Framework-Core',
  'NET-Framework-45-Core',
  'NET-Framework-45-ASPNET',
  'Web-AppInit'
]

features.each do |feature|
  describe windows_feature(feature) do
    it { should be_installed.by("powershell") }
  end
end
