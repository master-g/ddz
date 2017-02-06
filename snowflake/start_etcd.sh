#!/usr/bin/env bash

docker run -d -p 2379:2379 -p 2380:2380 --name etcd quay.io/coreos/etcd \
    /usr/local/bin/etcd \
    --data-dir=data.etcd --name etcd0 \
    --initial-advertise-peer-urls http://127.0.0.1:2380 --listen-peer-urls http://127.0.0.1:2380 \
    --advertise-client-urls http://0.0.0.0:2379 --listen-client-urls http://0.0.0.0:2379 \
    --initial-cluster etcd0=http://127.0.0.1:2380 \
    --initial-cluster-state new --initial-cluster-token my-etcd-token
