# setuo mac

## 事前準備

```bash
# Xcode CLI インストール
xcode-select --install

# Homebrewインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew -v

# Ansible インストール後ターミナルを再起動するとコマンドを認識する
brew install ansible
```
