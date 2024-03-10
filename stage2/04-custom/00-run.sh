#!/bin/bash -e

install -m 644 files/.gitconfig	"${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}"/.gitconfig

install -m 644 files/docker.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"

cat files/docker.gpg.key | gpg --dearmor > "${STAGE_WORK_DIR}/docker.gpg"
install -m 644 "${STAGE_WORK_DIR}/docker.gpg" "${ROOTFS_DIR}/etc/apt/trusted.gpg.d/"

install -m 644 files/openvpn3.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"

cat files/openvpn3.gpg.key | gpg --dearmor > "${STAGE_WORK_DIR}/openvpn3.gpg"
install -m 644 "${STAGE_WORK_DIR}/openvpn3.gpg" "${ROOTFS_DIR}/etc/apt/trusted.gpg.d/"
