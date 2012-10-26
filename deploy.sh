#! /bin/bash
. launcher-env/bin/activate
./launch.py local-key ~/.ssh/id_rsa user_data.sh "$@"

