# Go to http://wiki.merbivore.com/pages/init-rb
 
# Specify a specific version of a dependency
# dependency "RedCloth", "> 3.0"

require 'config/dependencies.rb'

use_orm :activerecord
use_test :rspec
use_template_engine :haml
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = 'abd0bae399c684ae32543d58f02a92f4cdfcf29c'  # required for cookie session store
  c[:session_id_key] = '_download-this-link_session_id' # cookie session id key, defaults to "_session_id"
end

Merb.push_path(:lib, Merb.root / "lib", "*.rb")

Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app's classes have loaded.
end
 
Merb::BootLoader.after_app_loads do
  # This will get executed after your app's classes have been loaded.
  gem 'will_paginate', '~> 3.0.0'
  require 'will_paginate'
end