#!/bin/sh

find src -name 'src/public/*.md' | sort > tmp
echo "# Summary" > src/SUMMARY.md

while read f; do
  # remove leading "src/public/"
  rel="${f#src/public/}"

  name=$(basename "$rel" .md)
  echo "* [$name]($rel)" >> src/SUMMARY.md
done < tmp

rm tmp

mdbook serve -n 0.0.0.0 -p 80
