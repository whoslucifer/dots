{...}: {
  programs.ssh = {
    enable = true;

    # Add the SSH private key directly
    keys."github" = {
      keyContents = ''
        SHA256:+QhbOoQ5BMls/gtRrWuH5kDh7Li9pow69aB91mWsGs0
      '';
      permissions = "0600"; # Secure permissions
    };
  };
}
