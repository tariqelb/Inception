#!/bin/bash

# lanuch Redis in cache mode with:
# - max memory up to 50% of your RAM if needed (--maxmemory 512mb)
# - deleting oldest data when max memory is reached (--maxmemory-policy allkys-lru)
echo requirepass $RDS_PASSWORD >> /etc/redis.conf

chmod 777 /etc/redis.conf
redis-server  /etc/redis.conf 
