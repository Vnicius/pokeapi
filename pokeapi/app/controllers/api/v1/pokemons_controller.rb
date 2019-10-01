
module Api::V1
    class PokemonsController < ApplicationController
        rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

        def show
            render json: {status: "SUCCESS", data: Pokemon.all }, status: :ok
        end

        def get
            pk = Pokemon.where(pkdex_number: params[:id]).first
            
            if pk.nil?
                render json: {status: "ERROR", data: nil }, status: :not_found            
            else
                render json: {status: "SUCCESS", data: pk }, status: :ok
            end
        end

        def search
            if params[:q].nil?
                render json: {status: "ERROR", data: {} }, status: :bad_request
            else
                pk = Pokemon.search(params[:q])
                render json: {status: "SUCCESS", data: pk }, status: :ok
            end
        end

        def handle_not_found
            render json: {status: "ERROR", data: {} }, status: :not_found
        end
    end 
end