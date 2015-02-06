class site::role::puppetmaster (
  $firewall_template = 'site/default/linux_firewall/50_puppetmaster.erb',
  $firewall_source   = '0.0.0.0/0',
) {
  concat::fragment { 'iptables_puppetmaster':
    ensure  => $::site::linux_firewall::ensure,
    target  => $::site::linux_firewall::iptables_file,
    order   => '50',
    content => template($firewall_template),
    notify  => Service[$::site::linux_firewall::iptables_service],
  }
}
