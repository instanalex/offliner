######################################################################################
# License Injector
#   by Alexandre MECHAIN - Instana
#
# This script will generate license key based on your SalesID
#   NB: SalesID can be found in your Instana license email
# You must first provide the appropriate values for
#   SERVER_NAME (name of the server as set in settings.yaml)
#   TENANT (tenant name as provided in your Instana license email)
#   UNIT (unit name as provided in your Instana license email)
#   SALES_ID (SalesID value as provided in your Instana license email)
# This script can be executed on any bash compatible platform (Mac, Linux, Cygwin)
# It requires a direct internet access
# This script will create a file "license_raw" mandatory for execution of
#    the "License Injector" script
#
# For any questions please send an email to : alex.mechain@instana.com
######################################################################################

#!/bin/bash
SERVER_NAME=<server-name>
TENANT=<tenant>
UNIT=<unit>
SALES_ID=<sales-id>


# Connexion to instana with sales_id to produce a license file
curl -k -s -X POST --header 'upgrade-insecure-requests: 1' \
                   --header 'content-type: application/x-www-form-urlencoded' \
                   --header 'cache-control: no-cache' \
                   -d "privacyAgreementVersion=on&returnUrl=https%3A%2F%2F$SERVER_NAME%2Fump%2F$TENANT%2F$UNIT%2Flicense%2F&salesId=$SALES_ID&tosVersion=o" \
                   --url https://instana.io/onprem/license/?salesId=$SALES_ID >license_raw
