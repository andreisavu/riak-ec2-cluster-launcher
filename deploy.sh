#! /bin/bash
. sandbox/bin/activate
./launch.py local-key ~/.ssh/id_rsa user_data.sh "$@"

