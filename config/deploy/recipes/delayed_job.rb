require "delayed/recipes"

role :delayed_job, 'db.rails-bestpractices.com'
set :delayed_job_server_role, :delayed_job

before "deploy:restart", "delayed_job:stop"
after  "deploy:restart", "delayed_job:start"

after "deploy:stop",  "delayed_job:stop"
after "deploy:start", "delayed_job:start"
