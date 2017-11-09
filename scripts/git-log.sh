#!/usr/bin/env sh

## Can't work well with "
# git log \
#   --pretty=format:'{%n  "commit": "%H",%n  "subject": "%s",%n  "date": "%aD"%n},' \
#   | sed 's/\\/\\\\/g' | sed "$ s/,$//" | sed ':a;N;$!ba;s/\r\n\([^{]\)/\\n\1/g'   \
#   | awk 'BEGIN { print("[") } { print($0) } END { print("]") }'                   \
#   > git-log.json

# git log \
#   --pretty=format:'{%n  "commit": "%H",%n  "subject": "%f",%n  "date": "%ai"%n},'   \
#   | sed "$ s/,$//" | sed ':a;N;$!ba;s/\r\n\([^{]\)/\\n\1/g'     \
#   | awk 'BEGIN { print("[") } { print($0) } END { print("]") }' \
#   > git-log.json

git log --pretty=format:'BEGIN%n  "commit": "%H",%n  "subject": "%f",%n  "date": "%ai",' \
  --shortstat \
  > git-log.log

texlua ./git-log.lua
rm git-log.log
