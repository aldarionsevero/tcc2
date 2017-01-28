package "nginx" do
  action :install
end

service "nginx" do
  action :nothing
end

template "/etc/nginx/conf.d/sample.conf" do
  mode 644
  action :create
  notifies :restart, 'service[nginx]'
end
