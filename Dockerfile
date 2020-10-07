# syntax = docker/dockerfile:1.1.7-experimental

FROM golang:1.15.2-buster

# Force the module pull to run via git and exercise the SSH-agent
ARG GOPRIVATE=github.com

ADD . /src

RUN --mount=type=ssh \
    set -e; \
	apt-get update; \
	apt-get -y install make; \
    useradd -m -s /bin/zsh testuser; \
    chown -R testuser:testuser /home/testuser; \
    mkdir /root/.ssh; \
    mv /src/.gitconfig /root/.gitconfig; \
    mv /src/.sshconfig /root/.ssh/config; \
    chown -R root:root /root/.ssh; \
    chmod u=rw,g=,o= /root/.ssh/config; \
    cd /src; \
    make build; \
    rm -fr /root/.ssh; \
    mv /src/buildkit-ssh-sample /usr/bin/buildkit-ssh-sample

USER testuser
WORKDIR /home/testuser

CMD ["/usr/bin/buildkit-ssh-sample"]
