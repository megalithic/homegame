set :user, 'deploy'
set :domain, 'homega.me'
set :application, "homegame"

set :repository, "git@github.com:megalithic/homegame.git" # Your clone URL
set :scm, "git"
set :branch, "master"
set :scm_verbose, true
set :deploy_via, :remote_cache
set :scm_passphrase, "Blackwood0703" # The deploy user's password
set :deploy_to, "/home/#{user}/#{domain}"
set :use_sudo, false

require "bundler/capistrano"

set :whenever_command, "bundle exec whenever"
require 'whenever/capistrano'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:port] = 30000

role :web, domain # Your HTTP server, Apache/etc
role :app, domain # This may be the same as your `Web` server
role :db, domain, :primary => true # This is where Rails migrations will run

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:migrations", "deploy:cleanup"