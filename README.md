# dotfiles
These are my dotfiles for OSX Sonoma. There are many like them, but these ones are mine.

Previous versions of this repo (archived) can be found here:
- [https://github.com/jansroka/dotfiles-osx-monterey](https://github.com/jansroka/dotfiles-osx-monterey)
- [https://github.com/jansroka/dotfiles-osx-ventura](https://github.com/jansroka/dotfiles-osx-ventura)

## Features
- super simple setup
- uses ansible and is idempotent
- keeps ```~/``` clean

## Available ansible roles
- brew
	- configurdes homebrew includings casks & Microsoft Office (runtime: a few minutes)
- dock
	- configure your OSX dock (runtime: < 1 min)
- docker
	- purges dangling and unnecessary images, containers, images (runtime: ca. 1 min)
- duti
	- set default app associations via ```duti``` (runtime: < 1 min)
- gem
	- set up and maintain my default gems (runtime: 1 min)
- hazel
	- ensure basic Hazel.app settings (runtime: seconds)
- iterm
	- ensure our own preferences file is used (runtime: seconds)
- maintenance
	- runs a few maintenance tasks like repairPermissions, verifyVolume (runtime: several minutes)
- mas
	- takes care of apps installed via Mac App Store (runtime: 1 min)
- npm
	- install the few global npm packages that I use (runtime: a few secs)
- osx
	- set lots of defaults for OSX and OSX apps (runtime: < 1 min)
- pip
	- install and maintain pip modules (runtime: < 1 min)
- sublime-text
	- install via brew cask & symlink (runtime:  < 1 min)
- symlinks
	- softlink a bunch of config files in to ```~/``` (runtime: seconds)

## Getting started
You’ll need the following dependencies before getting started.

- Ansible
- Homebrew
- Xcode

At the time of writing it’s possible to get all three like so:

```
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible
```

## How to run with a one-liner
Run this:
```
curl -L https://raw.github.com/jansroka/dotfiles/master/bin/setup.sh | bash
```
Make sure to read the code before running.

## How to run the whole thing for setup
```
time ansible-playbook dotfiles.yml -v --ask-become-pass
```

## How to run the update playbook only for softwareupdates
Run this:
```
time ansible.cfg ansible-playbook update.yml -v --ask-become-pass
```

## How to run the maintenance playbook
Run this:
```
time ansible-playbook maintenance.yml -v --ask-become-pass
```

## How to make changes to this repo // pre-commit hooks
I am using ```pre-commit``` in this repo to lint before commits. Install it via brew using
```
brew install pre-commit
```

## Contributing
- Fork it ( https://github.com/jansroka/dotfiles/fork)
- Create your feature branch (```git checkout -b my-new-feature```)
- Commit your changes (```git commit -am 'Add some feature'```)
- Push to the branch (```git push origin my-new-feature```)
- Create a new Pull Request

## Inspiration
- https://github.com/soehlert/osx-ansible
- https://github.com/geerlingguy/mac-dev-playbook/
- https://github.com/geerlingguy/ansible-collection-mac
- https://github.com/kinglouie/ansible-role-macos
- https://github.com/fgimian/macbuild-ansible
- https://github.com/elnappo/dotfiles/
- https://github.com/adamchainz/mac-ansible
- https://github.com/TalkingQuickly/ansible-osx-setup
- https://github.com/jcf/ansible-dotfiles
- https://github.com/frdmn/dotfiles
