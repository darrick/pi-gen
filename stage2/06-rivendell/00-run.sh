#!/bin/bash -e

install -m 644 files/openrepo-rivendell-aarch64.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"

cat files/openrepo-rivendell-aarch64.gpg | gpg --dearmor > "${STAGE_WORK_DIR}/openrepo-rivendell-aarch64.gpg"
install -m 644 "${STAGE_WORK_DIR}/openrepo-rivendell-aarch64.gpg" "${ROOTFS_DIR}/etc/apt/keyrings/"

on_chroot << EOF
wget http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb
dpkg -i deb-multimedia-keyring_2016.8.1_all.deb
rm -r deb-multimedia-keyring_2016.8.1_all.deb
echo "deb http://deb-multimedia.org bullseye main non-free" >> /etc/apt/sources.list
apt-get update
useradd -m -c Rivendell\ Audio --groups audio rd && echo rd:letmein | chpasswd
EOF
