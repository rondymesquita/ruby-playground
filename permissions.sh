echo "*** Changing file permissions to user '$1'"
sudo chown -R $1:$1 ./

echo "*** Permissions changed"
