class profile::users {
  $String $root_password,
) {
  users::user { 'root':
    ensure      => present,
    password    => $root_password,
  }
}

