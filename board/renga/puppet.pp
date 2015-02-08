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

group { 'rpi':
    name	=> 'rpi',
    ensure	=> 'present',
    gid		=> 1100
}

user { 'rpi':
    name	=> 'rpi',
    ensure	=> 'present',
    uid		=> 1100,
    gid		=> 1100,
    home	=> '/home/rpi',
    require	=> Group['rpi']
}

file { 'rpi':
    path	=> '/etc/sudoers.d/rpi',
    ensure	=> present,
    mode	=> 0600,
    content	=> "rpi ALL=(ALL:ALL) NOPASSWD: ALL\n"
}

file { 'host':
    path	=> '/etc/hostname',
    ensure	=> 'present',
    mode	=> 0644,
    content	=> "${hostname}\n"
}
