class site::linux_repo (
  $yum_conf_template,
  $yum_repos_d_source,
  $yum_repos_d_purge   = false,
{

  case $::osfamily {
    'RedHat': {
      file { '/etc/yum.conf':
        ensure  => present,
        content => template($yum_conf_template),
      }
      file { '/etc/yum.repos.d/':
        ensure  => directory,
        source  => $yum_repos_d_source,
        recurse => true,
        purge   => $yum_repos_d_purge,
      }
    },
    'Debian': {


    }
  }

}
