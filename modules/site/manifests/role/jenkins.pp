class site::role::jenkins (
  $firewall_template = 'site/default/linux_firewall/51_jenkins.erb',
  $firewall_source   = '0.0.0.0/0',
) {
  include ::jenkins

  concat::fragment { 'iptables_jenkins':
    ensure  => $::site::linux_firewall::ensure,
    target  => $::site::linux_firewall::iptables_file,
    order   => '51',
    content => template($firewall_template),
    notify  => Service[$::site::linux_firewall::iptables_service],
  }

}
