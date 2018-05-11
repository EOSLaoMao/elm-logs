#!/bin/sh
hugo
gsutil defacl ch -u AllUsers:R gs://elm-logs
gsutil -h "Cache-Control:public, max-age=60" -m cp ./public/index.json gs://elm-logs/index.json
gsutil cors set ./cors-json-file.json gs://elm-logs
