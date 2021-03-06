---
title: Como instalar o systemtap no debian
date: 2019-03-07 23:30:09
categories:
- Systemtap
- Instrumentation
- Infraestructure
- TI
---



Os passos desta instalação foram realizados no Debian 9, mas segundo a [documentação oficial](https://sourceware.org/systemtap/documentation.html){:target="_blank"}:

>Systemtap works with official Debian kernel packages since the Squeeze release (with the exception of user space probes that are not supported yet, see Debian bug #691167). To use systemtap you need to manually install the linux-image-*-dbg and linux-header-* packages that match your running kernel. To simplify this task you can use the stap-prep command. Please always run this before reporting a bug.

**Passos da instalação**

Instalar o systemtap via `apt install`:

`apt install systemtap`

`apt install linux-headers-$(uname -r) && linux-image-$(uname -r)-dbg`

Verificando a instalação e executando um *Hello, World!*:

`stap -e 'probe begin { printf("Hello, World!\n"); exit() }'`

Se um usuário não administrador (não *root*) for utilizar o systemtap, é necessário o adicionar nos grupos *stapusr, stapdev, stapsys*:

`usermod -a -G grupo usuario` 

Após a reinicialização, será possível utilizar com o usuário.