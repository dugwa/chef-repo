# # encoding: utf-8

# Inspec test for recipe jenkins::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

describe file('/etc') do
    it { should be_directory }
    it { should be_owned_by 'root' }
end  


