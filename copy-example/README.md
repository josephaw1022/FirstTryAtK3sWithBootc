
# Copy-Example Task Automation

This subdirectory contains automation scripts using Taskfile to manage a Hyper-V virtual machine setup, including building container images, creating virtual hard disks (VHDs), and running end-to-end workflows.


## Credits and Inspiration

This setup was inspired by the excellent work in the [cdrage/containerfiles](https://github.com/cdrage/containerfiles) repository. Specifically, the directory [bootc-k3s-master-amd64](https://github.com/cdrage/containerfiles/tree/main/bootc-k3s-master-amd64) provided valuable insights into building and running K3s in a `bootc` container.


## Prerequisites

To get started, ensure you are running **Windows 11 Pro** and have the following tools and features installed:

### Enable Hyper-V
Run the following command in an elevated PowerShell terminal to enable Hyper-V:
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

## Instructions

1. Ensure all prerequisites are installed and configured.
2. Navigate to the `copy-example` directory.
3. Run the following command to view all available tasks:
   ```powershell
   task
   ```
   This will list all the tasks defined in the Taskfile.


Before running any of the tasks. Make sure to update the config.json file to have the credentials and all that you want.


---

## Key Tasks

Here are the most notable tasks included in the Taskfile:

### `full-shutdown`
This task will **delete everything**, including:
- The VM in Hyper-V.
- The container images and VHDs.
- Any temporary or intermediate files.

### `full-start`
This task will **rebuild everything** from scratch, including:
- Building container images.
- Creating the VHD.
- Copying the VHD to the appropriate directory.
- Configuring Hyper-V to create and run the VM.

### `full-e2e`
This task performs a complete end-to-end workflow by:
1. Running the `full-shutdown` task.
2. Running the `full-start` task.

---

## Usage Example
To run a task, simply execute the following command in the `copy-example` directory:
```powershell
task <task-name>
```

For example:
- To run the full end-to-end workflow and run full shutdown and full startup:
  ```powershell
  task full-e2e
  ```
- To clean up everything:
  ```powershell
  task full-shutdown
  ```
- To create everything:
  ```powershell
  task full-start
  ```
