exit
ssh-keygen
cat .ssh/id_rsa.pub 
git clone git@github.com:cnosuke/isucon8
cp isucon8/setup/authorized_keys ./.ssh/
chmod 600 .ssh/authorized_keys 
ls
exit
