class site::linux_grub (
  $superuser = 'admin',
  $password  = 'grub.pbkdf2.sha512.10000.1EC998CEC991FB9ACDC0612C4A1EC4FCD643D7F361516ED687EE31009AB820D1FE51E3121333B97E646922A21367FFDFCAAA5F02A1FCEFEF5097263336582783.6EA45C596DE91ECBA4FF3D84EB1F64F73C1FCD93F6A814BA8C671F32D452ACC5D0A04649F171F9CE28E85C4691469EC5DBA3750B11C15C1D09CC4DEDA1DEE7D2',
) {

  if $grub_exists == 'true' {
    file { '/etc/grub.d/01_user':
      ensure  => present,
      mode    => '0755',
      content => inline_template("set superusers=<%= @superuser %>\npassword_pbkdf2 <%= @superuser %> <%= @password %>\n"),
      notify  => Exec['upgrade-grub'],
    }

    exec { 'upgrade-grub':
      refreshonly = true,
    }
  }
}
