function update-brew
  brew update
  brew upgrade
  yes | brew cleanup
end
