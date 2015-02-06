## site.pp ##

# Resource defaults. TODO: Manage Windows case
Package {
  allow_virtual => false,
}

Exec {
  path => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin',
}

#File {
#  owner => 'root',
#  group => 'root',
#  mode  => '0644',
#}

## Active Configurations ##

# PRIMARY FILEBUCKET
# This configures puppet agent and puppet inspect to back up file contents when
# they run. The Puppet Enterprise console needs this to display file contents
# and differences.

# Define filebucket 'main':
filebucket { 'main':
  server => 'ec2-54-154-11-29.eu-west-1.compute.amazonaws.com',
  path   => false,
}

if $::virtual != "virtualbox" {
  $env = 'prod'
  File { backup => 'main' }
} else {
  $env = 'devel'
}

case $::clientcert {
  /^amazon/: {
    $role = 'webserver_www'
  }
  /^web/: {
    $role = 'webserver_www'
  }
  /^tomcat/: {
    $role = 'tomcat_www'
  }
  /^lb/: {
    $role = 'lb_www'
  }
  /^db/: {
    $role = 'db'
  }
  default: {

  }
}

include site

