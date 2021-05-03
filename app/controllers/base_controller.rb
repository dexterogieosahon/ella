class BaseController < ActionController::API
  before_action :authenticate_user!

  private

    def authenticate_user!
      return render json: [], status: :unauthorized unless current_user
    end

    def current_user
      @current_user ||= User.find_by(id: request.headers['Authorization'] || nil)
    end

end
