class site::proxy (
  $host     = '',
  $port     = '8080',
  $user     = '',
  $password = '',
) {

  if $user != '' and $password != '' {
    $userpass = "${user}:${password}@"
  } else {
    $userpass = ''
  }

  case $::kernel {
    # Linux Proxy Setup
    'Linux': {
      file { '/etc/profile.d/proxy.sh':
        ensure  => present,
        mode    => '0755',
        owner   => 'root',
        group   => 'root',
        content => template('site/proxy/proxy.sh.erb'),
       }
     }
     # Windows Proxy Setup
     'Windows': {
     }
     default: {}
  }

}
