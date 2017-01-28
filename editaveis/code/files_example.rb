# Adiciona o arquivo 'eth1-conf' definido em '/files/eth1-conf'
cookbook_file '/etc/network/interfaces.d/eth1-conf'

# Adiciona o arquivo 'eth1-conf' com o conteudo definido em 'content'
file '/etc/network/interfaces.d/eth1-conf' do
  content 'auto eth1'
end

# Adiciona o arquivo 'eth1-conf' definido no local remoto de 'source'
remote_file '/etc/network/interfaces.d/eth1-conf' do
  source 'http://site.com/eth1-conf'
end
