#! /bin/bash

echo Copy .env
cp .env nimbora-yields-l1-public/.env
cp .env nimbora-yields-l2-public/.env

echo Setup L1
cd nimbora-yields-l1-public && ./setup.sh && cd ..
cp nimbora-yields-l1-public/configs.json ./nimbora-yields-l2-public/l1-configs.json
cp nimbora-yields-l1-public/configs.json ./l1-configs.json

echo Setup L2
cd nimbora-yields-l2-public && ./setup.sh && cd ..
cp nimbora-yields-l2-public/configs.json ./nimbora-yields-l1-public/l2-configs.json
cp nimbora-yields-l2-public/configs.json ./l2-configs.json

echo Config L1
cd nimbora-yields-l1-public && ./config.sh && cd ..

# Set ENVs
# l1PoolingManager=$(cat nimbora-yields-l1-public/configs.json | jq -r ${NETWORK}.l1PoolingManager)
# echo export YIELD_DEX_L1_POOLING_MANAGER=$l1PoolingManager >> .env

# l2PoolingManager=$(cat nimbora-yields-l2-public/configs.json | jq -r ${NETWORK}.l2PoolingManager)
# echo export YIELD_DEX_L2_POOLING_MANAGER=$l2PoolingManager >> .env
