class Api::V1::AuthenticationController < ApplicationController

  skip_before_action :authenticate_request

  def login
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id)
      render json: {token: token}, status: :ok
    else
      render json: {error: 'Email or password seems incorrect.'}, status: :unauthorized
    end
  end
end
