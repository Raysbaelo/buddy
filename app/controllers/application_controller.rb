class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_profile!, if: :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_general_score, if: :current_user

  def disable_nav
    @disable_nav = true
  end

  def set_general_score
     @general_score = current_user.tasks.done.count
  end





  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :category_health, :category_sport, :category_business, :category_hobby])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :category_health, :category_sport, :category_business, :category_hobby])
  end

  def check_profile!
    redirect_to edit_profile_path if current_user.tasks.none?
  end

  # app/controllers/application_controller.rb

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
