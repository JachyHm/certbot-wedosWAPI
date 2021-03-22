#!/bin/bash  
echo "$CERTBOT_DOMAIN"
echo "$CERTBOT_VALIDATION"

source "$(dirname "$0")"/credentials.sh

#row_id from ./listLE_DNS_records.sh
curl -s -d "request=<request><user>$LOG</user><auth>$AUTH</auth><command>dns-row-update</command><data><domain>$DOMAIN</domain><row_id>${ROW_ID[$CERTBOT_DOMAIN]}</row_id><ttl>1800</ttl><rdata>$CERTBOT_VALIDATION</rdata></data></request>" https://api.wedos.com/wapi/xml > /dev/null
curl -s -d "request=<request><user>$LOG</user><auth>$AUTH</auth><command>dns-domain-commit</command><data><name>$DOMAIN</name></data></request>" https://api.wedos.com/wapi/xml > /dev/null

sleep 750