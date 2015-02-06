class site::role::webserver_rproxy (
  $firewall_template = 'site/default/linux_firewall/51_webserver.erb',
  $firewall_source   = '0.0.0.0/0',
  $apacherproxy_template = 'site/webserver_rproxy/apache/rproxy-conf.erb',
  $directory_app,
  $url_app,

) {
  include ::apache
  ::apache::dotconf { 'rproxy':
    content => template($apacherproxy_template),
  }
  ::apache::module { 'proxy': }
  ::apache::module { 'proxy_http': }
  ::apache::module { 'proxy_html':
    ensure => absent,
  }

  concat::fragment { 'iptables_webserver_rproxy':
    ensure  => $::site::linux_firewall::ensure,
    target  => $::site::linux_firewall::iptables_file,
    order   => '51',
    content => template($firewall_template),
    notify  => Service[$::site::linux_firewall::iptables_service],
  }

}
