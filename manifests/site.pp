node default {
  include apt
  include stdlib
  include git
  include jenkins

  jenkins::plugin {
    'credentials' : ;
    'ssh-credentials' : ;
    'scm-api' : ;
    'parameterized-trigger' : ;
    'git-client' : ;
    'git' : ;
    'chucknorris' : ;
    'github-api' : ;
    'github' : ;
    'gravatar' : ;
    'token-macro' : ;
    'javadoc' : ;
    'jquery' : ;
    'greenballs' : ;
    'delivery-pipeline-plugin' : ;
    'embeddable-build-status' : ;
    'analysis-core' : ;
    'favorite' : ;
    'htmlpublisher' : ;
    'instant-messaging' : ;
    'jabber' : ;
    'mailer' : ;
    'monitoring' : ;
    'radiatorviewplugin' : ;
    'rake' : ;
    'ruby' : ;
    'rvm' : ;
    'sounds' : ;
    'ssh' : ;
    'warnings' : ;
  }
}
