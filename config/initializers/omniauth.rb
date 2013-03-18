Rails.application.config.middleware.use OmniAuth::Builder do
  provider :readability, ENV['SWAGGREGATE_READABILITY_CLIENT_ID'], ENV['SWAGGREGATE_READABILITY_CLIENT_SECRET']
end