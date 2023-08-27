class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request

  
  private
  def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(' ').last if header
    if header.present?
      decoded = jwt_decode(header)
      @current_user = User.find_by_id(decoded[:user_id])
    else
      render json: {errors: "You're not authorized"}
    end
  end
end
