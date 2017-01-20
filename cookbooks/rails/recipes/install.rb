template '/opt/install_rbenv.sh' do
  source 'rbenv.sh.erb'
  owner  'jenkins'
  group  'jenkins'
  mode   '755'
end

log 'starting installation of rails pre-requisites' do
  level :info
end

# enable jenkins login
bash 'jenkins shell login' do
  code <<-EOH
  sed -i 's/false/bash/g' /etc/passwd
  EOH
end

%w(git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel).each do |pkgs|
  yum_package pkgs do
    action :install
  end   
end

# install nodejs
bash 'install nodejs' do
  code <<-EOH
  cd /opt
  wget http://nodejs.org/dist/v0.10.30/node-v0.10.30-linux-x64.tar.gz
  sudo tar --strip-components 1 -xzvf /opt/node-v0.10.30-linux-x64.tar.gz -C /usr/local
  EOH
end

log 'starting installation of ruby on rails' do
  level :info
end


#PATH = "/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin"
bash 'install_rbenv' do
  user 'jenkins'
  code <<-EOH
  cd /var/lib/jenkins
  git clone git://github.com/sstephenson/rbenv.git /var/lib/jenkins/.rbenv
  echo 'export PATH="/var/lib/jenkins/.rbenv/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin"' >> /var/lib/jenkin/.bash_profile
  echo 'eval "$(rbenv init -)"' >> /var/lib/jenkins/.bash_profile
  exec /bin/bash
  source /var/lib/jenkins/.bash_profile
  EOH
end

bash 'install ruby' do
  user 'jenkins'
  code <<-EOH
  cd /var/lib/jenkins
  git clone git://github.com/sstephenson/ruby-build.git /var/lib/jenkins/.rbenv/plugins/ruby-build
  echo 'export PATH="/var/lib/jenkins/.rbenv/plugins/ruby-build/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin"' >> /var/lib/jenkins/.bash_profile
  exec /bin/bash
  source /var/lib/jenkins/.bash_profile
  /var/lib/jenkins/.rbenv/bin/rbenv install -v 2.2.1
  sleep 5
  /var/lib/jenkins/.rbenv/bin/rbenv global 2.2.1
  EOH
end


#execute 'install_rbenv' do
 # command 'bash /opt/install_rbenv.sh'
#  user 'jenkins'
#end

log 'finished installation of ruby on rails' do
  level :info
end

