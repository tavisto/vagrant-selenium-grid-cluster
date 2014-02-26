node default {

  package { 'java-1.7.0-openjdk':
    ensure => installed;
  }
  class { 'selenium::hub': }
}
