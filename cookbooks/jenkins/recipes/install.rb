cookbook_file '/opt/install_java.sh' do
  source 'java.sh'
  owner  'root'
  group  'root'
  mode   '755'
end

cookbook_file '/opt/install_jenkins.sh' do
  source 'jenkins.sh'
  owner  'root'
  group  'root'
  mode   '755'
end

execute 'install_java' do
  command 'bash /opt/install_java.sh'
  not_if "ps -ef |pgrep java"
end

execute 'install_jenkins' do
  command 'bash /opt/install_jenkins.sh'
  not_if { File.exists? '/usr/lib/jenkins' }
end

service 'jenkins.service' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

service 'firewalld.service' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

execute 'open jenkins port' do
  command 'firewall-cmd --zone=public --permanent --add-port=8080/tcp && firewall-cmd --reload'
end
