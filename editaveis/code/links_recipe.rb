#...

link '/etc/joe/editorrc' do
  group 'root'
  mode '777'
  owner 'root'
  to '../../var/lib/misc/editorrc'
end

link '/etc/modules-load.d/modules.conf' do
  group 'root'
  mode '777'
  owner 'root'
  to '../modules'
end

#...
