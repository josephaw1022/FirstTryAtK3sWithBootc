
# Copy-Example Task Automation

This directory contains automation scripts, powered by Taskfile, to manage a Hyper-V virtual machine setup. The tasks include building container images, creating virtual hard disks (VHDs), and running complete end-to-end workflows.

## Credits and Inspiration

This setup draws inspiration from the excellent work in the [cdrage/containerfiles](https://github.com/cdrage/containerfiles) repository. Specifically, the [bootc-k3s-master-amd64](https://github.com/cdrage/containerfiles/tree/main/bootc-k3s-master-amd64) directory provided valuable insights into building and running K3s in a `bootc` container.

---

## Prerequisites

To get started, ensure you are running **Windows 11 Pro** and have the following tools and features installed:

### Enable Hyper-V
Run this command in an elevated PowerShell terminal to enable Hyper-V:
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```

### Install Taskfile
Install Taskfile using Chocolatey:
```powershell
choco install go-task -y
```

### Install Podman Desktop
Install Podman Desktop via Chocolatey:
```powershell
choco install podman-desktop
```

### Install Podman-Compose
Install Podman-Compose using Python's package manager:
```powershell
pip install podman-compose
```

---

## Quick Start

Follow these steps to set up your Hyper-V VM, retrieve the necessary files, and connect to your Kubernetes cluster:

1. **Prepare the Configuration:**
   - Open the `config.json` file and update it with your credentials and any other required details.

2. **Start the VM:**
   - Run the following task to build and start the VM:
     ```powershell
     task full-start
     ```
   - Allow the task to complete and give the Hyper-V VM a few minutes to boot and initialize.

3. **Access the VM in Hyper-V:**
   - Open the Hyper-V Manager using this task:
     ```powershell
     task open-hyperv-manager
     ```
   - Connect to the VM and log in using your credentials.

4. **Retrieve the VM's IP Address:**
   - Run the following command inside the VM:
     ```bash
     ip addr show
     ```
   - Note the IP address of the VM (it will typically start with `172.x.x.x` if running locally).

5. **Exit Hyper-V and Retrieve the Kubeconfig File:**
   - Use `scp` to copy the K3s kubeconfig file from the VM to your local machine:
     ```bash
     scp user@<VM_IP>:/etc/rancher/k3s/k3s.yaml .
     ```
     Replace `<VM_IP>` with the IP address of the VM.

6. **Modify the Kubeconfig File:**
   - Open the downloaded file and replace `127.0.0.1` with the VM's IP address.

7. **Connect to the Kubernetes Cluster:**
   - Open [Headlamp](https://github.com/kinvolk/headlamp), a Kubernetes UI, and use the modified kubeconfig file to view and manage resources in your cluster.

---

## Instructions

To explore available tasks, navigate to the `copy-example` directory and run:
```powershell
task
```
This will list all the tasks defined in the Taskfile. Be sure to update the `config.json` file with your credentials before running any tasks.

---

## Key Tasks

Here are the primary tasks included in the Taskfile:

### `full-start`
This task builds everything from scratch, including:
- Building container images.
- Creating the VHD.
- Configuring Hyper-V to create and run the VM.

### `full-shutdown`
This task deletes everything, including:
- The Hyper-V VM.
- Container images and VHDs.
- Temporary or intermediate files.

### `full-e2e`
This task performs a complete end-to-end workflow:
1. Runs the `full-shutdown` task.
2. Runs the `full-start` task.

---

## Usage Examples

To run a task, execute the following command in the `copy-example` directory:
```powershell
task <task-name>
```

### Examples:
- To run the full end-to-end workflow:
  ```powershell
  task full-e2e
  ```
- To start the VM:
  ```powershell
  task full-start
  ```
- To clean up everything:
  ```powershell
  task full-shutdown
  ```
