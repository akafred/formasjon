vagrant up
cat ssh/id_rsa.pub | vagrant ssh stagemain -c 'cat >> .ssh/authorized_keys && echo "Key copied"'
