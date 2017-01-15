template '/opt/install_java.sh' do
  source 'java.sh.erb'
  owner  'root'
  group  'root'
  mode   '755'
end

template '/opt/install_jenkins.sh' do
  source 'jenkins.sh.erb'
  owner  'root'
  group  'root'
  mode   '755'
end

log 'starting installation of java version 8' do
  level :info
end

execute 'install_java' do
  command 'bash /opt/install_java.sh'
  not_if "ps -ef |pgrep java"
end

log 'starting installation of jenkins' do
  level :info
end

execute 'install_jenkins' do
  command 'bash /opt/install_jenkins.sh'
  not_if { Dir.exists? '/usr/lib/jenkins' }
end

service 'jenkins.service' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

# open default jenkins port of 8080 via iptables
iptables_rule 'http_8080' do
  lines 'A FWR -p tcp -m tcp --dport 8080 -j ACCEPT'
end

log 'you have just successfully installed jenkins' do
  level :info
end
