class site::linux_proxy (
  $profile_proxy_template = 'site/default/linux_proxy/proxy.sh.erb',
) {

  $host=$::site::proxy_host
  $port=$::site::proxy_port
  $user=$::site::proxy_username
  $password=$::site::proxy_password

  if $user != '' and $password != '' {
    $userpass = "${user}:${password}@"
  } else {
    $userpass = ''
  }

  file { '/etc/profile.d/proxy.sh':
    ensure  => present,
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    content => template($profile_proxy_template),
  }

}
