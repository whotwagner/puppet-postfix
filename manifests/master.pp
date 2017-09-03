define postfix::master(String $service = undef,
  Enum['inet','unix','fifo','pass'] $servicetype = undef,
  Optional[Enum['y','n','-']] $priv = '-',
  Optional[Enum['y','n','-']] $unpriv = '-',
  Optional[Enum['y','n','-']] $chroot = '-',
  Optional[Pattern[/^[0-9]+\??$/]] $wakeup = undef,
  Optional[Integer] $maxproc = undef,
  String $command = undef,
  Optional[String] $flags = undef,
  Variant[String,Integer] $order = '10'
) {

  if $wakeup {
    $wakeup_var = $wakeup
  }
  else {
    $wakeup_var = '-'
  }

  if $maxproc {
    $maxproc_var = $maxproc
  }
  else {
    $maxproc_var = '-'
  }

  ensure_resource('concat', "${postfix::config_directory}/master2.cf", { owner => root, group => root, mode => '0644',notify => Service['postfix'] })

  concat::fragment { "postfix:map:master.cf:${service}${servicetype}":
    order => $order,
    target  => "${postfix::config_directory}/master2.cf",
    content => "${service}\t${servicetype}\t${priv}\t${unpriv}\t${chroot}\t${wakeup_var}\t${maxproc_var}\t${command}\n   ${flags}\n"  
    }
}
