class postfix::params {
	$tplmaincf = 'postfix/templates.main.cf.erb'
	$tplmastercf = 'postfix/master.cf.erb'
	$myhostname = 'localhost'
	$mynetworks = '127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128'
	$mydestination = '$myhostname, localhost'
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
	$smtpd_CAfile = undef
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
	$append_dot_mydomain = 'no'
	$myorigin = '/etc/mailname'
	$mailbox_command = 'procmail -a "$EXTENSION"'
	$mailbox_size_limit = 0
	$recipient_delimiter = '+'
	$relay_host = undef
	$smtpd_helo_required = no
	$disable_vrfy_command = no
	$address_verify_negative_cache = yes
}
