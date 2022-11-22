#!/bin/bash
if [[ $# -le 2 ]]
    then
        echo "Usage Help!!! Please pass all parameters required to query VM Metadata"
        echo "az vmss show -n vmName -r resourceGroup"
        echo ""
        echo "To query Specific Parameter from VM Metadata"
        echo "az vmss show -n vmName -r resourceGroup -p parameter"
        exit
fi

while getopts n:r:p: flag
do
    case "${flag}" in
        n) vmName=${OPTARG};;
        r) resourceGroup=${OPTARG};;
        p) parameter=${OPTARG};;
    esac
done
az vmss show --name $vmName --resource-group $resourceGroup | json $parameter   # need az and json package installed