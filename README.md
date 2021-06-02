# orion-setup
setup my kubernetes cluster "orion"

## master
```sh
$ ./setup.sh master
$ sudo kubeadm init --pod-network-cidr=10.0.0.0/16 --control-plane-endpoint=192.168.10.201 --apiserver-cert-extra-sans=192.168.10.201 --cri-socket unix:///run/containerd/containerd.sock --config k8s/master-config.yml
```

## worker
```sh
$ ./ignition.sh [temp addr] worker01
$ scp -r k8s core@192.168.10.201:~
$ ssh core@192.168.10.201
$ sudo kubeadm join
```
