Homebrew
========

Install Homebrew itself.

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Update and run `brew doctor` to see if there are any problems.

```bash
brew update && brew doctor
```

Add taps.

```bash
brew tap caskroom/cask
```

Install packages from `Brewfile`.

```bash
cat Brewfile | xargs brew install
```

Install casks from `Caskfile`.

```bash
cat Caskfile | xargs brew cask install
```

App Store
---------

Use `mas` (installed by Homebrew) to install software from the App Store

```bash
mas install 990588172  ## Gestimer
mas install 1102341786 ## RulerSwift
```
