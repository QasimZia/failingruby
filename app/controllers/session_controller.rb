class SessionController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email(params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            puts user.valid?
            redirect_to controller: 'users', action: 'index'
        else
            flash[:errors] = user.errors.full_messages unless user == nil
            flash[:errors] = ['User not found'] if user == nil

            if user.try(:authenticate, params[:password]) == false
                flash[:errors] = ['Wrong email/password']
                redirect_to '/' and return
            end
        
            redirect_to '/'
        end

        return false
    end
end
