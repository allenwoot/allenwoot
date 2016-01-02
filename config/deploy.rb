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

#  # Clear existing task so we can replace it rather than "add" to it.
#  Rake::Task["deploy:compile_assets"].clear 
#
#  desc "Precompile assets locally and then rsync to web servers" 
#  task :compile_assets do 
#    on roles(:web) do 
#      rsync_host = host.to_s 
# 
#      run_locally do 
#        with rails_env: :production do ## Set your env accordingly.
#          execute :bundle, "exec rake assets:precompile" 
#        end 
#        execute "rsync -av --delete ./public/assets/ #{fetch(:user)}@#{rsync_host}:#{shared_path}/public/assets/" 
#        execute "rm -rf public/assets" 
#        # execute "rm -rf tmp/cache/assets" # in case you are not seeing changes 
#      end 
#    end 
#  end
#
