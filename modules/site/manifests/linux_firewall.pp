class site::linux_firewall (
  $enable          = true,
  $header_template = 'site/default/firewall/01_header.erb',
  $footer_template = 'site/default/firewall/99_footer.erb',
  $safe_ssh        = true,
) {

  validate_bool($enable)

  $iptables_file = $::osfamily ? {
    'RedHat' => '/etc/sysconfig/iptables',
    'Debian' => '/etc/iptables/rules.v4',
  }

  $iptables_package = 'iptables'

  $iptables_service = $::osfamily ? {
    'RedHat' => 'iptables',
    'Debian' => 'iptables-persistent',
  }

  $ensure = $enable ? {
    true  => 'present',
    false => 'absent',
  }
  $service_ensure = $enable ? {
    true  => 'running',
    false => 'stopped',
  }

  package { $iptables_package:
    ensure => $ensure,
  }
  service { $iptables_service:
    ensure => $service_ensure,
    enable => $enable,
  }
  concat { $iptables_file:
    ensure  => $ensure,
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
    notify  => Service[$iptables_service],
    force   => true,
  }

  concat::fragment { 'iptables_header':
    ensure  => $ensure,
    target  => $iptables_file,
    order   => '01',
    content => template($header_template),
    notify  => Service[$iptables_service],
  }

  concat::fragment { 'iptables_footer':
    ensure  => $ensure,
    target  => $iptables_file,
    order   => '99',
    content => template($footer_template),
    notify  => Service[$iptables_service],
  }

}
