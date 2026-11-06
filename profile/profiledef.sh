#!/usr/bin/env bash
# Nixel OS - ArchISO Profile Definition

iso_name="nixel"
iso_label="NIXEL_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Nixel Project <https://github.com/Azure-6-lgtm>"
iso_application="Nixel OS Live Environment"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"

install_dir="arch"

bootmodes=(
  'bios.syslinux'
  'uefi.systemd-boot'
)

pacman_conf="pacman.conf"

airootfs_image_type="squashfs"

airootfs_image_tool_options=(
  '-comp' 'xz'
  '-Xbcj' 'x86,arm64'
  '-b' '1M'
  '-Xdict-size' '1M'
)

bootstrap_tarball_compression=(
  'zstd'
  '-c'
  '-T0'
  '--auto-threads=logical'
  '--long'
  '-19'
)

kernel_params_aarch64="clk_ignore_unused pd_ignore_unused arm64.nopauth"

file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"

  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"

  # Nixel live user setup
  ["/usr/local/bin/nixel-live-user-setup"]="0:0:755"
)
