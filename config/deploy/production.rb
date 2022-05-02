server "207.154.197.143", user: "#{fetch(:user)}", roles: %w{app db web}, primary: true

set :application, "TechnoBoom"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :environment, "production"
set :rails_env,   "production"

set :nginx_server_name, "tecnoboom.hopto.org"
set :puma_conf, "#{shared_path}/config/puma.rb"