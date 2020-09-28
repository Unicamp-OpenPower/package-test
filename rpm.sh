#!/bin/bash

LOCALPATH=$TRAVIS_BUILD_DIR/rpm
CONTAINERD="containerd"
CONTAINERD_CRI="containerd-cri"
CONTAINERD_CRI_CNI="containerd-cri-cni"
BAZEL="bazel"
DOCKER_CE="docker-ce"
DOCKER_CE_CLI="docker-ce-cli"
GLIDE="glide"
GRAFANA_CLI="grafana-cli"
KIALI="kiali"
MINIKUBE="minikube"
MINIO="minio"
MINIO_MC="minio-mc"
RESTIC="restic"
TERRAFORM="terraform"
RCLONE="rclone"
MATCHBOX="matchbox"

mkdir rpm
cd $LOCALPATH
cp $TRAVIS_BUILD_DIR/Dockerfile-rpm $LOCALPATH
mv Dockerfile-rpm Dockerfile

mkdir $CONTAINERD
mkdir $CONTAINERD_CRI
mkdir $CONTAINERD_CRI_CNI
mkdir $BAZEL
mkdir $DOCKER_CE
mkdir $DOCKER_CE_CLI
mkdir $GLIDE
mkdir $GRAFANA_CLI
mkdir $KIALI
mkdir $MINIKUBE
mkdir $MINIO
mkdir $MINIO_MC
mkdir $RESTIC
mkdir $TERRAFORM
mkdir $RCLONE
mkdir $MATCHBOX

cp Dockerfile $CONTAINERD
cp Dockerfile $CONTAINERD_CRI
cp Dockerfile $CONTAINERD_CRI_CNI
cp Dockerfile $BAZEL
cp Dockerfile $DOCKER_CE
cp Dockerfile $DOCKER_CE_CLI
cp Dockerfile $GLIDE
cp Dockerfile $GRAFANA_CLI
cp Dockerfile $KIALI
cp Dockerfile $MINIKUBE
cp Dockerfile $MINIO
cp Dockerfile $MINIO_MC
cp Dockerfile $RESTIC
cp Dockerfile $TERRAFORM
cp Dockerfile $RCLONE
cp Dockerfile $MATCHBOX

