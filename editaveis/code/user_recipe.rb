# User session

user 'root' do
  uid 0
  home '/root'
  shell '/bin/bash'
  manage_home true
end

user 'nobody' do
  uid 99
  home '/'
  shell '/usr/bin/nologin'
  manage_home false
end

user 'lucas' do
  uid 100
  home '/home/lucas'
  shell '/bin/bash'
  manage_home true
end

user 'postgres' do
  uid 88
  home '/var/lib/postgres'
  shell '/bin/bash'
  manage_home true
end
