#!/bin/bash

PAST_TIMESTAMP="$(date +%s -d '5 min ago')000"
mongoexport \
    --csv --quiet \
    --fields timestamp,source_ip,source_port,destination_ip,destination_port,honeypot \
    --db mnemosyne \
    --collection session \
    --query "{ timestamp: {\$gt: new Date($PAST_TIMESTAMP)}}" > /tmp/mhn-report.txt

    ./printHtmlTable.sh | mail -s "MHN Report: $(date -d '5 min ago')" -a "Content-type: text/html" -a "From: no-reply@mhn.domain.tld" user@domain.tld
