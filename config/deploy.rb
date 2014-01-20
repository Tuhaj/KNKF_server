# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'KNKF_server'
set :repo_url, 'git@github.com:Tuhaj/KNKF_server.git'
set :unicorn_pid, proc { "#{shared_path}/tmp/pids/unicorn.pid" }
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/vagrant/app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    task :stop do
      execute "if [ -f #{shared_path}/tmp/pids/unicorn.pid ]; then kill `cat #{shared_path}/tmp/pids/unicorn.pid`; fi"
    end
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
    task :start do
      execute "fi && cd #{current_path}; unicorn_rails -c #{shared_path}/config/unicorn.rb -D"
    end

  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
 
    end
  end

end
