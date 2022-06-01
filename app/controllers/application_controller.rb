class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def disable_nav
    @disable_nav = true
  end



  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :category_health, :category_sport, :category_business, :category_hobby])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :category_health, :category_sport, :category_business, :category_hobby])
  end
end
