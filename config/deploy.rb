set :application, "uccn.org"
set :repository,  "git@github.com:underwhelmed/uccn.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, 'root'
set :user_sudo, false
set :deploy_to, "/webapps/uccn/dev/#{application}"
set :deploy_via, :remote_cache


role :web, "192.168.1.120"                          # Your HTTP server, Apache/etc
role :app, "192.168.1.120"                          # This may be the same as your `Web` server
role :db,  "192.168.1.120", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:restart"

namespace :deploy do
  task :bundle_gem do
    run "cd #{deploy_to}/current && bundle install vendor/gems"
  end
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end