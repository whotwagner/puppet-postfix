define postfix::list($file = undef, $value = undef)
{
	if $file != undef and $value != undef
	{
		ensure_resource('concat', "$postfix::config_directory/$file", { owner => root, group => root, mode => '0644', notify => Service['postfix'] })

        	concat::fragment { "postfix:list:$file:$value":
              		target => "$postfix::config_directory/$file",
              		content => "$value\n",
         	}
	}
}
