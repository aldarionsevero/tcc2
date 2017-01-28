# Recurso para sites com httpd
resource_name :httpd

property :homepage, String, default: ''

load_current_value do
  file = '/var/www/sites/index.html'
  if ::File.exist?(file)
    homepage IO.read(file)
  end
end

action :create do
  package 'httpd'

  service 'httpd' do
    action [:enable, :start]
  end

  file '/var/www/sites/index.html' do
    content homepage
  end
end
