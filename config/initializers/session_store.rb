# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_musigigs_session',
  :secret      => 'ff1b654ef17387a9526ffbb1db50f4f10299f5c54107c3d9208494c2fc44c15342882321051ea8f9395b5bd27f5353001a4986ff44ee623cc31b23a544903250'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
