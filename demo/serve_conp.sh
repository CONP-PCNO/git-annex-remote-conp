#!/bin/bash

set -e

mkdir -p conp_server
cd conp_server
python -m SimpleHTTPServer 8080
