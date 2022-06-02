module Api
  module V1
    class SessionsController < ApplicationController
      def create
        @user = User.where(email: params[:email]).first
        if @user.valid_password?(params[:password])
          render :create, status: 201
        else
          head :unauthorized
        end
      end

      def destroy
        current_user&.authentication_token = nil

        if current_user.save
          head :ok
        else
          head :unauthorized
        end
      end
    end
  end
end
