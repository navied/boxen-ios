class people::sfx {

  $home = "/Users/${::boxen_user}"
  $my = "${home}"
  $vimrc = "${my}/.vim"

  file { $code:
    ensure => directory,
    require => File[$home],
  }

  file { $vimrc:
    ensure => directory,
    require => File[$home]
  }

  repository { $vimrc:
    source => 'nkts/vimrc',
    require => File[$vimrc]
  }

}