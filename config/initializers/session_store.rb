# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_SitRepStage_session',
  :secret      => '0217411585bacb361089a40a933365ae6276aa8bb06747e2da2bc7f96d0b06bc21f18b7d175f8cb3ddcd83ad614560406b71c7eceb8d8adab33670cdc3909226'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
