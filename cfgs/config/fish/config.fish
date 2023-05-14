if status is-interactive
    # Commands to run in interactive sessions can go here
    if type -q gcloud
        source (dirname (realpath (which gcloud)))/../path.fish.inc
    end
end
set fish_greeting

if test "$TERM" = "dumb"
  function fish_prompt
    echo "\$ "
  end

  function fish_right_prompt; end
  function fish_greeting; end
  function fish_title; end
end
