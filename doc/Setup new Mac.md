# Setup new Mac
- Start Mac in recovery mode (⌘-R), delete the root partition, create a new one that is case-sensitive (and of course encrypted), reinstall macOS.
- Finish fixed macOS setup (do not restore from somewhere, login with Apple-ID)
- Install Homebrew according to https://brew.sh
- `brew cask install 1password`

- Maybe: Already clone the dotfiles repo now and install everything from the Brewfile with `brew bundle --global`?

- Make fish default-shell: `chsh -s /usr/local/bin/fish`
- `gem install git-smart`
- System preferences:
    - Sharing: Set computer name
    - Internet accounts:
        - iCloud: Activate “Back to My Mac”
        - Activate:
            - Exchange: Calendar
            - Google: All
            - Twitter
- Update everything in the App store: `sudo softwareupdate --install --all`
- Copy over ~/.ssh from old computer via Airdrop
- Checkout my projects:
```sh
mkdir -p "$HOME/p"
```
- Nach der Installation von xCode (durch .Brewfile):
       sudo xcode-select --switch /Applications/Xcode.app
- Empty Dock, keep only Downloads:
```
dockutil --remove all
dockutil --add '~/Downloads' --display stack
```

- App-Settings:
	- Alfred
    	- Licence
    	- Preferences→Advanced→Set preference folder… to iCloud folder
    	- Set Hotkey setzen
    	- Activate Clipboard-History
    	- Activate 1Password
	- Mail (Disable sound for new mails, Darstellung -> Gelöschte Emails bewegen nach -> Archiv)
	- Dash (Licence, Setup sync with iCloud/Shared Preferences)
	- Google Chrome
		* Activate Sync
		* Remove unused symbols from the bar
	- Bartender (Licence, place icon right of Spotlight, Settings)
	- gfxcardstatus
	- istat-menus (Ex-/Import settings from iCloud/Shared Preferences)
	- iTerm (Use „Load preferences from a custom folder“ with iCloud/Shared Preferences)
	- Spectacle (See in iCloud/Shared preferences)
- Settings (unfinished)
	- Code
		- Install extensions (Editorconfig)
		- Settings
	- System preferences
  - 1password (Licence)
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
		- mpv/Quit mpv & remember position: cmd-q
		- Nachrichten/Nachrichten: alt-cmd-1
		- Mail/Hauptfenster: alt-cmd-1
		- Kalender/Kalender: alt-cmd-1

- Install Pulse Secure
# Unclear
Use VS-Code-Settings
