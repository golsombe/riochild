set :user, 'carefort'
set :password, 'sd7656dsq'
set :server, 'riochilddev'
set :application, 'carefortheearth.com'
set :repository, 'git://github.com/golsombe/riochild.git'
set :keep_releases, 2
set :use_sudo, false
set :branch, "master"

set :scm, "git"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, application                          # Your HTTP server, Apache/etc
role :app, application                          # This may be the same as your `Web` server
role :db,  application, :primary => true # This is where Rails migrations will run

set :deploy_to, '/home/carefort/railsapps/riochilddev'

task :restart, :roles => :app do
end

after "deploy:update_code", :roles => [:web, :db, :app] do
	run "chmod 755 #{release_path}/public -R"
end

after "deploy:update", "deploy:cleanup"

# If you are using Passenger mod_rails uncomment this:
# if youre still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,"tmp","restart.txt")}"
#   end
# end
