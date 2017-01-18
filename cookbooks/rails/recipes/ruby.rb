template '/opt/install_ruby.sh' do
  source 'ruby.sh.erb'
  owner  'jenkins'
  group  'jenkins'
  mode   '755'
end

log 'starting installation of rbenv' do
  level :info
end

execute 'install_ruby' do
  command 'bash /opt/install_ruby.sh'
  user 'jenkins'
end

log 'finished installation of ruby' do
  level :info
end
