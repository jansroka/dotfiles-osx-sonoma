# OSX Big Sur Recovery Guide

This is my personal little guide on how to recover to a working OSX environment after a disaster.

I am sharing it on GitHub in the hopes that it might be as useful to others as it is to me.

Note: Lots of empty space in here. This is a work in progress.

## Table of Contents
- [After first boot](#after-first-boot)
- [Installing & running ```dotfiles```](#installing--running-dotfiles)
- [Configure Applications installed via ```brew cask```](#configure-applications-installed-via-brew-cask)
- [Configure Applications installed via ```mas```](#configure-applications-installed-via-mas)
- [Recover data from Arq backups](#recover-data-from-arq-backups)
- [Finishing touches](#finishing-touches)

## After first boot
Ideally you read up on current best practice for this _before_ you start.

### Connect to WiFi

### Create user

### Enable FileVault

### Enable Firewall

### Configure Spotlight
Disable spotlight on:
- Bookmarks & History
- Fonts
- Siri Suggestions

### Set a firmware password

Then reboot, login and let's continue with the next step.

## Installing & running ```dotfiles```

### Create some required folders
```
mkdir ~/Code;
mkdir ~/Code/Private;
```

### Follow dotfiles procedure
[My dotfiles repo](https://github.com/jansroka/dotfiles/) contains a guide to what to do next.

Ideally you can simply run this one-line from Terminal.app:
```
cd; curl -L https://raw.github.com/jansroka/dotfiles/master/bin/setup.sh | bash
```

This will run some time, easily 30 minutes.

## Configure Applications installed via ```brew cask```

Go through ```/Applications``` and one by one (re-)set up your config.

### 1Password
- Sign-in

### ARQ

### Firefox
2 Options: Either wait and restore from Arq backup or do it yourself.

DIY:
- Setup different profiles
- Install Extensions
	- 1Password
		- Log in to 1Password
	- Auto Tab Discard
	- Expire History By Days
		- Set to 30
	- HTTPS Everywhere
	- Reddit Enhancement Suite
	- uBlock Origin
		- Enable all blocklists

### Hazel
- Add license
- Ensure our synced rules files work

### iTerm

### Little Snitch
- Add license
- Make sure it runs on startup

This will very likely require a reboot.

### Maccy
- Ensure start at login
- Paste without formatting

### Microsoft Office
- Start Outlook and add email accounts
- Start all office apps once so that caches can be build

### Microsoft OneDrive
- Ensure we are syncing everything down, but not our ARQ backups

### OmniFocus
- Add License
- Login to OmniSync

### SourceTree
- Add repos from GitHub

### Spotify
- Login & start listening to some tune while you work

### Sublime Text
- Check if the ansible role did work correctly

### Thunderbird
- Add mail accounts

### Timing
- Add License
- Make sure it runs on startup

## Configure Applications installed via ```mas```

### Day One
- Login & sync

### Outline
- Login to OneDrive Business
- Add OneNote Notebooks from OneDrive

### Paprika
- Login & sync

## Recover data from Arq backups

- Check current Arq restore guides on arqbackup.com

### Adopt backup set
This used to work in the past:
- Add the destination, enter credentials to make Arq reconnect with data.
- Under "Restore Files", expand the destination, and select the name of the old computer. On your right, hit "Adopt This Backup Set" button and enter the encryption password that you set during the initial backup.

### Configure VirtualBox
- Recover Windows 10 VM

## Finishing touches

Voila! By now you should have a very usable system which is very close to what you had before.

### Run maintenance playbook
There's a good chance your mac would not mind its first spring cleaning. Therefore, check out the ```maintenance.yml```playbook and decide if you want to run it.

### Add any issues and ideas on GitHub
Latest now would be a great time to add anything that popped up to the issue tracker.
