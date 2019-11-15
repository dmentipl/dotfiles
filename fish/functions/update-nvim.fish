function update-nvim
  nvim +PlugUpgrade +PlugUpdate +UpdateRemotePlugins +qall
  pip install --upgrade pynvim
end
