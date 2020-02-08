# dotfiles

My bash, git, and editor dotfiles.


## Prerequisites
- `git-completion.bash` and `git-prompt.sh` from https://github.com/git/git/tree/master/contrib/completion
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/)


## Switching to a new machine

- Install applications via [`komputer-maschine`](https://github.com/heldinz/komputer-maschine)
- Update bash, git, and Hyper files: `cp .bash* .git* .hyper.js ~/`
- Update .ssh config: `cp .ssh/config ~/.ssh/`
- Install VS Code extensions with `cat code_extensions.txt | xargs -n 1 code --install-extension`
- Update VS Code settings with `cp settings.json ~/Library/Application\ Support/Code/User/`
- Install Node and npm from https://nodejs.org/
- Install npm-merge-driver with `npx npm-merge-driver install --global`
- Install Magnet via the App Store
- In Safari, go to Preferences → Advanced → Press Tab to highlight each item on a webpage and check the option.


## Keeping VS Code files up-to-date

From the project root:
- Extensions: `code --list-extensions > code_extensions.txt`
- Settings: `cp ~/Library/Application\ Support/Code/User/settings.json .`
