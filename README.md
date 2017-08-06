# Minimal docker image for running [Morningstar/kafka-offset-monitor](https://github.com/Morningstar/kafka-offset-monitor)

- Built on [openjdk:8u131-jre-alpine](https://hub.docker.com/_/openjdk/)
- Docker wrap base on [akursar/docker-kafkaoffsetmonitor](https://github.com/akursar/docker-kafkaoffsetmonitor)

> 最近搭建了一套 Metrics 监控报警系统，需要用到 kafka，kafka 集群得有个监控。于是找到了 [Kafka Offset Monitor](http://quantifind.github.io/KafkaOffsetMonitor/) （但原版不兼容 kafka 新版本，Issue: [Unable to Find Active Consumers](https://github.com/quantifind/KafkaOffsetMonitor/issues/40) ，貌似只支持到 kafka 0.8 ，也米有更新 ┑(￣Д ￣)┍ ，建议使用 [Morningstar/kafka-offset-monitor](https://github.com/Morningstar/kafka-offset-monitor) 替用 ），以及考虑到部署方便，使用 docker 部署，找到这个觉得写得不（简）错（洁）的 docker image（[akursar/docker-kafkaoffsetmonitor](https://github.com/akursar/docker-kafkaoffsetmonitor)），基于这个进行了更新。

### Quick Start

The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/).

    wget https://raw.githubusercontent.com/junxy/docker-kafkaoffsetmonitor/master/docker-compose.yaml

Update ENV vars:

    environment:
      ZK_HOSTS: "localhost:2181"
      KAFKA_BROKERS: "localhost:9092"

> In addition, you can set the following ENV vars, listed here with default as set in [start.sh](start.sh).
> More arguments: [Morningstar/kafka-offset-monitor](https://github.com/Morningstar/kafka-offset-monitor)

To run, publish Kafka Offset Monitor's default web port ( 8080 )

    docker-compose up

or just docker run:

    docker run -d \
    -p 8080:8080 \
    -e "ZK_HOSTS=zk1:2181,zk2:2181,zk3:2181/chroot/kafka" \
    -e "KAFKA_BROKERS=kafka1:9092,kafka2:9092,kafka3:9092" \
    junxy/kafkaoffsetmonitor
