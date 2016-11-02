cookbook_file '/etc/yum.repos.d/CentOS-Base.repo' do
  source 'centosbase'
  owner  'root'
  group  'root'
  mode   '644'
end


cookbook_file '/etc/yum.repos.d/epel.repo' do
  source 'epel'
  owner  'root'
  group  'root'
  mode   '644'
end
