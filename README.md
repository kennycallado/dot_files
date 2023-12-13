# My dot files

## Dependencies

## Instalación chezmoi

``` bash
apt install -y git curl && bash -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply kennycallado/dot_files && \
source $HOME/.bashrc && \
$HOME/.local/bin/chezmoi cd && \
git remote set-url origin git@github.com:kennycallado/dot_files.git && \
exit
```

### key

Debido a la existencia de algunos ficheros cifrados es necesario usar un key. Este fichero es el key.txt el cual es necesario desencriptar previamente o usar una copia.

## Instalación herramientas

### base

``` bash
sudo apt install git curl luakit picom zathura fonts-noto-color-emoji i3lock-fancy poppler-utils xclip fzf pulseaudio build-essential bat ripgrep conky-std jq tidy
```

### dudas

``` bash
sudo apt install w3m droopy
```

droopy: compartir ficheros http

### wezterm

``` bash
curl -LO https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly.Debian12.deb && sudo apt install -y ./wezterm-nightly.Debian12.deb
```

### joshuto

``` bash
REPO="kennycallado/joshuto" bash <(curl -s https://raw.githubusercontent.com/kamiyaa/joshuto/master/utils/install.sh)
```

### starship

``` bash
sudo curl -sS https://starship.rs/install.sh | sh
```

### firefox

``` bash
sudo apt install firefox firefox-l10n-xpi-es-es
```

### rust

``` bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### node

``` bash
sudo apt install nodejs npm
```

### neovim y lunarvim

``` bash
sudo apt install python3-pynvim

bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/rolling/utils/installer/install-neovim-from-release)

LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
```

Quizá antes de entrar y que se intalen los paquetes devolver la configuración

``` bash
chezmoi update
```

###  podman


``` bash
sudo apt install podman podman-compose
```

``` bash
sudo apt install cgroupfs-mount uidmap slirp4netns fuse-overlayfs
```

I have tried (I don't know if it's needed):

``` bash
echo rc_cgroup_mode=unified > /etc/rc.conf
```

Edit  /etc/containers/registries.conf

```
[registries.search]
registries = ['docker.io']
```

#### crosscompiling

I think is useful

``` bash
sudo apt install qemu-user-static binfmt-support
```

- sometime in the past I had to install `qemu-user-binfmt` and then reinstall `qemu-user-static`
- I think if I want to compile to aarch64 I should install `qemu-system-arm`

---

## Otros:

### Montar partición encriptada:

Seguir los siguientes pasos:

``` bash
sudo cryptsetup open /dev/sdb2 external --type luks

sudo mount /dev/mapper/external /mnt/
```

---
