package 'nginx' do
  action :install
end

service 'nginx.service' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

cookbook_file '/opt/edit_nginx_config.rb' do
  source 'nginx.rb'
  owner  'root'
  group  'root'
  mode   '755'
end

execute "edit nginx config" do
  command '/opt/edit_nginx_config.rb'
end

service 'nginx.service' do
  action :restart
end

execute 'open nginx port' do
  command 'firewall-cmd --zone=public --permanent --add-service=http && firewall-cmd --reload'
end
