class ApplicationController < ActionController::API

    before_action :auth_request

    private

    def auth_request
        @current_user ||= AuthRequest.call(request.headers).result
        render json: { status: "Unauthorized" }, status: 401 unless @current_user
    end
end
