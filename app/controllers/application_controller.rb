class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_csrf_cookie
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def set_csrf_cookie
    cookies['CSRF-TOKEN'] = form_authenticity_token
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    err_message = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default
    render json: { message: err_message }, status: :unauthorized
  end
end
