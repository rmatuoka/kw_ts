Rails.application.config.middleware.use OmniAuth::Builder do
  
  if Rails.env.production?
    #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
    provider :facebook, '214257502359049', '2cc71b051eccfff0d2f020367924fa06'
    # Mention other providers here you want to allow user to sign in with
  elsif Rails.env.development?
    #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
    provider :facebook, '214257502359049', '2cc71b051eccfff0d2f020367924fa06'
    # Mention other providers here you want to allow user to sign in with    
  end

end