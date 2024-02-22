FROM rockylinux:9

RUN dnf install -qy --nogpgcheck \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E %rhel).noarch.rpm \
   https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm \
   https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm; \
  dnf config-manager --add-repo=http://guaix.fis.ucm.es/~spr/sttl.repo; \
  dnf install -qy --setopt=install_weak_deps=False \
  cleanest \
  && dnf clean -q all

RUN groupadd -f -g 2024 reducm && \
    useradd -m -u 2024 -g reducm reducm

USER reducm
WORKDIR /home/reducm
RUN mkdir data
