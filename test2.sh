#!/bin/bash

network=0
subnet=0
device=0

function device_scan {
echo "starting device scan"
for device in `seq 0 255`; do
device_address="10.$network.$subnet.$device"
echo "$device_address"
curl -H "X-Forwarded-For: $device_address" https://virtualpilotlight.com/
done
}

function subnet_scan {
echo "starting subnet scan"
for subnet in `seq 0 255`; do
device_scan
subnet_address="10.$network.$subnet.$device"
echo "$subnet_address"
curl -H "X-Forwarded-For: $subnet_address" https://virtualpilotlight.com/
done
}

function network_scan {
echo "starting network scan"
for network in `seq 0 255`; do
subnet_scan
network_address="10.$network.$subnet.$device"
echo "$netword_address"
curl -H "X-Forwarded-For: $network_address" https://virtualpilotlight.com/
done
}

network_scan
echo "10.$network.$subnet.$device"
