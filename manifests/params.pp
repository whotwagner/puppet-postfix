class postfix::params {
  $tplmaincf = 'postfix/main.cf.erb'
  $tplmastercf = 'postfix/master.cf.erb'
  $myhostname = 'localhost'
  $mynetworks = ['127.0.0.0/8', '[::ffff:127.0.0.0]/104', '[::1]/128' ]
  $mydestination = ['$myhostname', 'localhost']
  $sender_canonical_maps = undef
  $relay_domains = undef
  $virtual_alias_maps = undef
  $recipient_bcc_maps = undef
  $sender_bcc_maps = undef
  $message_size_limit = undef
  $delay_warning_time = undef
  $bounce_queue_lifetime = undef
  $maximal_queue_lifetime = undef
  $smtpd_client_restrictions = undef
  $smtpd_helo_restrictions = undef
  $smtpd_sender_restrictions = undef
  $smtpd_data_restrictions = undef
  $smtpd_recipient_restrictions = undef
  $transport_maps = undef
  $alias_maps = undef
  $alias_database = undef
  $inet_interfaces = 'all'
  $readme_directory = undef
  $smtpd_tls_cert_file = undef
  $smtpd_tls_key_file = undef
  $smtpd_cafile = undef
  $smtpd_use_tls = undef
  $smtpd_tls_security_level = undef
  $smtpd_tls_auth_only = undef
  $smtpd_tls_session_cache_database = undef
  $smtpd_tls_mandatory_protocols = undef
  $smtpd_tls_mandatory_ciphers = undef
  $smtpd_tls_protocols = undef
  $tls_medium_cipherlist = undef
  $smtp_tls_cert_file = undef
  $smtp_tls_key_file = undef
  $smtp_tls_security_level = undef
  $smtp_tls_session_cache_database = undef
  $tls_high_cipherlist = undef
  $smtpd_tls_loglevel = undef
  $smtp_tls_loglevel = undef
  $smtpd_delay_reject = undef
  $smtpd_tls_eecdh_grade = undef
  $config_directory = '/etc/postfix'
  $postscreen = false
  $amavis = false
  $forcespf = false
  $rspamd = false
  $biff = 'no'
  $content_filter = undef
  $append_dot_mydomain = 'no'
  $myorigin = '/etc/mailname'
  $mailbox_command = 'procmail -a "$EXTENSION"'
  $mailbox_size_limit = 0
  $recipient_delimiter = '+'
  $relay_host = undef
  $smtpd_helo_required = no
  $disable_vrfy_command = no
  $address_verify_negative_cache = yes
  $postscreen_access_list = undef
  $postscreen_greet_banner = undef
  $postscreen_greet_wait = undef
  $postscreen_greet_action = undef
  $postscreen_pipelining_enable = undef
  $postscreen_pipelining_action = undef
  $postscreen_non_smtp_command_enable = undef
  $postscreen_dnsbl_sites = undef
  $postscreen_dnsbl_threshold = undef
  $postscreen_dnsbl_whitelist_threshold = undef
  $postscreen_dnsbl_action = undef
  $milter_mail_macros = undef
  $smtpd_milters = undef
  $milter_protocol = undef
  $milter_default_action = undef
  $defaultmasters = {
    smtpinet => {service => 'smtp', servicetype => 'inet', priv => 'n', command => 'smtpd'},
    pickupunix => {service => 'pickup', servicetype => 'unix',priv => 'n',wakeup => '60', maxproc => 1, command => 'pickup'},
    cleanupunix => {service => 'cleanup', servicetype => 'unix',priv => 'n',maxproc => 0, command => 'cleanup'},
    qmgrunix => {service => 'qmgr', servicetype => 'unix',priv => 'n',chroot => 'n',wakeup => '300',maxproc => 0, command => 'qmgr'},
    tlsmgrunix => {service => 'tlsmgr', servicetype => 'unix',wakeup => '1000?',maxproc => 1, command => 'tlsmgr'},
    rewriteunix => {service => 'rewrite', servicetype => 'unix', command => 'trivial-rewrite'},
    bounceunix => {service => 'bounce', servicetype => 'unix', maxproc => 0, command => 'bounce'},
    deferunix => {service => 'defer', servicetype => 'unix', maxproc => 0, command => 'bounce'},
    traceunix => {service => 'trace', servicetype => 'unix', maxproc => 0, command => 'bounce'},
    verifyunix => {service => 'verify', servicetype => 'unix', maxproc => 1, command => 'verify'},
    flushunix => {service => 'flush', servicetype => 'unix', priv => 'n', wakeup => '1000?',maxproc => 0, command => 'flush'},
    proxymapunix => {service => 'proxymap', servicetype => 'unix', chroot => 'n', command => 'proxymap'},
    proxywriteunix => {service => 'proxywrite', servicetype => 'unix', chroot => 'n', maxproc => 1, command => 'proxymap'},
    smtpunix => {service => 'smtp', servicetype => 'unix', command => 'smtp'},
    relayunix => {service => 'relay', servicetype => 'unix', command => 'smtp'},
    showqunix => {service => 'showq', servicetype => 'unix', priv => 'n', command => 'showq'},
    errorunix => {service => 'error', servicetype => 'unix', command => 'error'},
    retryunix => {service => 'retry', servicetype => 'unix', command => 'error'},
    discardunix => {service => 'discard', servicetype => 'unix', command => 'discard'},
    localunix => {service => 'local', servicetype => 'unix', unpriv => 'n', chroot => 'n', command => 'local'},
    virtualunix => {service => 'virtual', servicetype => 'unix', unpriv => 'n', chroot => 'n', command => 'virtual'},
    lmtpunix => {service => 'lmtp', servicetype => 'unix', command => 'lmtp'},
    anvilunix => {service => 'anvil', servicetype => 'unix', maxproc => 1, command => 'anvil'},
    scacheunix => {service => 'scache', servicetype => 'unix', maxproc => 1, command => 'scache'},
    maildropunix => {service => 'maildrop', servicetype => 'unix', unpriv => 'n', chroot => 'n', command => 'pipe', flags => 'flags=DRHu user=vmail argv=/usr/bin/maildrop -d ${recipient}'},
    uucpunix => {service => 'uucp', servicetype => 'unix', unpriv => 'n', chroot => 'n', command => 'pipe', flags => 'flags=Fqhu user=uucp argv=uux -r -n -z -a$sender - $nexthop!rmail ($recipient)'},
    ifmailunix => {service => 'ifmail', servicetype => 'unix', unpriv => 'n', chroot => 'n', command => 'pipe', flags => 'flags=F user=ftn argv=/usr/lib/ifmail/ifmail -r $nexthop ($recipient)'},
    bsmtpunix => {service => 'bsmtp', servicetype => 'unix', unpriv => 'n', chroot => 'n', command => 'pipe', flags => 'flags=Fq. user=bsmtp argv=/usr/lib/bsmtp/bsmtp -t$nexthop -f$sender $recipient'},
    scalemail-backendunix => {service => 'scalemail-backend', servicetype => 'unix', unpriv => 'n', chroot => 'n', maxproc => 2,  command => 'pipe', flags => 'flags=R user=scalemail argv=/usr/lib/scalemail/bin/scalemail-store ${nexthop} ${user} ${extension}'},
    mailmanunix => {service => 'mailman', servicetype => 'unix', unpriv => 'n', chroot => 'n', command => 'pipe', flags => 'flags=FR user=list argv=/usr/lib/mailman/bin/postfix-to-mailman.py ${nexthop} ${user}'},
  }
}
