printf "deb https://oplab9.parqtec.unicamp.br/pub/repository/debian/ ./" >> /etc/apt/sources.list
wget https://oplab9.parqtec.unicamp.br/pub/key/openpower-gpgkey-public.asc
sudo apt-key add openpower-gpgkey-public.asc
sudo apt-get update
sudo apt install -y git make crio
sudo systemctl daemon-reload
sudo systemctl enable crio
sudo systemctl start crio
echo "Import go"
go get github.com/kubernetes-sigs/cri-tools/cmd/crictl
echo "bin crictl"
sudo cp ~/go/bin/crictl /usr/local/bin/
echo "script start"
sudo crictl --runtime-endpoint unix:///var/run/crio/crio.sock version
echo "Clone crio"
git clone https://github.com/cri-o/cri-o.git
cd cri-o/
sudo cp test/policy.json /etc/containers
echo "End Script"
POD_ID=$(sudo crictl runp test/testdata/sandbox_config.json)
sudo crictl inspectp --output table $POD_ID
