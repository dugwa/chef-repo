# this recipe ensures mirroring via rsync is setup between jenkins master and slave

# stop jenkins

execute 'stop_jenkins' do
  command 'service jenkins stop'
end

execute 'install_rsync and openssh-clients' do
  %w(rsync openssh-clients).each do |pkg|
    command "yum install #{pkg}"
  end 
end

execute 'start_jenkins' do
  command 'service jenkins start'
end
