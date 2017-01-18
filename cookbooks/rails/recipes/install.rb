template '/opt/install_rbenv.sh' do
  source 'rbenv.sh.erb'
  owner  'jenkins'
  group  'jenkins'
  mode   '755'
end

log 'starting installation of rails pre-requisites' do
  level :info
end

execute 'install_rsync and openssh-clients' do
  %w(git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel nodejs).each do |pkgs|
    command "yum install -y #{pkgs}"
  end
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

