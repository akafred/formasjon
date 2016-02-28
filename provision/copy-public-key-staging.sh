vagrant up
cat ssh/id_rsa.pub | vagrant ssh localmain -c 'cat >> .ssh/authorized_keys && echo "Key copied"'
