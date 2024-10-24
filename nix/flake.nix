{
  description = "Hansen's Nix Setup"; 
  	
  inputs = {
  	  nixpkgs.url = "nixpkgs/nixos-unstable";

	    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

      spicetify-nix = {
          url = "github:Gerg-L/spicetify-nix";
          inputs.nixpkgs.follows = "nixpkgs";
      };

	    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";

      home-manager = {
          url = "github:nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
      };


   };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
          system = "x86_64-linux";
          host = "nix";
          username = "asherah";

          pkgs = import nixpkgs {
       	      inherit system;
       	      config = {
       	          allowUnfree = true;
       	      };
          };

  in
  {
	        nixosConfigurations = {
            "${host}" = nixpkgs.lib.nixosSystem rec {
		            specialArgs = { 
			              inherit system;
			              inherit inputs;
			              inherit username;
			              inherit host;
			          };

	  		        modules = [ 

				          ./hosts/${host}/config.nix

                  inputs.spicetify-nix.nixosModules.default
        
				          inputs.distro-grub-themes.nixosModules.${system}.default

				        ];
			      };

		    };
        
        homeConfigurations = {
          "${username}" = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = [ ./home.nix ];
          };
        };
	    };
}

