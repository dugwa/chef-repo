# # encoding: utf-8

# Inspec test for recipe jenkins::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

unless os.windows?
  describe user('root') do
    it { should exist }
    skip 'This is an example test, replace with your own test.'
  end
end

describe port(80) do
  it { should_not be_listening }
  skip 'This is an example test, replace with your own test.'
end

%w(/etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/epel.repo).each do |f|
  describe file(f) do
    it { should be_file }
    it { should be_owned_by 'root' }
  end
end 
