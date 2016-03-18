include_recipe 'playapp::wire_ci_attr'
playapp "playApp" do
        http_port node['playapp']['http_port']#80
        #https_port node['playapp']['https_port']
#        application_conf node['playapp']['application_conf_file'] #"application.conf"
#        log_file node['playapp']['log_file'] #"logger.xml"
        app_opts node['playapp']['app_opts'] #"-Xms1024M -Xmx2048M -Xss1M -XX:MaxPermSize=856M"
        app_name node['playapp']['app_name']
        app_dir node['playapp']['app_dir']
	app_secret node['playapp']['app_secret']
        app_location node['playapp']['app_location']
    action :deploy
    
end
