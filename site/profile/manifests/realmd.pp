class profiles::realmd {
 class { '::realmd':
  domain               => $::domain,
  domain_join_user     => 'denneydyadmin',
  domain_join_password => '',
  #krb_ticket_join      => true,
  #krb_keytab           => '/tmp/keytab',
  manage_sssd_config   => true,
  sssd_config          => {
    'sssd' => {
      'domains'             => $::domain,
      'config_file_version' => '2',
      'services'            => 'nss,pam',
    },
    "domain/${::domain}" => {
      'ad_domain'                      => $::domain,
      'krb5_realm'                     => upcase($::domain),
      'realmd_tags'                    => 'manages-system joined-with-samba',
      'cache_credentials'              => 'True',
      'id_provider'                    => 'ad',
      'access_provider'                => 'ad',
      'krb5_store_password_if_offline' => 'True',
      'default_shell'                  => '/bin/bash',
      'ldap_id_mapping'                => 'True',
      'fallback_homedir'               => '/home/%u',
    },
  },
 }
}

