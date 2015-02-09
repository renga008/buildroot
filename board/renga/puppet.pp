exec {	'apt-update':
    command => '/usr/bin/apt-get update'
}

exec { 'vim-editor':
    command => '/usr/bin/update-alternatives --set editor /usr/bin/vim.tiny'
}

package { 'aptitude':
    ensure => installed
}

package { 'build-essential':
    ensure => installed
}

package { 'xemacs21':
    ensure => installed
}

package { 'git':
    ensure => installed
}

package { 'kpartx':
    ensure => installed
}

package { 'bridge-utils':
    ensure => installed
}

package { 'uml-utilities':
    ensure => installed
}

package { 'qemu':
    ensure => installed
}

package { 'texinfo':
    ensure => installed
}

package { 'openssh-server':
    ensure => installed
}

package { 'libncurses-dev':
    ensure => installed
}

package { 'mercurial':
    ensure => installed
}

package { 'bison':
    ensure => installed
}

package { 'flex':
    ensure => installed
}

group { 'renga':
    name	=> 'renga',
    ensure	=> 'present',
    gid		=> 1100
}

user { 'renga':
    name	=> 'renga',
    ensure	=> 'present',
    uid		=> 1100,
    gid		=> 1100,
    home	=> '/home/renga',
    require	=> Group['renga']
}

file { 'renga':
    path	=> '/etc/sudoers.d/renga',
    ensure	=> present,
    mode	=> 0600,
    content	=> "renga ALL=(ALL:ALL) NOPASSWD: ALL\n"
}

file { 'host':
    path	=> '/etc/hostname',
    ensure	=> 'present',
    mode	=> 0644,
    content	=> "${hostname}\n"
}
