#!/bin/sh
set -e

generate_summary () {

echo "# Summary" > src/SUMMARY.md
echo "" >> src/SUMMARY.md

for f in $(find src -name "*.md" ! -name "SUMMARY.md" | sort); do
  # remove leading "src/"
  rel="${f#src/}"
  
  name=$(basename "$rel" .md)

  indent=$(echo "$rel" | awk -F/ '{print NF-1}')
  pad=$(printf '%*s' $((indent*2)) "")

  echo "${pad}- [$name]($rel)" >> src/SUMMARY.md
done

}

generate_summary

mdbook serve -n 0.0.0.0 -p 80 &

while inotifywait -r -e create -e delete -e moved_to -e moved_from src
do
  generate_summary
done
