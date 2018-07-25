source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
gem 'unicorn'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Wisper is used as an in process pub/sub to decouple events / commands
gem 'wisper', '2.0.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

gem 'sidekiq', '~> 5.1', '>= 5.1.3'
gem 'sidekiq-cron', '~> 0.6', '>= 0.6.3'

# ET to ATOS File transfer packaged as a rack endpoint (rails engine) for easy deployment as a separate service.
# Note that we are now using it as a separate service, but we need this gem just for the model for now
# (and we need it for test environment)
gem 'et_atos_file_transfer', git: 'https://github.com/ministryofjustice/et_atos_file_transfer.git', ref: 'c51b82d49f3cb16dbb6ee5126b46aaeb4569bd26'

# Rubyzip used to produce and test zip files
gem 'rubyzip', '~> 1.2', '>= 1.2.1'

# Pdf forms to test pdf content and also to produce them
gem 'pdf-forms', '~> 1.1', '>= 1.1.1'

# AWS SDK gem
gem 'aws-sdk-s3', '~> 1.13'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.7'
  gem 'simplecov', '~> 0.16.1'
  gem 'dotenv-rails', '~> 2.4'
  gem 'site_prism', '~> 2.15', '>= 2.15.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', '~> 0.54'
  gem 'rubocop-rspec', '~> 1.24'
end

group :test do
  gem 'database_cleaner', '~> 1.6.2'
  gem 'factory_bot', '~> 4.8'
  gem 'rspec-eventually', '~> 0.2.2'
  gem 'faker', '~> 1.8', '>= 1.8.7'
  gem 'webmock', '~> 3.4', '>= 3.4.1'
  gem 'httparty', '~> 0.16.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'et_acas_api', path: 'vendor/gems/et_acas_api'
gem 'et_fake_acas_server', git: 'https://github.com/ministryofjustice/et_fake_acas_server.git', ref: 'e81e7dfb24c23133c671631f193d3986fabbf132'