cd $CONTAINERD
printf "\nRUN yum -y install $CONTAINERD\nRUN $CONTAINERD --version" >> Dockerfile
{
  docker build -t $CONTAINERD-test -f $LOCALPATH/$CONTAINERD/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $CONTAINERD\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $CONTAINERD-test
} || {
  printf "Error in RPM package, docker run process: $CONTAINERD\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $CONTAINERD_CRI
printf "\nRUN yum -y install $CONTAINERD_CRI\nRUN $CONTAINERD --version" >> Dockerfile
{
  docker build -t $CONTAINERD_CRI-test -f $LOCALPATH/$CONTAINERD_CRI/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $CONTAINERD_CRI\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $CONTAINERD_CRI-test
} || {
  printf "Error in RPM package, docker run process: $CONTAINERD_CRI\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $CONTAINERD_CRI_CNI
printf "\nRUN yum -y install $CONTAINERD_CRI_CNI\nRUN $CONTAINERD --version" >> Dockerfile
{
  docker build -t $CONTAINERD_CRI_CNI-test -f $LOCALPATH/$CONTAINERD_CRI_CNI/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $CONTAINERD_CRI_CNI\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $CONTAINERD_CRI_CNI-test
} || {
  printf "Error in RPM package, docker run process: $CONTAINERD_CRI_CNI\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $BAZEL
printf "\nRUN yum -y install $BAZEL\nRUN $BAZEL --version" >> Dockerfile
{
  docker build -t $BAZEL-test -f $LOCALPATH/$BAZEL/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $BAZEL\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $BAZEL-test
} || {
  printf "Error in RPM package, docker run process: $BAZEL\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $DOCKER_CE
printf "\nRUN yum -y install $DOCKER_CE\nRUN docker --version" >> Dockerfile
{
  docker build -t $DOCKER_CE-test -f $LOCALPATH/$DOCKER_CE/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $DOCKER_CE\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $DOCKER_CE-test
} || {
  printf "Error in RPM package, docker run process: $DOCKER_CE\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $DOCKER_CE_CLI
printf "\nRUN yum -y install $DOCKER_CE_CLI\nRUN docker --version" >> Dockerfile
{
  docker build -t $DOCKER_CE_CLI-test -f $LOCALPATH/$DOCKER_CE_CLI/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $DOCKER_CE_CLI\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $DOCKER_CE_CLI-test
} || {
  printf "Error in RPM package, docker run process: $DOCKER_CE_CLI\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $GLIDE
rm Dockerfile
printf "FROM centos:8" >> Dockerfile
printf "\nENV container docker" >> Dockerfile
printf "\nRUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ \$i == \\" >> Dockerfile
printf "\nsystemd-tmpfiles-setup.service ] || rm -f \$i; done); \\" >> Dockerfile
printf "\nrm -f /lib/systemd/system/multi-user.target.wants/*;\\" >> Dockerfile
printf "\nrm -f /etc/systemd/system/*.wants/*;\\" >> Dockerfile
printf "\nrm -f /lib/systemd/system/local-fs.target.wants/*; \\" >> Dockerfile
printf "\nrm -f /lib/systemd/system/sockets.target.wants/*udev*; \\" >> Dockerfile
printf "\nrm -f /lib/systemd/system/sockets.target.wants/*initctl*; \\" >> Dockerfile
printf "\nrm -f /lib/systemd/system/basic.target.wants/*;\\" >> Dockerfile
printf "\nrm -f /lib/systemd/system/anaconda.target.wants/*;" >> Dockerfile
printf "\nVOLUME [ \"/sys/fs/cgroup\" ]" >> Dockerfile
printf "\nCMD [\"/usr/sbin/init\"]" >> Dockerfile
#printf "\nFROM golang:1.14" >> Dockerfile
#printf "\nWORKDIR /go/src/app\n" >> Dockerfile
printf "\nRUN printf \"[Open-Power]" >> Dockerfile
printf "\\" >> Dockerfile
printf "n" >> Dockerfile
printf "name=Unicamp OpenPower Lab - \$basearch" >> Dockerfile
printf "\\" >> Dockerfile
printf "n" >> Dockerfile
printf "baseurl=https://oplab9.parqtec.unicamp.br/pub/repository/rpm/" >> Dockerfile
printf "\\" >> Dockerfile
printf "n" >> Dockerfile
printf "enabled=1" >> Dockerfile
printf "\\" >> Dockerfile
printf "n" >> Dockerfile
printf "gpgcheck=0" >> Dockerfile
printf "\\" >> Dockerfile
printf "n" >> Dockerfile
printf "repo_gpgcheck=1" >> Dockerfile
printf "\\" >> Dockerfile
printf "n" >> Dockerfile
printf "gpgkey=https://oplab9.parqtec.unicamp.br/pub/key/openpower-gpgkey-public.asc\" >> /etc/yum.repos.d/open-power.repo" >> Dockerfile

printf "\nRUN yum -y update" >> Dockerfile
#printf "\nRUN yum -y install wget" >> Dockerfile
#printf "\nRUN wget https://golang.org/dl/go1.14.9.linux-ppc64le.tar.gz" >> Dockerfile
#printf "\nRUN tar -xvf go1.14.9.linux-ppc64le.tar.gz" >> Dockerfile
#printf "\nRUN export PATH=\$PATH:\$PWD/go/bin" >> Dockerfile
printf "\nRUN yum -y install $GLIDE\nRUN $GLIDE --version" >> Dockerfile
#printf "\nRUN yes | $GLIDE init" >> Dockerfile
#printf "\nRUN $GLIDE update" >> Dockerfile
#printf "\nRUN $GLIDE install" >> Dockerfile
{
  docker build -t $GLIDE-test -f $LOCALPATH/$GLIDE/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $GLIDE\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $GLIDE-test
} || {
  printf "Error in RPM package, docker run process: $GLIDE\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $GRAFANA_CLI
printf "\nRUN yum -y install $GRAFANA_CLI\nRUN $GRAFANA_CLI --version" >> Dockerfile
{
  docker build -t $GRAFANA_CLI-test -f $LOCALPATH/$GRAFANA_CLI/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $GRAFANA_CLI\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $GRAFANA_CLI-test
} || {
  printf "Error in RPM package, docker run process: $GRAFANA_CLI\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $KIALI
printf "\nRUN yum -y install $KIALI" >> Dockerfile
#printf "\nRUN $KIALI --version" >> Dockerfile
{
  docker build -t $KIALI-test -f $LOCALPATH/$KIALI/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $KIALI\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $KIALI-test
} || {
  printf "Error in RPM package, docker run process: $KIALI\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $MINIKUBE
#printf "\nRUN yum -y install docker" >> Dockerfile
#printf "\nRUN yum -y install sudo" >> Dockerfile
#printf "\nRUN yum -y install conntrack" >> Dockerfile
printf "\nRUN yum -y install $MINIKUBE\nRUN $MINIKUBE version" >> Dockerfile
#printf "\nRUN $MINIKUBE start --driver=virtualbox  --memory \"2048\" --cpus 2" >> Dockerfile
{
  docker build -t $MINIKUBE-test -f $LOCALPATH/$MINIKUBE/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $MINIKUBE\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $MINIKUBE-test
} || {
  printf "Error in RPM package, docker run process: $MINIKUBE\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $MINIO
printf "\nRUN yum -y install $MINIO\nRUN $MINIO --version" >> Dockerfile
printf "\nRUN timeout --preserve-status 5 $MINIO server /data" >> Dockerfile
{
  docker build -t $MINIO-test -f $LOCALPATH/$MINIO/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $MINIO\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $MINIO-test
} || {
  printf "Error in RPM package, docker run process: $MINIO\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $MINIO_MC
MINIO_MC_PACKAGE="mc"
#printf "\nRUN timeout --preserve-status 5 mc" >> Dockerfile
printf "\nRUN yum -y install $MINIO_MC_PACKAGE\nRUN $MINIO_MC_PACKAGE --version" >> Dockerfile
{
  docker build -t $MINIO_MC-test -f $LOCALPATH/$MINIO_MC/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $MINIO_MC\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $MINIO_MC-test
} || {
  printf "Error in RPM package, docker run process: $MINIO_MC\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $RESTIC
printf "\nRUN yum -y install $RESTIC\nRUN $RESTIC version" >> Dockerfile
#printf "\nRUN yes | $RESTIC -r restic-repo init" >> Dockerfile
#printf "\nRUN yes | $RESTIC -r restic-repo backup ." >> Dockerfile
#printf "\nRUN yes | $RESTIC -r restic-repo snapshots" >> Dockerfile
{
  docker build -t $RESTIC-test -f $LOCALPATH/$RESTIC/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $RESTIC\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $RESTIC-test
} || {
  printf "Error in RPM package, docker run process: $RESTIC\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $TERRAFORM
printf "\nRUN yum -y install $TERRAFORM\nRUN $TERRAFORM --version" >> Dockerfile
printf "\nRUN mkdir terraform-test" >> Dockerfile
printf "\nRUN cd terraform-test" >> Dockerfile
printf "\nRUN printf \"\" >> main.tf" >> Dockerfile
printf "\nRUN terraform init" >> Dockerfile
printf "\nRUN terraform plan" >> Dockerfile
{
  docker build -t $TERRAFORM-test -f $LOCALPATH/$TERRAFORM/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $TERRAFORM\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $TERRAFORM-test
} || {
  printf "Error in RPM package, docker run process: $TERRAFORM\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $RCLONE
printf "\nRUN yum -y install $RCLONE\nRUN $RCLONE --version" >> Dockerfile
printf "\nRUN mkdir rclone1" >> Dockerfile
printf "\nRUN mkdir rclone2" >> Dockerfile
printf "\nRUN rclone config create test local config_is_local true" >> Dockerfile
printf "\nRUN rclone sync -i rclone1 rclone2" >> Dockerfile
{
  docker build -t $RCLONE-test -f $LOCALPATH/$RCLONE/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $RCLONE\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $RCLONE-test
} || {
  printf "Error in RPM package, docker run process: $RCLONE\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH

cd $MATCHBOX
printf "\nRUN yum -y install $MATCHBOX\nRUN $MATCHBOX --version" >> Dockerfile
{
  docker build -t $MATCHBOX-test -f $LOCALPATH/$MATCHBOX/Dockerfile .
} || {
  printf "Error in RPM package, docker build process: $MATCHBOX\n" >> $TRAVIS_BUILD_DIR/log_error
}
{
  docker run -d $MATCHBOX-test
} || {
  printf "Error in RPM package, docker run process: $MATCHBOX\n" >> $TRAVIS_BUILD_DIR/log_error
}
cd $LOCALPATH
