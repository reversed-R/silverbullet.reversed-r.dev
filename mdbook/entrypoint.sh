#!/bin/sh
set -e

generate_summary () {
  mdbook-autosummary
}

generate_summary

mdbook serve -n 0.0.0.0 -p 80 &

while inotifywait -r -e create -e delete -e moved_to -e moved_from src
do
  generate_summary
done
