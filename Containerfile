# Use the AlmaLinux bootc image as the base
FROM quay.io/almalinuxorg/almalinux-bootc:9.4-20241112

# Set the user to root
USER root

# Environment variables for K3s
ENV K3S_TOKEN="Abc123XyZ4567890"

# Install necessary packages and dependencies
RUN dnf install -y firewalld curl
RUN dnf clean all

# Configure firewall rules for K3s
RUN firewall-offline-cmd --zone=public --add-port=2379-2380/tcp && \
    firewall-offline-cmd --zone=public --add-port=6443/tcp && \
    firewall-offline-cmd --zone=public --add-port=8472/udp && \
    firewall-offline-cmd --zone=public --add-port=10250/tcp && \
    firewall-offline-cmd --zone=public --add-port=51820/udp && \
    firewall-offline-cmd --zone=public --add-port=51821/udp && \
    firewall-offline-cmd --zone=public --add-port=5001/tcp && \
    firewall-offline-cmd --zone=public --add-port=6443/tcp

# Create K3s configuration directory and file
RUN mkdir -p /etc/rancher/k3s && \
    cat <<EOF > /etc/rancher/k3s/config.yaml
token: ${K3S_TOKEN}
debug: true
tls-san:
  - $(hostname -i)
write-kubeconfig-mode: 644
EOF

# Install K3s
RUN curl -sfL https://get.k3s.io | sh -
