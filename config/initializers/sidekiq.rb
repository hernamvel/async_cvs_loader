# frozen_string_literal: true

# Set Sidekiq redis database to differ from other services to prevent workers
#   from pulling other services' jobs during local development
if Rails.env.development? || Rails.env.test?
  url = ENV.fetch('REDIS_URL') { 'redis://localhost:6379/4' }
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end
else
  url = ENV.fetch('REDISTOGO_URL')
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end

end
