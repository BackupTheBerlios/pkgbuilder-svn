if ! grep zsh etc/shells 1> /dev/null 2> /dev/null; then
  echo "/bin/zsh" >> etc/shells
fi
