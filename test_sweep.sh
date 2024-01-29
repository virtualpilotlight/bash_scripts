#!/bin/bash

network=0
subnet=0
device=0

function device_scan {
for device in `seq 0 255`; do
echo "10.$network.$subnet.$device"
done
}

function subnet_scan {
for subnet in `seq 0 255`; do
device_scan
echo "10.$network.$subnet.$device"
done
}

function network_scan {
for network in `seq 0 255`; do
subnet_scan
echo "10.$network.$subnet.$device"
done
}

network_scan
