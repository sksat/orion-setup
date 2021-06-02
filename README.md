# orion-setup
setup my kubernetes cluster "orion"

## master
```sh
$ ./setup.sh master
$ sudo kubeadm init --cri-socket unix:///run/containerd/containerd.sock --config k8s/master-config.yml
```

## worker
```sh
$ ./ignition.sh [temp addr] worker01
$ scp -r k8s core@192.168.10.201:~
$ ssh core@192.168.10.201
$ sudo kubeadm join
```
