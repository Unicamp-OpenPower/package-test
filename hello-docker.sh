printf "deb https://oplab9.parqtec.unicamp.br/pub/repository/debian/ ./" >> /etc/apt/sources.list
wget https://oplab9.parqtec.unicamp.br/pub/key/openpower-gpgkey-public.asc
sudo apt-key add openpower-gpgkey-public.asc
sudo apt-get update
sudo apt install docker-ce
sudo docker run ubuntu echo “Hello Docker”
sudo docker run centos echo “Hello Docker”
