######################################################################################
# License Injector
#   by Alexandre MECHAIN - Instana
#
# This script will inject license in an Instana backend
# You must first provide the appropriate values for
#   SERVER_NAME (name of the server as set in settings.yaml)
#   TENANT (tenant name as provided in your Instana license email)
#   UNIT (unit name as provided in your Instana license email)
#   SALES_ID (SalesID value as provided in your Instana license email)
#   EMAIL (Email used in settings.yaml for installation process)
#   PASS (Password used in settings.yaml for installation process)
# You must first execute the script License-Generator.sh on a machine with
#   internet access. "License-Generator" will produce file "license_raw" mandatory
#   to execute "License Injector"
# Make sure file "license_raw" and License Injector are in the same folder.
# This script will only work properly on Linux
#
# For any questions please send an email to : alex.mechain@instana.com
######################################################################################

#!/bin/bash
SERVER_NAME=<server-name>
TENANT=<tenant>
UNIT=<unit>
EMAIL=<email>
PASS=<pass>
SALES_ID=<sales-id>

# Candid connection to back-end to retreive cookies for later license injecction
curl -c cookie -k -X POST --header 'upgrade-insecure-requests: 1' \
                          --header 'content-type: application/x-www-form-urlencoded' \
                          --header 'cache-control: no-cache' \
                          -d "returnUrl=https%3A%2F%2F$SERVER_NAME%2F&email=$EMAIL&password=$PASS" \
                          --url https://$SERVER_NAME/auth/signIn

echo `<license_raw` |grep -oP "(?<=window.license = ')(.*)(?=';)" >license

#echo "connection to backend for license push"
LIC=`<license`
URL="https://$SERVER_NAME/ump/$TENANT/$UNIT/license/"
#echo "$URL?license=$LIC&license=$LIC"
curl -k -v --cookie cookie --url "$URL?license=$LIC&$license=LIC" > output.htm
