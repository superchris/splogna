set :application, "splogna"
set :scm, :git
set :repository,  "git://github.com/superchris/splogna.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/christo0/apps/#{application}"

set :scm_command, "/usr/local/bin/git"
set :local_scm_command, "/usr/local/git/bin/git"
set :scm_username, "superchris"
set :user, "christo0"
set :use_sudo, false

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

server "www.christophernelsonconsulting.com", :app, :web, :db, :primary => true

after "deploy:update_code", "shared:symlink"

namespace :shared do
  desc "Make symlink for database yaml"
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end

  task :restart, :roles => :app do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end
end

