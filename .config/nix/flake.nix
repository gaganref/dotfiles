{
  description = "Gagan nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = { 
    self,
    nix-darwin, 
    nixpkgs, 
    nix-homebrew, 
    ...
  } @ inputs: 
  let
    configuration = { pkgs, ... }: {
      # Using touch id for sudo.
      security.pam.enableSudoTouchIdAuth = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [ 
        pkgs.bat
        pkgs.bat-extras.batdiff
        pkgs.bat-extras.batgrep
        pkgs.bat-extras.batman
        pkgs.bat-extras.batpipe
        pkgs.bat-extras.prettybat
        pkgs.btop
        pkgs.ccache
        pkgs.cmake
        pkgs.ctop
        pkgs.curlie
        # pkgs.direnv
        pkgs.dive
        pkgs.eza
        pkgs.fzf
        pkgs.gh
        pkgs.git
        pkgs.gping
        pkgs.gum
        pkgs.imhex
        pkgs.jq
        pkgs.lazydocker
        pkgs.lazygit
        pkgs.neofetch
        pkgs.neovim
        pkgs.ripgrep
        pkgs.starship
        pkgs.stow
        pkgs.tmux
        pkgs.tmuxinator
        pkgs.yazi
        pkgs.zed-editor
        pkgs.zig
        pkgs.zls
        pkgs.zoxide 
      ];

      homebrew = {
        enable = true;
	      taps = [
	      ];  
	      brews = [
          "mas"
	      ];
	      casks = [
	        "1password"
	        "1password-cli"
	        "affinity-designer"
	        "affinity-photo"
	        "affinity-publisher"
	        "alt-tab"
          "arc"
          "bartender"
	        "betterdisplay"
            "cleanshot"
          "daisydisk"
	        "discord"
	        "displaylink"
          "ghostty"
	        "google-chrome"
          "keymapp"
          # "lm-studio"
          "logi-options+"
	        "naps2"
	        "notchnook"
	        "raycast"
	        "spotify"
	        "surfshark"
	        "synology-drive"
	        "vlc"
	        "zen-browser"
       	];
       	masApps = {
          "Brother" = 1193539993;
       	  "Magnet" = 441258766; 
       	  "Whatsapp" = 310633997;
       	  "Wireguard" = 1451685025;
          "Xcode" = 497799835;
        };

       	# This make sures that only the above are installed.
       	onActivation.cleanup = "zap";
       	onActivation.autoUpdate = true;
       	onActivation.upgrade = true;
      };

      fonts.packages = [
        pkgs.nerd-fonts.jetbrains-mono
      ];

      # To configure system settings
      system.defaults = {
       	finder.FXPreferredViewStyle = "clmv";
       	loginwindow.GuestEnabled = false;
       	NSGlobalDomain.AppleInterfaceStyle = "Dark";
       	NSGlobalDomain.AppleICUForce24HourTime = true;
       	trackpad.Clicking = true;
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, 
      # please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
      
      # To allow broken packages or not, default is false.
      nixpkgs.config.allowBroken = false;
    
      # To allow unfree packages or not, default is false
      nixpkgs.config.allowUnfree = true;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#macbook
    darwinConfigurations."macbook" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration 
	      nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # User owning the Homebrew prefix
            user = "gagan";

            # Declarative tap management
            taps = {
            };
          };
        }
      ];
    };
  };
}
