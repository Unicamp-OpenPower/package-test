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
printf "\nRUN yum -y install $GLIDE\nRUN $GLIDE --version" >> Dockerfile
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
#printf "\nRUN yum -y install $KIALI\nRUN $KIALI --version" >> Dockerfile
printf "\nRUN yum -y install $KIALI" >> Dockerfile
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
printf "\nRUN yum -y install $MINIKUBE\nRUN $MINIKUBE version" >> Dockerfile
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
