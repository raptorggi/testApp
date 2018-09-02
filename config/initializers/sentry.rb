# Sentry configuration 

Raven.configure do |config|
  config.logger = Logger.new(STDOUT)
  config.logger.level = :error

  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  config.dsn = ENV['SENTRY_DSN']
  config.environments = %w[ development production ]

  config.async = lambda { |event|
    Thread.new { Raven.send_event(event) }
  }
end