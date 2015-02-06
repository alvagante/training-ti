class site (
  $proxy_host     = '',
  $proxy_port     = '8080',
  $proxy_username = '',
  $proxy_password = '',
) {

  case $::kernel {
    'Linux': { include ::site::linux_general }
    'Windows': { include ::site::windows_general }
  }

  if $::role  {
    include "site::role::${::role}"
     case $::kernel {
       'Linux': { Class['::site::linux_general'] -> Class["::site::role::${::role}"] }
       'Windows': { Class['::site::windows_general'] -> Class["::site::role::${::role}"] }
     }
  }

}
