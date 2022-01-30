!/bin/zsh

if [[ ! -d ~/.zplug ]];then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

source ~/.zplug/init.zsh

# 非同期処理できるようになる
zplug "mafredri/zsh-async"

# fzfを使った拡張関数
zplug "mollifier/anyframe"

# gitルートにcd
zplug "mollifier/cd-gitroot"

# 移動強化プラグイン
zplug "b4b4r07/enhancd", use:init.sh

# 補完強化
zplug "zsh-users/zsh-completions"

# 長時間実行するコマンドのバックグラウンド通知
zplug 't413/zsh-background-notify'

# 256色表示にする
zplug "chrissicool/zsh-256color"

# 過去に入力したコマンドの履歴が灰色のサジェストで出る
zplug "zsh-users/zsh-autosuggestions"

# コマンド入力途中で上下キー押したときの過去履歴がいい感じに出るようになる
zplug "zsh-users/zsh-history-substring-search"

# 構文のハイライト(https://github.com/zsh-users/zsh-syntax-highlighting)
zplug "zsh-users/zsh-syntax-highlighting"

# テーマ(ここは好みで。調べた感じpureが人気)
zplug "sindresorhus/pure"

# 自身をプラグインとして管理する
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# コマンドライン上の文字リテラルの絵文字を emoji 化する
zplug "mrowa44/emojify", as:command

# インストールされてないプラグインをインストール
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# プラグインを読み込みコマンドを$PATHへ追加
zplug load --verbose
