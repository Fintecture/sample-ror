class ApplicationController < ActionController::Base
  require 'fintecture'

  before_action :load_fintecture_config

  private

  def load_fintecture_config
    @fintecture_environment     = Fintecture.environment
    @fintecture_app_id          = Fintecture.app_id
    @fintecture_app_secret      = Fintecture.app_secret
    @fintecture_app_private_key = Fintecture.app_private_key
  end
end
