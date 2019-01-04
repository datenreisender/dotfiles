# Setup new Mac
- Start Mac in recovery mode (⌘-R), delete the root partition, create a new one that is case-sensitive (and of course encrypted), reinstall macOS. 
- Finish fixed macOS setup (do not restore from somewhere, login with Apple-ID)
- Install Homebrew according to https://brew.sh
- `brew cask install 1password`  

- Maybe: Already clone the dotfiles repo now and install everything from the Brewfile with `brew bundle --global`?

- Make fish default-shell: `chsh -s /usr/local/bin/fish`

- ```
gem install git-smart
OUTDATED: brew services start postgresql
```

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
mkdir -p "$HOME/p/vaamo"
OUTDATED: cd "$HOME/p/vaamo"
for repo in …; do git clone git@github.com:Vaamo/$repo.git; done
git clone …
git clone …
cd vaamo-utils/httpie-vaamo-hmac/
pip3 install .
```
OUTDATED: - In /usr/local/var/postgres/postgresql.conf die max_connections auf 400 hochstehen.
- Nach der Installation von xCode (durch .Brewfile):
       sudo xcode-select --switch /Applications/Xcode.app
- Empty Dock, keep only Downloads:
```
dockutil --remove all
dockutil --add '~/Downloads' --display stack
```

- App-Settings:
	- OUTDATED: Slack
	- Alfred 
    	- Licence
    	- Preferences→Advanced→Set preference folder… to iCloud folder
    	- Set Hotkey setzen
    	- Activate Clipboard-History 
    	- Activate 1Password
	- Mail (Disable sound for new mails, Darstellung -> Gelöschte Emails bewegen nach -> Archiv)
	- OUTDATED: GPG Keychain: Export Keychain on old and import  ex- und auf dem neuen Rechner importieren
	- OUTDATED: Dropbox
	- OUTDATED: Owncloud
	- OUTDATED: IntelliJ IDEA (Licence, https://confluence.jetbrains.com/display/IDEADEV/Filesystem+Case-Sensitivity+Mismatch befolgen, Scala-Plugin installieren, Projekte importieren) 
	- Dash (Licence, Setup sync with iCloud/Shared Preferences)
	- OUTDATED: Tripmode (Licence)
	- Google Chrome 
		* Activate Sync
		* Remove unused symbols from the bar
	- Bartender (Licence, place icon right of Spotlight, Settings)
	- gfxcardstatus
	- istat-menus (Ex-/Import settings from iCloud/Shared Preferences)
	- iTerm (Use „Load preferences from a custom folder“ with iCloud/Shared Preferences)
	- Spectacle (See in iCloud/Shared preferences)
- Settings (unfinished)
	- OUTDATED: ccmenu
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

- Add missing
- Remove outdated (here and from brewfile)

# Still missing
- mas:
    - Wunderlist 410628904
    - Microsoft Remote Desktop 10 1295203466
    - Ka-Block! 1335413823 
- cask 
    - expressvpn
    - cyberghost
    - franz
- Pulse
# To be removed
- Slack
- Tripmode
- GPG Keychain
- Dropbox
- Owncloud/nextcloud
- intellij
- ccmenu
- docker
# Unclear
Use VS-Code-Settings
Downgrade to Dash 3?
Downgrade to iStat menus 5?



