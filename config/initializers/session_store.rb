# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails_space_session',
  :secret      => '8d27802b28a922dca53549e7a2e389f2322b469acb69d09aaa5c5be56420b086bd07ccdb0af609cae4b5890fb34f4df74dab44abee1fecc2017cb58c6b8fe836'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
