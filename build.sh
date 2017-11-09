#!/bin/sh
set -e

pip wheel --wheel-dir=/wheels -r requirements.txt
pip wheel --wheel-dir=/wheels ./
cp requirements.txt /wheels
