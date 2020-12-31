cd /etc/mysql/conf.d/
echo '[mysqld]
binlog_format=ROW
default-storage-engine=innodb
innodb_autoinc_lock_mode=2
bind-address=0.0.0.0

# Galera Provider Configuration
wsrep_on=ON
wsrep_provider=/usr/lib/galera/libgalera_smm.so

# Galera Cluster Configuration
wsrep_cluster_name="test_cluster"
wsrep_cluster_address="gcomm://172.105.55.204,192.46.209.100,192.46.208.41"
 
# Galera Synchronization Configuration
wsrep_sst_method=rsync

# Galera Node Configuration
wsrep_node_address="172.105.55.204"
wsrep_node_name="db-node-01"


# TLS stuffs

ssl_capath=/etc/mysql/certs/server,
ssl_ca=/etc/mysql/certs/server/ca.crt,
ssl_cert=/etc/mysql/certs/server/tls.crt,
ssl_key=/etc/mysql/certs/server/tls.key,
wsrep_provider_options="socket.ssl_key=/etc/mysql/certs/server/tls.key;socket.ssl_cert=/etc/mysql/certs/server/tls.crt;socket.ssl_ca=/etc/mysql/certs/server/ca.crt"' > galera.cnf