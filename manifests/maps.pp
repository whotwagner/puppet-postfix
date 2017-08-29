define postfix::map($file = undef, $key = undef, $value = undef)
{
	if $file != undef and $key != undef and $value != undef
	{
		ensure_resource('exec', "postmap $postfix::config_directory/$file")
		ensure_resource('concat', "$postfix::config_directory/$file", { owner => root, group => root, mode => '0644',notify => [Exec["postmap $postfix::config_directory/$file"], Service['postfix']] })

        	concat::fragment { "postfix:map:$file:$key:$value":
              		target => "$postfix::config_directory/$file",
              		content => "$key	$value\n",
#			notify => Exec["postmap $postfix::config_directory/$file"]
         	}
	}
}
