# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cfechild_session',
  :secret      => 'bfe1c077b27724d6dd7200bf930733e24fa3831e4f0021fd0cbb19f54b3e4765cc1d094b318d0d1333da5a70384e46d515d60cc0997881894dbb67cb190e933f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
