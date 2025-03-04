# My NixOS configuration
This is my personal NixOS configuration I use for my home computer. This config is not finished and is subject to change.

I switched to NixOS in late summer of 2024 and since then I never really used a different operating system.
By the time of writing this, I am still not understanding how the nix language works. I am just being one of the impostors of the nix-community who tells everyone that I am an "experienced" user.

# Installing

> [!NOTE]
> - After rebuilding NixOS with my config, you can run `rebuild` from anywhere to rebuild your system!
> - Run `rebuild-upgrade` to upgrade `nixpkgs`.
> - This is my personal config. Don't expect that rebuilding with my config won't result in errors.

## 1. Clone the repo and enter it
```bash
git clone https://github.com/vol8/nixos-config

cd nixos-config
```

## 2. Rebuilt NixOS
```bash
sudo nixos-rebuild switch --flake .
```
