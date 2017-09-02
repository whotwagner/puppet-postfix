class postfix(
  $tplmaincf = $::postfix::params::tplmaincf,
  $tplmastercf = $::postfix::params::tplmastercf,
  $myhostname = $::postfix::params::myhostname,
  $mynetworks = $::postfix::params::mynetworks,
  Optional[Variant[String,Array]] $mydestination = $::postfix::params::mydestination,
  $sender_canonical_maps = $::postfix::params::sender_canonical_maps,
  $relay_domains = $::postfix::params::relay_domains,
  $virtual_alias_maps = $::postfix::params::virtual_alias_maps,
  $recipient_bcc_maps = $::postfix::params::recipient_bcc_maps,
  $sender_bcc_maps = $::postfix::params::sender_bcc_maps,
  $config_directory = $::postfix::params::config_directory,
  Optional[Integer] $message_size_limit = $::postfix::params::message_size_limit,
  $delay_warning_time = $::postfix::params::delay_warning_time,
  $bounce_queue_lifetime = $::postfix::params::bounce_queue_lifetime,
  $maximal_queue_lifetime = $::postfix::params::maximal_queue_lifetime,
  Optional[Array] $smtpd_client_restrictions = $::postfix::params::smtpd_client_restrictions,
  Optional[Array] $smtpd_helo_restrictions = $::postfix::params::smtpd_helo_restrictions,
  Optional[Array] $smtpd_sender_restrictions = $::postfix::params::smtpd_sender_restrictions,
  Optional[Array] $smtpd_data_restrictions = $::postfix::params::smtpd_data_restrictions,
  Optional[Array] $smtpd_recipient_restrictions = $::postfix::params::smtpd_recipient_restrictions,
  $transport_maps = $::postfix::params::transport_maps,
  $alias_maps = $::postfix::params::alias_maps,
  $alias_database = $::postfix::params::alias_database,
  Optional[Variant[String,Array]] $inet_interfaces = $::postfix::params::inet_interfaces,
  $readme_directory = $::postfix::params::readme_directory,
  $smtpd_tls_key_file = $::postfix::params::smtpd_tls_key_file,
  $smtpd_cafile = $::postfix::params::smtpd_cafile,
  $smtpd_tls_cert_file = $::postfix::params::smtpd_tls_cert_file,
  Optional[Enum['yes','no']] $smtpd_use_tls = $::postfix::params::smtpd_use_tls,
  Optional[Enum['none','may','encrypt']] $smtpd_tls_security_level = $::postfix::params::smtpd_tls_security_level,
  Optional[Enum['yes','no']] $smtpd_tls_auth_only = $::postfix::params::smtpd_tls_auth_only,
  $smtpd_tls_session_cache_database = $::postfix::params::smtpd_tls_session_cache_database,
  $smtpd_tls_mandatory_protocols = $::postfix::params::smtpd_tls_mandatory_protocols,
  $smtpd_tls_mandatory_ciphers = $::postfix::params::smtpd_tls_mandatory_ciphers,
  $smtpd_tls_protocols = $::postfix::params::smtpd_tls_protocols,
  $tls_medium_cipherlist = $::postfix::params::tls_medium_cipherlist,
  $smtp_tls_cert_file = $::postfix::params::smtp_tls_cert_file,
  $smtp_tls_key_file = $::postfix::params::smtp_tls_key_file,
  Optional[Enum['none','may','encrypt','fingerprint','verify','secure']] $smtp_tls_security_level = $::postfix::params::smtp_tls_security_level,
  $smtp_tls_session_cache_database = $::postfix::params::smtp_tls_session_cache_database,
  $tls_high_cipherlist = $::postfix::params::tls_high_cipherlist,
  Optional[Integer] $smtpd_tls_loglevel = $::postfix::params::smtpd_tls_loglevel,
  Optional[Integer] $smtp_tls_loglevel = $::postfix::params::smtp_tls_loglevel,
  $smtpd_delay_reject = $::postfix::params::smtpd_delay_reject,
  $smtpd_tls_eecdh_grade = $::postfix::params::smtpd_tls_eecdh_grade,
  Boolean $postscreen = $::postfix::params::postscreen,
  Boolean $amavis = $::postfix::params::amavis,
  Boolean $forcespf = $::postfix::params::forcespf,
  Boolean $rspamd = $::postfix::params::rspamd,
  Enum['yes', 'no'] $biff = $::postfix::params::biff,
  $append_dot_mydomain = $::postfix::params::append_dot_mydomain,
  $myorigin = $::postfix::params::myorigin,
  $mailbox_command = $::postfix::params::mailbox_command,
  Integer $mailbox_size_limit = $::postfix::params::mailbox_size_limit,
  $recipient_delimiter = $::postfix::params::recipient_delimiter,
  $relay_host = $::postfix::params::relay_host,
  Enum['yes','no'] $smtpd_helo_required = $::postfix::params::smtpd_helo_required,
  Enum['yes','no'] $disable_vrfy_command = $::postfix::params::disable_vrfy_command,
  Enum['yes','no'] $address_verify_negative_cache = $::postfix::params::address_verify_negative_cache,
  Optional[Collection] $lists = undef,
  Optional[Collection] $aliases = undef,
  Optional[Collection] $maps = undef
) inherits ::postfix::params {
  if $::osfamily == 'Debian' {
    package { 'postfix':
      ensure => installed
    }

    file { '/etc/mailname':
      ensure  => present,
      force   => true,
      owner   => root,
      group   => root,
      mode    => '0644',
      require => Package['postfix'],
      content => $myhostname,
      notify  => Service['postfix']
    }
  }

  if $postscreen == true {
    ensure_resource('exec', "postmap ${postfix::config_directory}/postscreen_access.cidr")
    file { "${config_directory}/postscreen_access.cidr":
      ensure  => present,
      force   => true,
      owner   => root,
      group   => root,
      mode    => '0644',
      source  => 'puppet:///modules/postfix/postscreen_access.cidr',
      require => Package['postfix'],
      notify  => [ Exec["postmap ${postfix::config_directory}/postscreen_access.cidr"], Service['postfix']]
    }
  }

  if $forcespf == true {
    package{'postfix-policyd-spf-perl': ensure => installed }
  }

  if $lists {
    $lists.each| String $file, Array $maptuple|{
      $maptuple.each| String $entry|{
        ensure_resource('postfix::list',"${file}:${entry}",{file => $file, value => $entry, require => Package['postfix']})
      }
    }
  }

  file { "${config_directory}/main.cf":
    ensure  => present,
    force   => true,
    owner   => root,
    group   => root,
    mode    => '0644',
    require => Package['postfix'],
    content => template($tplmaincf),
    notify  => Service['postfix']
  }

  file { "${config_directory}/master.cf":
    ensure  => present,
    force   => true,
    owner   => root,
    group   => root,
    mode    => '0644',
    require => Package['postfix'],
    content => template($tplmastercf),
    notify  => Service['postfix'],
  }

  if $aliases {
    $aliases.each| String $file, Array $maptuple|{
      $maptuple.map| $entry|{
        $entry.each| String $key, String $value |{
          ensure_resource('postfix::alias',"${file}:${key}:${value}",{ file=> $file, key => $key, value => $value, require => Package['postfix'] })
        }
      }
    }
  }

  if $maps {
    $maps.each| String $file, Array $maptuple|{
      $maptuple.map| $entry|{
        $entry.each| String $key, String $value |{
          ensure_resource('postfix::map',"${file}:${key}:${value}",{ file=> $file, key => $key, value => $value, require => Package['postfix'] })
        }
      }
    }
  }

  service{'postfix':
    ensure  => running,
    enable  => true,
    require => Package['postfix']
  }
}
