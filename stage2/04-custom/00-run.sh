#!/bin/bash -e

install -m 644 files/.gitconfig	"${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}"/.gitconfig

install -m 644 files/docker.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"

install -d "${ROOTFS_DIR}/etc/apt/keyrings/"
cat files/docker.gpg.key | gpg --dearmor > "${STAGE_WORK_DIR}/docker.gpg"
install -m 644 "${STAGE_WORK_DIR}/docker.gpg" "${ROOTFS_DIR}/etc/apt/keyrings/"

install -m 644 files/openvpn3.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"

install -m 644 files/openvpn3.gpg.key "${ROOTFS_DIR}/etc/apt/keyrings/openvpn.asc"

on_chroot << EOF
apt-get update
EOF
