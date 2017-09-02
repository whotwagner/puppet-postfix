define postfix::master(String $service = undef,
  Enum['inet','unix','fifo','pass'] $type = undef,
  Optional[Enum['y','n']] $private = undef,
  Optional[Enum['y','n']] $unpriv = undef,
  Optional[Enum['y','n']] $chroot = undef,
  Optional[Integer] $wakeup = undef,
  Optional[Integer] $maxproc = undef,
  String $command = undef,
  String $flags = undef
) {
  ensure_resource('concat', "${postfix::config_directory}/master2.cf", { owner => root, group => root, mode => '0644',notify => Service['postfix'] })

  concat::fragment { "postfix:map:master.cf:${service}":
    target  => "${postfix::config_directory}/master.cf",
    content => "${service}\t${type}\t<%= private ? private : '-' -%>\t<%= unpriv ? unpriv : '-' -%>\t<%= chroot ? chroot : '-' -%>\t<%= wakeup ? wakeup : '-' -%>\t<%= maxproc ? maxproc : '-' -%>\t${command}\n<%= \"   ${flags}\n\" if flags -%>"
    }
  }
}
