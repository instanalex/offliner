function usage() {
echo "** Usage: ** "
echo " *   For Installation: $0 -i [optional -f <varfile>]"
echo " *   For Update: $0 -u"
}

[ $# -eq 0 ] && usage

while getopts "iuf:" opt; do
  case $opt in
     i)
        INSTALL=true;UPDATE=false
        ;;
     u)
        UPDATE=true;INSTALL=false
        ;;
     f)
        VAR_FILE="$OPTARG"
        ;;
     *)
        usage
        exit 0
        ;;
  esac
done
