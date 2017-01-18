template '/opt/install_rbenv.sh' do
  source 'rbenv.sh.erb'
  owner  'jenkins'
  group  'jenkins'
  mode   '755'
end

log 'starting installation of ruby on rails' do
  level :info
end

execute 'install_rbenv' do
  command 'bash /opt/install_rbenv.sh'
  user 'jenkins'
end

log 'finished installation of ruby on rails' do
  level :info
end

