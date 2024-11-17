# README

## Overview

This repository is a simple attempt to get K3s running in a `bootc` container. While most steps are functional, there is an unresolved issue with the final step. For reference, [cdrage's containerfile repository](https://github.com/cdrage/containerfile) provides great examples, including a `bootc` container file for K3s.

## Instructions

To build the container, run:

```bash
podman-compose build
```

## Learn More About `bootc`

Here are some helpful resources to learn more about `bootc`:

- [Bootc Examples (Fedora GitLab)](https://gitlab.com/fedora/bootc/examples)  
- [Bootc Documentation](https://containers.github.io/bootc/)  
- [Fedora Docs: Getting Started with Bootc](https://docs.fedoraproject.org/en-US/bootc/getting-started/)  
- [Bootc Discussions: Bootc This Week](https://discussion.fedoraproject.org/tag/bootc-initiative)  

Feel free to explore these resources to expand your understanding of `bootc` and its potential!