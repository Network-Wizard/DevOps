# K8S Installation Guide
```bash
# INSTALL DOCKER/CRI
sudo apt-get update
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
#sudo docker run hello-world

# INSTALL K8S
#sudo systemctl status containerd.service
#sudo -i
containerd config default > /etc/containerd/config.toml
#exit
sudo vim /etc/containerd/config.toml
# [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
#  ...
#  [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
#    SystemdCgroup = true

#sudo systemctl daemon-reload
sudo systemctl restart containerd.service
sudo systemctl status containerd.service 
#ip link
#sudo cat /sys/class/dmi/id/product_uuid
#nc 127.0.0.1 6443 -v
#sudo ufw status
#sudo systemctl stop ufw
#sudo systemctl disable ufw
#hostname

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.ipv4.ip_forward = 1
EOF

sudo sysctl --system
sysctl net.ipv4.ip_forward
#sudo timedatectl set-timezone <proper timezone>
sudo swapoff -a
sudo vim /etc/fstab # make swapoff permanent
#free -h
sudo modprobe br_netfilter
echo br_netfilter | sudo tee /etc/modules-load.d/kubernetes.conf
sudo sysctl -w net.bridge.bridge-nf-call-iptables=1
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gpg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo systemctl enable --now kubelet
# on master node
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --v=5
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
export KUBECONFIG=/home/<username>/.kube/config
vim .zshrc
sudo systemctl status kubelet.service
#nc -zv 127.0.0.1 6443
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml	# using flannel as CNI
kubectl get pods --all-namespaces
#watch -d -n 5 kubectl get pods --all-namespaces
kubectl get pods --all-namespaces
#echo $KUBECONFIG
```