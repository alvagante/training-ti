class site::linux_general {

#  include resolver
  include ntp
#  include openssh
  include site::linux_tools

  include site::linux_mail
  include site::linux_upgrade

}
