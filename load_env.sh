#!/bin/bash
export $(cat .env | xargs)
jq -n env
