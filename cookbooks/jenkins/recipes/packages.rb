#install necessary packages

execute 'install_rsync and openssh-clients' do
  %w(rsync openssh-clients git).each do |pkg|
    command "yum install -y #{pkg}"
  end 
end

