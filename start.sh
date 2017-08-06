#!/bin/sh

java \
	   -cp KafkaOffsetMonitor.jar \
       com.quantifind.kafka.offsetapp.OffsetGetterWeb \
     --offsetStorage ${OFFSET_STORAGE:-kafka} \
     --kafkaBrokers ${KAFKA_BROKERS:-localhost:9092} \
     --zk ${ZK_HOSTS:-localhost:2181} \
     --port ${PORT:-8080} \
     --refresh ${REFRESH_SECODS:-10}.seconds \
     --retain ${RETAIN_DAYS:-2}.days \
     --dbName ${DB_NAME:-data/offsetapp_kafka}
