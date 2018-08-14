# Configuration de CarrierWave
CarrierWave.configure do |config|
  config.dropbox_access_token = Rails.application.credentials.dropbox[:TOKEN]
end
