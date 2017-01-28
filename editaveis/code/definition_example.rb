# Arquivo de definition
define :host_porter, :port => 4000, :hostname => nil do
  params[:hostname] ||= params[:name]

  directory '/etc/#{params[:hostname]}' do
    recursive true
  end

  file '/etc/#{params[:hostname]}/#{params[:port]}' do
    content 'some content'
  end
end

# Arquivo de recipe
host_porter 'www1' do
  port 4001
end
