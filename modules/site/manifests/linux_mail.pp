class site::linux_mail {

  if $::operatingsystem == 'Debian' {
    tp::install { 'exim':
      settings_hash => hiera_hash('exim::tp_settings_hash' , {} ),
    }
    tp::conf { 'exim':
      template     => hiera('exim::tp_template', undef),
      options_hash => hiera_hash('exim::tp_options_hash'),
    }
  } else {
    tp::install { 'postfix':
      settings_hash => hiera_hash('postfix::tp_settings_hash' , {} ),
    }
    tp::conf { 'postfix':
      template     => hiera('postfix::tp_template', undef),
      options_hash => hiera_hash('postfix::tp_options_hash'),
    }
  }
}
