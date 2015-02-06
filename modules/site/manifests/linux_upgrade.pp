class site::linux_upgrade (
  $upgrade_flag = false,
) {
  validate_bool($upgrade_flag)

  if $upgrade_flag == true {
    $upgrade_cron_command = $::osfamily ? {
      'RedHat' => 'yum update -y',
      'Debian' => 'apt-get update ; apt-get upgrade -y',
    }
    cron { 'upgrade':
      user     => 'root',
      minute   => '0',
      hour     => '2',
      monthday => '1,15',
      command  => $upgrade_cron_command,
    }
  }

}
