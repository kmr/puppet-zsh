# Public: Install zsh into Homebrew, add to /etc/shells and change the user's
# shell to it.
#
# Examples
#
#   include zsh
class zsh {
  require boxen::config

  package { 'zsh': }

  zsh_path = $osfamily ? {
    'Darwin' => "${boxen::config::homebrewdir}/bin/zsh",
    default  => "/usr/bin/zsh",
  }

  file_line { 'add zsh to /etc/shells':
    path    => '/etc/shells',
    line    => "${zsh_path}",
    require => Package['zsh'],
  }
}
