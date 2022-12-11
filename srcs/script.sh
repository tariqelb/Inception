#!/bin/sh
docker compose down --rmi all
docker system prune -af
docker volume rm srcs_wp_vol srcs_db_vol srcs_rds_vol
rm -rf ~/data/db/*
rm -rf ~/data/wp/*
rm -rf ~/data/rds/*
