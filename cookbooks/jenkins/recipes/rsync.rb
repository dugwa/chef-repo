# this recipe ensures mirroring via rsync is setup between jenkins master and slave

execute 'install_rsync and openssh-clients' do
  %w(rsync openssh-clients).each do |pkg|
    command "yum install #{pkg}"
  end 
end

