SET SSH_AUTH_SOCK=\\.\\pipe\\openssh-ssh-agent
SET DOCKER_BUILDKIT=1
docker.exe build --ssh default -t buildkit-ssh-sample:latest .
docker.exe run --rm buildkit-ssh-sample:latest
PAUSE
