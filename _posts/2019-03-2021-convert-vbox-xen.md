---
title: How to export a VM Virtualbox  to a Xen virtual machine
date: 2019-03-06 23:30:09
categories:
- VirtualBox
- Xen
- Infraestructure
- TI
---

**Step 1:** can convert your VDI disk image to a RAW disk
  VBoxManage clonehd centos6.vdi centos6.img -format RAW

**Step 2:** Refer to the centos6.vbox file, and create the configuration file for Xen VM.  You can do this manually or create a shell script that would extract the necessary fields and parse them into Xen configuration file.
```
  cat /etc/xen/centos6
  name = "centos6"
  uuid = "f220932f-8750-4f5b-b220-8050210e9835"
  memory = 1024
  vcpus = 1
  bootloader = "/usr/bin/pygrub"
  on_poweroff = "destroy"
  on_reboot = "restart"
  on_crash = "restart"
  disk = [ "file:/var/lib/xen/images/centos6.img,xvda,w" ]
  vif = [ "mac=00:16:3e:46:e6:fb,bridge=xenbr0" ]
  extra="console=hvc0"
  ```
  