# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_splogna_session',
  :secret      => 'dcc8cf383884dfc6442f6751003e15e9374f5449ef356ffdf29a57ab848d431b8e365df073fcbd682d71a34acaf496d93e24c31ee0c7fb8156c0a7aeda2da74a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
