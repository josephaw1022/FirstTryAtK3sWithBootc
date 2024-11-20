# README

## Overview

This repository explores the use of `bootc` containers for running K3s. While the initial attempt in the `first-try` directory is incomplete and contains unresolved issues, the `copy-example` directory provides a **fully functional setup** for automating the creation and management of a Hyper-V virtual machine running K3s.

---

## Working Setup: `copy-example`

The **`copy-example`** directory contains a complete and functional setup for:
- Building container images with Podman.
- Creating virtual hard disks (VHDs) from the container images.
- Setting up and running a K3s-enabled Hyper-V virtual machine.

### To Get Started:
1. Navigate to the `copy-example` directory:
   ```bash
   cd copy-example
   ```
2. Follow the instructions in the `copy-example` [README](./copy-example/README.md).

This setup is reliable and fully tested, offering a robust workflow for building and running K3s.

---

## Incomplete Setup: `first-try`

The **`first-try`** directory contains an earlier attempt to set up K3s in a `bootc` container. While most steps are functional, there is an unresolved issue with the final step, and this directory is **not recommended for use**.

To see the incomplete setup:
1. Navigate to the `first-try` directory:
   ```bash
   cd first-try
   ```
2. Build the container (though this does not produce a fully working setup):
   ```bash
   podman-compose build
   ```

For reference, this setup was inspired by [cdrage's containerfile repository](https://github.com/cdrage/containerfiles), which includes examples for K3s in a `bootc` container.

---

## Learn More About `bootc`

Here are some helpful resources to learn more about `bootc`:

- [Bootc Examples (Fedora GitLab)](https://gitlab.com/fedora/bootc/examples)  
- [Bootc Documentation](https://containers.github.io/bootc/)  
- [Fedora Docs: Getting Started with Bootc](https://docs.fedoraproject.org/en-US/bootc/getting-started/)  
- [Bootc Image Builder Documentation](https://github.com/osbuild/bootc-image-builder)  
- [Bootc Discussions: Bootc This Week](https://discussion.fedoraproject.org/tag/bootc-initiative)  

These resources are excellent starting points to explore `bootc` and its capabilities.