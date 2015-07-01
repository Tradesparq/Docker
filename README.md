# Docker
For docker image buildin

## Usage

Launch zookeeper

```
docker run --restart=always --name zookeeper -d -p 2181:2181 -p 2888:2888 -p 3888:3888 jplock/zookeeper
```

Start solr

```
docker run --restart=always --name solr -d -p 8983:8983 \
  tradesparq/solr:4.3 \
  bash -c 'java -DzkHost=10.0.3.242:2181,10.0.3.92:2181,10.0.3.74:2181 -Dsolr.solr.home=/opt/solr/solr -DnumShards=1 -Xms1024M -Xmx6000M -jar start.jar'
```

Upload config to zookeeper

```
docker exec -i -t solr /opt/solr/cloud-scripts/zkcli.sh -cmd upconfig -zkhost 10.0.3.242:2181,10.0.3.92:2181,10.0.3.74:2181 -confdir /home/github/albicilla-solr/../conf -confname ..-conf

docker exec -i -t solr /opt/solr/cloud-scripts/zkcli.sh -cmd linkconfig -collection .. -confname ..-conf -zkhost 10.0.3.242:2181,10.0.3.92:2181,10.0.3.74:2181
```
