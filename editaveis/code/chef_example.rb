template "/etc/nginx/conf.d/mysite.conf" do
  action :create
end
service "nginx" do
  action :restart
end
