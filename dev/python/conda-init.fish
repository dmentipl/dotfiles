function conda-init --description "Initialise conda for fish shell"
  test -e ~/conda/condabin/conda &&
    eval ~/conda/condabin/conda "shell.fish" "hook" $argv | source
  function fish_right_prompt; end
end
