alias npmrc='less ~/.npmrc'
alias editHistory="(cd ~ && code .zsh_history && sed -i '' -e '$ d' .zsh_history)"

hashBearer () {
  echo -n 'Bearer '$1 | md5
}

hy() {
  if [ "$1" == "-h" ] ; then
    echo "hy then some words"
    echo "    copies then-some-words to the clipboard"
    echo "    and prints then-some-words to the screen"
  else
    (echo "$@" | awk '{gsub(/ /, "-"); print tolower}') | pbcopy
    echo `pbpaste`
  fi
}

murder() {
  pgrep -f $1 | xargs kill -9
}

tolower() {
  type $1 &>/dev/null && $@ | tr 'A-Z' 'a-z' | pbcopy || echo "$@" | tr 'A-Z' 'a-z' | pbcopy
  pbpaste
}

space() {
  if [ "$1" == "-h" ] ; then
    echo "space word"
    echo "    copies w o r d to the clipboard"
  else
    (echo $1 | sed 's/./& /g' | pbcopy)
  fi
}
