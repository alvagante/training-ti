class site::role::webserver_blog {
  include apache
  apache::vhost { 'blog.example.com':
  }
}
