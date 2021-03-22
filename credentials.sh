#!/bin/bash  

#sha1 password -- generate with echo -n secretpass | sha1sum
PASS=<SECRET_PASSPHRASE>
#your mail on wedos.cz
LOG=<EMAIL>
HOUR=$(date +%H)

#echo without -n option not working !!!
AUTH=$(echo -n "$LOG$PASS$HOUR" | sha1sum | cut -d' ' -f1)

DOMAIN="jachyhm.cz"

#row_id from ./listLE_DNS_records.sh
declare -A ROW_ID
ROW_ID=([jachyhm.cz]="9999999999" [jh.jachyhm.cz]="9999999999" [rw.jachyhm.cz]="9999999999" [stag.jachyhm.cz]="9999999999")
