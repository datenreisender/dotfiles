# Enable VS code terminal shell integration manually: https://code.visualstudio.com/docs/terminal/shell-integration#_manual-installation
string match -q "$TERM_PROGRAM" vscode
and . (code --locate-shell-integration-path fish)
