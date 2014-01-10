#!/usr/bin/env ruby
set :stage, :ci
server "ci.example.com", :web, :app, primary: true
set :application, "CI.Exmu"

set :pty, true
set :format, :pretty
set :log_level, :debug

set :user, ENV['USER']
set :host, ENV['HOST']

set :ssh_options, {
  forward_agent: true,
  verbose: :debug
}

desc <<-DESC
Takes a Ubuntu Precise host from nothing to Jenkins CI in a single task.

This task does the following:

  * adds the puppetlabs apt repos
  * installs puppet and git
  * clones this repos into /opt/build
  * runs puppet apply

Arguments:

  Required: (host to run remote command on)

    HOST="fqdn goes here"

  Optional: (defaults to calling username)

    USER='username to run remote commands as'

DESC

task :go do |t|
  on roles(:all) do
    abort "HOST is empty. run 'cap -T go' for usage info." if host.nil?
    run "echo 'deb http://apt.puppetlabs.com precise main' | #{sudo} tee /etc/apt/sources.list.d/puppetlabs.list"
    run "#{sudo} apt-key adv --keyserver keyserver.ubuntu.com --recv 4BD6EC30" #puppetlabs
    run "#{sudo} apt-get update"
    run "#{sudo} apt-get install -yq puppet git-core ruby1.8 libopenssl-ruby ruby rubygems ruby-bundler"
    run "#{sudo} gem install librarian-puppet --no-ri --no-rdoc"
    run "#{sudo} mkdir /opt/build -m0755"
    run "#{sudo} chown #{user}:#{user} /opt/build"
    run "git clone https://github.com/xpepper/jenkins-appliance.git /opt/build"
    run "cd /opt/build && librarian-puppet install --verbose"
    run "#{sudo} puppet apply --verbose /opt/build/manifests/site.pp --modulepath=/opt/build/modules"
  end
end

desc <<-DESC
DNAT rule to redirect port 80 to 8080

This applies a simple iptables REDIRECT to make Jenkins available on port 80.

# sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080

DESC
task :dnat do |t|
  on roles(:all) do
    run "#{sudo} iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080"
  end
end
