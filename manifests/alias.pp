define postfix::alias($file = undef, $key = undef, $value = undef)
{
  if $file != undef and $key != undef and $value != undef
  {
    ensure_resource('exec', "postalias ${file}")
    file_line { "${file}:${key}":
        ensure => present,
        path   => $file,
        line   => "${key}:  ${value}\n",
        match  => '^$key:',
        notify => Exec["postalias ${file}"]
    }

  }
}
