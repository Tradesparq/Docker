FROM    java:8
MAINTAINER Sirius "fhc023@qq.com"

ENV SOLR_VERSION 4.3.0
ENV SOLR solr-$SOLR_VERSION
ENV SOLR_USER solr

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get update && \
  apt-get -y install \
    curl \
    lsof \
    procps && \
  groupadd -r $SOLR_USER && \
  useradd -r -g $SOLR_USER $SOLR_USER && \
  mkdir -p /opt && \
  wget -nv --output-document=/opt/$SOLR.tgz http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz && \
  tar -C /opt --extract --file /opt/$SOLR.tgz && \
  rm /opt/$SOLR.tgz && \
  ln -s /opt/$SOLR /opt/solr && \
  chown -R $SOLR_USER:$SOLR_USER /opt/solr /opt/$SOLR

EXPOSE 8983
WORKDIR /opt/solr
USER $SOLR_USER
CMD ["/bin/bash", "-c", "/opt/solr/bin/solr -f"]
