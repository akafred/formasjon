ssh "$1@$2" 'mkdir -p ~/.ssh && ls -al'
cat provision/ssh/id_rsa.pub | ssh "$1@$2" 'cat >> .ssh/authorized_keys && echo "Key copied"'
