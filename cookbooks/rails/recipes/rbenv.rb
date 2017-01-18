template '/opt/install_rbenv.sh' do
  source 'rbenv.sh.erb'
  owner  'jenkins'
  group  'jenkins'
  mode   '755'
end

log 'starting installation of rbenv' do
  level :info
end

execute 'install_rbenv' do
  command 'bash /opt/install_rbenv.sh'
  user 'jenkins'
end
