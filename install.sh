#!/bin/sh

komputer_echo() {
  local fmt="$1"; shift

  printf "\n$fmt\n" "$@"
}

# Install Oh My Zsh
CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  komputer_echo "Oh My Zsh already installed. Skipping..."
fi
unset CHECK_ZSH_INSTALLED

# Install fonts
fonts=(
	MesloLGS%20NF%20Regular.ttf
	MesloLGS%20NF%20Bold.ttf
	MesloLGS%20NF%20Italic.ttf
	MesloLGS%20NF%20Bold%20Italic.ttf
)

komputer_echo "Installing fonts..."

install_fonts() {
	cd ~/Library/Fonts
	for font in "${fonts[@]}"
		do  curl -O 'https://github.com/romkatv/powerlevel10k-media/raw/master/$font'
	done
	cd -
}

# Install formulae
formulae=(
  zsh-syntax-highlighting
	zsh-autosuggestions
	romkatv/powerlevel10k/powerlevel10k
)

komputer_echo "Installing formulae..."

install_formula() {
  if brew ls --versions $formula > /dev/null; then
    komputer_echo "$formula already installed. Skipping..."
  else
		komputer_echo "Installing $formula..."
    brew install $formula
  fi
}

for formula in "${formulae[@]}"
  do install_formula $formula
done

# Copy config files
cp -r .zsh* ~/
cp .gitconfig .gitignore_global .git-completion.bash .hyper.js .p10k.zsh ~/
cp -r .config/colorls ~/.config/
cp .ssh/config ~/.ssh/
cat code_extensions.txt | xargs -n 1 code --install-extension
cp settings.json ~/Library/Application\ Support/Code/User/
