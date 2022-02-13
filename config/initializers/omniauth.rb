Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity
end

OmniAuth.config.on_failure = proc do |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_auth_failure
end
