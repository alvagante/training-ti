class site {

  case $::kernel {
    'Linux': { include ::site::general_linux }
    'Windows': { include ::site::general_windows }
  }

  if $::role  {
    include "site::role::${::role}"
     case $::kernel {
       'Linux': { Class['::site::general_linux'] -> Class["::site::role::${::role}"] }
       'Windows': { Class['::site::general_windows'] -> Class["::site::role::${::role}"] }
     }
  }

}
