class ApplicationController < ActionController::Base
	include Pundit
	after_action :verify_authorized, :except => :index, unless: :devise_controller?

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


	protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :role)}

		devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :role, :current_password)}
	end
end
