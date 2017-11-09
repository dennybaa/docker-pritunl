#!/bin/sh
set -e

mkdir -p /wheels
pip wheel --wheel-dir=/wheels -r requirements.txt
pip wheel --wheel-dir=/wheels ./
cp requirements.txt /wheels
