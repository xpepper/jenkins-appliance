node default {
  include apt
  include stdlib
  include jenkins

  jenkins::plugin {
    'analysis-core' : ;
    'chucknorris' : ;
    'favorite' : ;
    'git' : ;
    'github' : ;
    'gravatar' : ;
    'greenballs' : ;
    'htmlpublisher' : ;
    'jabber' : ;
    'mailer' : ;
    'monitoring' : ;
    'radiatorviewplugin' : ;
    'rake' : ;
    'ruby' : ;
    'rvm' : ;
    'sounds' : ;
    'ssh' : ;
    'vsphere-cloud' : ;
    'warnings' : ;
    'xfpanel' : ;
  }
}
