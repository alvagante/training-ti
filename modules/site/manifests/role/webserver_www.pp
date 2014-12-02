class site::role::webserver_www {
  include apache
  apache::vhost { 'www.example.com':
    template => 'site/apache/webserver_www/www.example.com.conf.erb',
  }
}
