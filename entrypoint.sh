#!/bin/bash
set -e
rm -f /pool_site_app/tmp/pids/server.pid
exec "$@"
