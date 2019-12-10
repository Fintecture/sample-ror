class SetUpController < ActionController::Base

  def create
    environment, app_id, app_secret, app_private_key = params[:object].values

    if app_id.blank? or app_secret.blank? or app_private_key.blank?
      raise "I need a value for App ID, App Secret and App Private Key"
    end

    Fintecture.environment = environment
    Fintecture.app_id = app_id
    Fintecture.app_secret = app_secret
    Fintecture.app_private_key = app_private_key

    redirect_to '/'
  end

  private

  def allowed_params
    params.require(:object).permit(
        :environment,
        :app_id,
        :app_secret,
        :app_private_key
    )
  end
end
