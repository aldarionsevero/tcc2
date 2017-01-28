#...

cookbook_file '/etc/apache2/apache2.conf' do
  source '/etc/apache2/apache2.conf'
  owner 'root'
  group 'root'
  mode '644'
end

cookbook_file '/etc/apache2/envvars' do
  source '/etc/apache2/envvars'
  owner 'root'
  group 'root'
  mode '644'
end

#...
