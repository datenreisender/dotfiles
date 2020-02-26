# Setup new Mac
- Start Mac in recovery mode (⌘-R), delete the root partition, create a new one that is case-sensitive (and of course encrypted), reinstall macOS.
- Finish fixed macOS setup (do not restore from somewhere, login with Apple-ID)
- Install Homebrew according to https://brew.sh
- Clone the dotfiles repo https://github.com/datenreisender/dotfiles and move it into the home folder.
- Install everything from the Brewfile with `brew bundle --global; brew bundle --global`
- Make fish default-shell: `sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'; chsh -s /usr/local/bin/fish`
- Copy `.netrc.template` to `.netrc` and add missing password
- Maybe adjust email address in `.config/git/config`

- `sudo gem install git-smart`
- System preferences:
    - Sharing: Set computer name
    - Internet accounts:
        - Activate:
            - Exchange: Calendar
            - Google: All
- Update everything in the App store: `softwareupdate --install --all`
- Copy over ~/.ssh from old computer via Airdrop
- Checkout my projects:
```sh
mkdir -p "$HOME/p"
cd "$HOME/p"
git clone …
```
- Empty Dock, keep only Downloads:
```
dockutil --remove all
dockutil --add '~/Downloads' --display stack
```

- Install the USGerman Keyboard Layout from https://hci.rwth-aachen.de/usgermankeyboard
- App-Settings:
	- Alfred
    	- Licence
    	- Preferences→Advanced→Set preference folder… to iCloud folder
    	- Set Hotkey
    	- Activate Clipboard-History
    	- Activate 1Password
	- Mail (Disable sound for new mails, Darstellung -> Gelöschte Emails bewegen nach -> Archiv)
	- Dash (Licence, Setup sync with iCloud/Shared Preferences)
	- Google Chrome
		* Activate Sync
		* Remove unused symbols from the bar
	- gfxcardstatus
	- istat-menus (Lizenz, File->Ex-/Import settings from iCloud/Shared Preferences)
	- iTerm (Use „Load preferences from a custom folder“ with iCloud/Shared Preferences, restart iTerm!)
	- Spectacle (See in iCloud/Shared preferences)
	- Bartender (Licence, place icon right of Spotlight, Settings)
- Settings (unfinished)
	- Code
		- Install extensions (Editorconfig)
		- Settings
	- System preferences
	- Safari
	- Textmate (Licence, Plugin: Editorconfig)

- Systemeinstellung Tastatur:
	- Tastatur:
		- Control Strip …
		- Sondertasten … Map Caps-Lock to ESC
	- Text
	- Kurzbefehle: Several settings, esp. App-Tastaturkurzbefehle:
		- Alle
			- Nächsten Tab anzeigen: alt-cmd-→
			- Nächsten Tab auswählen: alt-cmd-→
			- Select Next Tab: alt-cmd-→
			- Vorherigen Tab anzeigen: alt-cmd-←
			- Vorherigen Tab auswählen: alt-cmd-←
			- Select Previous Tab: alt-cmd-←
			- Toggle Full Screen: ctrl-cmd-f
			- Vollbild: ctrl-cmd-f
		- mpv
			- Quit and Remember Position: cmd-q
			- Quit mpv: alt-cmd-q
		- Nachrichten/Nachrichten: alt-cmd-1
		- Mail/Hauptfenster: alt-cmd-1
		- Kalender/Kalender: alt-cmd-1

- Install Pulse Secure
- Copy `~/.private/otr.template` to `~/.private/otr` and add missing data

# Unclear
- Use VS-Code-Settings
- What to do with `.config/fish/fish_variables`
- What to do about `set -xU LSCOLORS Exfxcxdxbxegedabagacad`
- Do I still neet to run something like `fisher add < ~/.config/fish/fishfile`?
