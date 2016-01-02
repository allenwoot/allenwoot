lock '3.4.0'

set :application, 'allenwoot'
set :repo_url, 'git@github.com:allenwoot/allenwoot.git'
set :branch, :master
set :deploy_to, '/home/deploy/allenwoot'
set :pty, true
set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :user
set :rvm_ruby_version, 'ruby-2.2.1' # Edit this if you are using MRI Ruby

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

# There is an issue where nginx fails to read the assets. It tries to read from
# allenwoot/public/assets, when they are located at allenwoot/current/public/assets.
# I must be missing something and I'm sure there is a good fix, but this workaround
# just copies all the compiled assets to the target directory post deploy.
namespace :deploy do
  desc "copy assets out of current directory"
  task :copy_assets do
    on roles(:all) do
      execute "rm -rf ~/allenwoot/public/assets && mkdir -p ~/allenwoot/public/assets && cp ~/allenwoot/current/public/assets/* ~/allenwoot/public/assets"
    end
  end
end
after "deploy:finished", "deploy:copy_assets"
