class site::linux_user_root (
  $password         = '*',
  $password_max_age = '90',
  $password_min_age = '0',
) {

  user { 'root':
    ensure           => 'present',
    comment          => 'root',
    gid              => '0',
    home             => '/root',
    password         => $password,
    password_max_age => $password_max_age,
    password_min_age => $password_min_age,
    shell            => '/bin/bash',
    uid              => '0',
  }


}
