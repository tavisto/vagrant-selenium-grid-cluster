node default {

  package { ['java-1.7.0-openjdk', 'firefox']:
    ensure => installed;
  }
  class { 'display':
    width   => 1024,
    height  => 768,
    color   => 8,
  }
  class { 'selenium::node':
    hub     => 'http://192.168.1.10:4444/grid/register',
    options => '-role webdriver -host 192.168.1.11 -browser browserName=firefox,maxInstances=1,platform=LINUX '
  }
}
