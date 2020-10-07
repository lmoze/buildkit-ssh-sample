# buildkit-ssh-sample

Sample Docker "hello-world" with Go + Github. Demonstrates a build using Docker Buildkit with SSH agent forwarding.

## Overview

This Docker image builds a small Go binary that imports a public example Go module from Github. Some Go/git trickery is employed to force the build to download the example module from Github via SSH. This emulates the use-case where a Go module is hosted in a private Github repo and downloaded via SSH at build-time.

Docker buildkit's `--ssh` option is used to pass the hosts's SSH agent into the Docker build. Because the public Go module is downloaded via SSH, the host SSH agent must be configured with a valid Github user's SSH keypair.


## Usage

### Linux

* Install Docker Engine [Docker Install Docs](https://docs.docker.com/engine/install/)
* Set up your Github SSH keys and add them to your SSH agent [Github Docs](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
* Clone this repository locally and open a terminal to the cloned files location
* Run the build script `./build-and-run-linux.sh`

### Windows

_As of Docker Desktop 2.4.0.0-stable with Docker engine 19.03.13, following these instructions will result in an error similar to the following:_


```

could not parse ssh: [default]: failed to open \\.\\pipe\\openssh-ssh-agent: open \\.\\pipe\\openssh-ssh-agent: All pipe instances are busy.

```

* Install Docker Desktop for Windows [Docker Install Docs](https://docs.docker.com/docker-for-windows/install/)
* Install the Windows OpenSSH agent [Microsoft Docs](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse)
* Ensure the "OpenSSH Authentication Agent" service is enabled and running
* Add your Github SSH keys to the SSH agent [Microsoft Docs](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement#user-key-generation)
* Clone this repository locally
* Run the build script `build-and-run-windows.bat`

## Other Notes
The Windows OpenSSH agent is hardcoded to listen on a named pipe at `\\.\\pipe\\openssh-ssh-agent` [Microsoft code on Github](https://github.com/PowerShell/openssh-portable/blob/8ab565c53f3619d6a1f5ac229e212cad8a52852c/contrib/win32/win32compat/ssh-agent/agent.c#L40)
