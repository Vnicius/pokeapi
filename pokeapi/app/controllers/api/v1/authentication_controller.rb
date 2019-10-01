module Api::V1
    class AuthenticationController < ApplicationController
        skip_before_action :auth_request, only: [:authenticate]

        def authenticate
            command = AuthenticateUser.call(params[:email], params[:password])

            if command.success?
                user = User.find_by_email(params[:email])
                render json: user, meta: { token: ::JsonWebToken.encode(id: user.id) }, status: :ok
            else
                render json: { error: command.errors }, status: :unauthorized
            end
        end
    end
end