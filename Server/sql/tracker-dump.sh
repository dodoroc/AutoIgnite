#/bin/bash

pg_dump projects --schema=tracker --schema-only -h localhost > ~/tracker-schema.sql
pg_dump projects --schema=tracker --data-only -h localhost > ~/tracker-data.sql

