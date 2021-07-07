function fish_command_not_found
  set -l p /run/current-system/sw/bin/command-not-found
  if [ -x $p -a -f /nix/var/nix/profiles/per-user/root/channels/nixos/programs.sqlite ]
    # Run the helper program.
    NIX_AUTO_RUN=true $p $argv
    # Retry the command if we just installed it.
    if [ $status = 126 ]
      "$argv"
    else
      return 127
    end
  else
    echo "$1: command not found" >&2
    return 127
  end
end