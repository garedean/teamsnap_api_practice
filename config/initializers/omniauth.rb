Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :developer unless Rails.env.production?
  if Rails.env.production?
    binding.pry
    provider :teamsnap, ENV['TEAMSNAP_KEY'], ENV['TEAMSNAP_SECRET'], scope: "read"
  else
    binding.pry
    provider :teamsnap, ENV['DEV_TEAMSNAP_KEY'], ENV['DEV_TEAMSNAP_SECRET'], scope: "read"
  end
end
