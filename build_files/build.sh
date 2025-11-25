#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Enable use of copr repos
dnf install -y 'dnf5-command(config-manager)'

# this installs a package from fedora repos
#dnf5 install -y tmux
dnf install -y langpacks-en_GB \
  distrobox \
  alacritty \
  kitty \
  kitty-terminfo \
  syncthing \
  fzf \
  just \
  powerstat

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
dnf copr enable -y ublue-os/packages
dnf install -y uupd \
  ublue-setup-services \
  ublue-os-udev-rules \
  ublue-os-luks \
  ublue-os-just
dnf copr disable -y ublue-os/packages

dnf copr enable -y yalter/niri-git
dnf copr enable -y avengemedia/dms-git
dnf copr enable -y avengemedia/danklinux
dnf install -y libdisplay-info \
  libseat \
  xwayland-satellite \
  niri \
  dms \
  dms-cli \
  dms-greeter \
  dgop
dnf copr disable -y yalter/niri-git
dnf copr disable -y avengemedia/dms-git
dnf copr disable -y avengemedia/danklinux

#### Example for enabling a System Unit File

#systemctl enable podman.socket
systemctl enable greetd.service
systemctl enable --global dms.service
