class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
  helper_method :success_resp, :failure_resp, :api_user


  def success_resp(message='Invalid request', obj={})
    render json: { status: 'success', message: message, obj: obj}
  end

  def failure_resp(message='', obj={})
    render json: { status: 'failure', message: message, obj: obj}
  end

  def api_user
    return User.find(params[:user_id]) if params[:user_id]
  end
end
