class site::linux_proxy {

  $host=$::site::proxy_host
  $port=$::site::proxy_port
  $user=$::site::proxy_username
  $password=$::site::proxy_password

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
