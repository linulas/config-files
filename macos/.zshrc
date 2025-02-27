# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

. ~/.zsh_aliases

export PATH=/opt/homebrew/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Applications/iTerm.app/Contents/Resources/utilities

export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

export NVM_DIR="$HOME/.nvm"
. $(brew --prefix nvm)/nvm.sh

# Android development
# export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export NDK_HOME=$ANDROID_HOME/ndk/25.2.9519653
# export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
# export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
# export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# Loads .nvmrc files
autoload -U add-zsh-hook

load-nvmrc() {

  if [[ -f .nvmrc && -r .nvmrc ]]; then

    nvm use --silent

  elif [[ $(nvm version) != $(nvm version default)  ]]; then

    echo "Reverting to nvm default version"

    nvm use default

  fi

}

add-zsh-hook chpwd load-nvmrc

load-nvmrc
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

