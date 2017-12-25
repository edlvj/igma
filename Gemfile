source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.1'
gem 'hanami-model', '~> 1.1'
gem 'hanami-bootstrap'

gem 'bcrypt'
gem 'pg'

gem 'instagram_api_client'
gem 'haml'
gem 'sidekiq'
gem 'sidekiq-scheduler'

gem 'foreman'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
  gem 'pry'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'factory_girl'
  gem 'database_cleaner'
  gem 'rack_session_access'
end

group :production do
  # gem 'puma'
end
