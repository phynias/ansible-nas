#!/bin/sh
curl -s https://www.iblocklist.com/lists.json | \
    jq -r '.lists[] | .name as $n | select((.subscription == "false") and ($n | startswith("iana-") | not) and (["fornonlancomputers", "bogon", "The Onion Router"] | index($n) | not)) | .list' | \
    awk 'length($0) > 2 { print "http://list.iblocklist.com/?fileformat=p2p&archiveformat=gz&list=" $0 }' | \
    xargs wget -O - | \
    gunzip | \
    egrep -v '^#' | \
    gzip > /zpool1/docker/static/files/blocklist.gz && \
    chown nasuser.nasuser /zpool1/docker/static/files/blocklist.gz && \
    chmod 664 /zpool1/docker/static/files/blocklist.gz
docker exec pihole pihole updateGravity
