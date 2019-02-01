instana-stop
yum remove cassandra.noarch cassandra-tools.noarch chef-cascade.x86_64 clickhouse.x86_64 elasticsearch.noarch instana-acceptor.noarch instana-appdata-legacy-converter.noarch instana-appdata-processor.noarch instana-appdata-reader.noarch instana-appdata-writer.noarch instana-butler.noarch instana-cashier.noarch instana-eum-acceptor.noarch instana-filler.noarch instana-groundskeeper.noarch instana-issue-tracker.noarch instana-jre.x86_64 instana-processor.noarch instana-ruby.x86_64 instana-ui-backend.noarch instana-ui-client.noarch mason.noarch mongodb.x86_64 nginx.x86_64 nodejs.x86_64 postgres-migrator.x86_64 postgresql-static.x86_64 redis.x86_64
rm -Rf /etc/systemd/system/elasticsearch.service.d/
rm -f /etc/systemd/system/redis.service
rm -Rf /etc/systemd/system/multi-user.target.wants/elasticsearch.service
rm -Rf /usr/share/elasticsearch
rm -Rf /etc/elasticsearch
