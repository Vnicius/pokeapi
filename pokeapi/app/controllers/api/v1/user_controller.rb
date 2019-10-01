module Api::V1
    class UserController < ApplicationController
        skip_before_action :auth_request, only: [:create]

        def create
            user = User.create(
                email: params[:email], 
                password: params[:password], 
                password_confirmation: params[:password]
            )

            if user.valid?
                render json: { message: "SUCCESS", data: { auth_token: ::JsonWebToken.encode(id: user.id)  } },
                        status: 200
            else
                render json: { message: "ERROR" }, status: :unprocessable_entity, errors: user.errors.messages
            end
        end

        def me
            render json: @current_user, status: :ok
        end
    end
end