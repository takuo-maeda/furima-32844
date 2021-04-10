class ApplicationController < ActionController::Base
  before_action :authenticate_user! 
  #log_inしていないユーザーをログインページへ
  before_action :configure_permitted_parameters, if: :devise_controller?



  private

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :encrypted_password, :first_name, :last_name, :first_name_prono, :last_name_prono, :birthday]
    )
  end
end
