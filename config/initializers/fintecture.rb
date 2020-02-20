# Fintecture.app_id = ENV['fintecture_app_id']
# Fintecture.app_secret = ENV['fintecture_app_secret']
# Fintecture.private_key = ENV['fintecture_app_private_key']

# TO GET PARAMETERS FROM CREDENTIALS.YML.ENC
# Fintecture.app_id = Rails.application.credentials.fintecture_app_id
# Fintecture.app_secret = Rails.application.credentials.fintecture_app_secret
# Fintecture.private_key = Rails.application.credentials.fintecture_app_private_key

# TO GET PARAMENTERS FROM SECRETS.YML
Fintecture.app_id = Rails.application.secrets.fintecture_app_id
Fintecture.app_secret = Rails.application.secrets.fintecture_app_secret
Fintecture.private_key = Rails.application.secrets.fintecture_app_private_key