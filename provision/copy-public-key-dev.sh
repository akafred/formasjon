vagrant up devmain
cat ssh/id_rsa.pub | vagrant ssh devmain -c 'cat >> .ssh/authorized_keys && echo "Key copied"'
