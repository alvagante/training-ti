Package {
  allow_virtual => false,
}

filebucket { 'main':
  server => 'ec2-54-154-11-29.eu-west-1.compute.amazonaws.com',
  path   => false,
}

if $::virtual != 'virtualbox' {
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

