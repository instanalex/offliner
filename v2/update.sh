function update-instana() {

detectOS
echo " * extracting installation files 
tar -xzvf $CUR_DIR/instana_offline.tar.gz
set-repo-local $DITRO
instana-update
set-agent-repo-nginx

}

