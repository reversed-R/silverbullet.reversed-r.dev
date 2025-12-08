#!/bin/sh

find src -name 'src/*.md' | sort > tmp
echo "# Summary" > src/SUMMARY.md

while read f; do
  # remove leading "src/"
  rel="${f#src/}"

  name=$(basename "$rel" .md)
  echo "* [$name]($rel)" >> src/SUMMARY.md
done < tmp

rm tmp

mdbook serve -n 0.0.0.0 -p 80
