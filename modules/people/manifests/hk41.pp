class people::hk41 {

  #include chrome # Puppetfile で定義したもの
  #include tmux

  # homebrew でインストールするもの
  package {
    [
      'reattach-to-user-namespace',
      'ctags',
      #'tmux',
    ]:
  }

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/dotfiles"

  file { $home:
    ensure  => directory
  }

  # git clone git@github.com:hk41/dotfiles.git
  repository { $dotfiles:
    source  => 'hk41/dotfiles',
    require => File[$home]
  }

  ## git-cloneしたら install.sh を走らせる
  #exec { "sh ${dotfiles}/setup.sh":
  #  cwd => $dotfiles,
  #  creates => "${home}/.zshrc",
  #  require => Repository[$dotfiles],
  #}

}
