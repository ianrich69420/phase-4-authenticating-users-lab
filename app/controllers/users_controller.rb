class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_unauthorized_response
    def show
        render json: User.find(session[:user_id])
    end

    private

    def render_unauthorized_response
        render json: { error: "Unauthorized" }, status: :unauthorized
    end

end
