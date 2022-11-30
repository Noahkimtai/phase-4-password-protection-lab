class SessionsController < ApplicationController

    def create
        user = User.find_by_username(params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user
        else
            render json: {error: 'Invalid logins'}, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
    end
end
