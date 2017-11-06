
# template '/etc/spx/metrics/.env' do
#   source '.env.erb'
#   owner 'root'
#   group 'root'
#   mode '0664'
#   variables(zoo_key: node['hostname'],
#             zoo_ids: node['zoo']['nodes']['ids'],
#             zoo_names: node['zoo']['nodes']['names'])
# end


# group 'docker' do
#   members 'vagrant'
#   append true
#   action :modify
#   only_if { Chef::Config[:solo] }
# end

# cookbook_file '/etc/hosts' do
#   source 'hosts'
#   owner 'root'
#   group 'root'
#   mode '0644'
#   action :create
#   only_if { Chef::Config[:solo] }
# end



# startup script - system.d or upstart


# cookbook_file '/etc/spx/metrics/docker-compose.yml' do
#   source 'docker-compose.yml'
#   owner 'root'
#   group 'root'
#   mode '0664'
#   action :create
# end

# docker_image 'zookeeper' do
#   action :pull
# end
#
# docker_image 'yandex/clickhouse-server' do
#   action :pull
# end
#
# docker_container 'zoo' do
#   repo 'zookeeper'
#   restart_policy 'always'
#   network_mode 'host'
# end
#
# docker_container 'clickhouse' do
#   repo 'yandex/clickhouse-server'
#   restart_policy 'always'
#   #port ['8123:8123', '9000:9000']
#   network_mode 'host'
# end
