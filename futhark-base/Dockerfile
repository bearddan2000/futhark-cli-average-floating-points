FROM ubuntu:22.04

ENV NIX_CHANNEL nixpkgs

ENV NIX_CHANNEL_URL https://nixos.org/channels/nixos-22.05

ENV NIX_PKG futhark

ENV USERNAME developer

WORKDIR /app

RUN apt update

RUN apt-get install -y --no-install-recommends \
    apt-transport-https \
    software-properties-common \
    nix sudo clang lld

RUN nix-channel --add $NIX_CHANNEL_URL $NIX_CHANNEL \
    && nix-channel --update \
    && nix-env -iA $NIX_CHANNEL.$NIX_PKG \
    && nix-build "<${NIX_CHANNEL}>" -A $NIX_PKG \
    && ln -s /app/result/bin/$NIX_PKG /bin/$NIX_PKG

CMD ""