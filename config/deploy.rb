require 'rubygems'
require 'capcake'

set :application, "top10"
set :default_stage, "dev"
set :use_sudo, false
set :keep_releases, 5

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm, :git
set :scm_username, 'primeinister@mowd.nl'
set :repository,  "git@github.com:primeminister/Top10.git"
set :branch, "master"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true

set :domain, 'pooh.febe.nl'
set :user, 'charlie'
set :change_ownership, false
set :deploy_to, "/home/charlie/sites/www/automagisch.nl"
set :db_user, "charlie"
set :db_pass, "My$ql"
set :db_name, "charlie_top10"
set :db_host, "localhost"
set :db_adapter, "mysql"
set :core_debug_level, 0
set :core_disable_cache, false

set :cake_branch, "1.3.6"
set :branch, "tag"

role :web, "#{domain}"                          # Your HTTP server, Apache/etc
role :app, "#{domain}"                          # This may be the same as your `Web` server
role :db,  "#{domain}", :primary => true # This is where Rails migrations will run


# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start {}
#   task :stop {}
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

capcake