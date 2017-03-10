#install necessary packages

%w(rsync openssh-clients git nc telnet).each do |pkg|
  execute 'packages' do
    command "yum install -y #{pkg}"
  end
end
