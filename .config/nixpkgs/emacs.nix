{ pkgs, ... }:

let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = https://github.com/nix-community/nix-doom-emacs/archive/master.tar.gz;
  }) {
    doomPrivateDir = ./doom.d;  # Directory containing your config.el init.el
                                # and packages.el files
    emacsPackagesOverlay = prev: final: {
      pname = "lsp-volar";
      version = "git";

      src = pkgs.fetchFromGitHub {
        owner = "jadestrong";
        repo = "lsp-volar";
        rev = "0ccdf06c409120f0d060e9a43cdf3afe05f57ed1";
        sha256 = "0j9gy5wqlcqrpynyqjgknc5kldpy24rj0yb0d29p9wqvbr993p8g";
      };
    };
  };
in {
  home.packages = [ doom-emacs ];
  services.emacs = {
    enable = true;
    package = doom-emacs;
  };
}
