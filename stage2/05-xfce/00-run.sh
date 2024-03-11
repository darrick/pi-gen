#!/bin/bash -e

# http://c-nergy.be/blog/?p=12043
install -m 644 etc/polkit-1/localauthority/50-local.d/45-allow-colord.pkla "${ROOTFS_DIR}"/etc/polkit-1/localauthority/50-local.d/

#Install XRDP-PULSEAUDIO
install -m 644 usr/lib/pulse-14.2/modules/*.so "${ROOTFS_DIR}"/usr/lib/pulse-14.2/modules/

install -d "${ROOTFS_DIR}"/usr/local/libexec/pulseaudio-module-xrdp/
install -m 755 usr/local/libexec/pulseaudio-module-xrdp/load_pa_modules.sh "${ROOTFS_DIR}"/usr/local/libexec/pulseaudio-module-xrdp/

install -m 644 etc/xdg/autostart/pulseaudio-xrdp.desktop "${ROOTFS_DIR}"/etc/xdg/autostart/

#Add Environment=JACK_PROMISCUOUS_SERVER=audio
install -d "${ROOTFS_DIR}"/etc/skel/.config/systemd/user
install -m 644 etc/skel/.config/systemd/user/pulseaudio.service "${ROOTFS_DIR}"/etc/skel/.config/systemd/user/pulseaudio.service
