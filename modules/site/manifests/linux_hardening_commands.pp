class site::linux_hardening_commands {

  # UB1404-026 - Impostare lo sticky-bit nelle directory world-writable (Richiesto)
  exec { 'UB1404-026':
    command => 'find / ! -path "/proc/*" -type d \( -perm -0002 -a ! -perm -1000 \) -ls -exec chmod +t {} \; && touch /var/lock/puppet_UB1404-026',
    creates => '/var/lock/puppet_UB1404-026',
  }
}
