class site::linux_general (
  $firewall_class = '',
) {

#  include resolver
  include ntp
#  include openssh
  include site::linux_tools
  include site::linux_proxy

  include site::linux_mail
  include site::linux_upgrade
  include site::linux_grub
  include site::linux_user_root
  include site::linux_hardening_commands

  if $firewall_class and $firewall_class != '' {
    include $firewall_class
  }
}
