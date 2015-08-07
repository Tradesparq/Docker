# Docker
For docker image buildin

## Usage

Launch zookeeper

```
docker run --restart=always --name zookeeper -d -p 2181:2181 -p 2888:2888 -p 3888:3888 jplock/zookeeper
```

Start solr

```
docker run --restart=always --name solr1 --link zookeeper:ZK -d -p 8983:8983 \
  tradesparq/solr \
  bash -c '/opt/solr/bin/solr start -f -z $ZK_PORT_2181_TCP_ADDR:$ZK_PORT_2181_TCP_PORT'

docker run --restart=always --name solr2 --link zookeeper:ZK -d -p 8984:8983 \
  tradesparq/solr \
  bash -c '/opt/solr/bin/solr start -f -z $ZK_PORT_2181_TCP_ADDR:$ZK_PORT_2181_TCP_PORT'
```

Create collection

```
docker exec -i -t solr1 /opt/solr/bin/solr create \
  -c customs-records -d customs-records -p 8983 -r
```

```bash
docker pull tradesparq/solr:latest
docker rm -f zookeeper solr1 solr2
docker run --restart=always --name zookeeper -d -p 2181:2181 -p 2888:2888 -p 3888:3888 jplock/zookeeper
docker run --restart=always --name solr1 --link zookeeper:ZK -d -p 8983:8983   tradesparq/solr   bash -c '/opt/solr/bin/solr start -f -z $ZK_PORT_2181_TCP_ADDR:$ZK_PORT_2181_TCP_PORT'
docker run --restart=always --name solr2 --link zookeeper:ZK -d -p 8984:8983   tradesparq/solr   bash -c '/opt/solr/bin/solr start -f -z $ZK_PORT_2181_TCP_ADDR:$ZK_PORT_2181_TCP_PORT'
docker exec -i -t solr1 /opt/solr/bin/solr create   -c customs-records -d customs-records -p 8983 -rf 2
docker exec -i -t solr1 /opt/solr/bin/solr create   -c companies -d companies -p 8983 -rf 2
```

...
