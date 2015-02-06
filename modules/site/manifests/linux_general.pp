class site::linux_general (
  $firewall_class = '',
) {

  anchor {'linux_general::begin':} ->

  class { 'site::linux_user_root': } ->
  class { 'ntp': } ->
  class { 'site::linux_tools': } ->
  class { 'site::linux_proxy': } ->
  class { 'site::linux_mail': } ->
  class { 'site::linux_upgrade': } ->
  class { 'site::linux_hardening_commands': } ->
  class { 'site::linux_grub': } ->

  anchor {'linux_general::end':}

  if $firewall_class and $firewall_class != '' {
    class { $firewall_class: } <- Anchor['linux_general::begin']
  }

}
