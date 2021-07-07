if status is-interactive
    # Commands to run in interactive sessions can go here
    if type -q gcloud
        source (dirname (realpath (which gcloud)))/../path.fish.inc
    end
end
set fish_greeting