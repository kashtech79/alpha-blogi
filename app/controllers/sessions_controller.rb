class SessionsController < ApplicationController
    def new
    
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id]=user.id
            flash[:notice]="You are successfully log in"
            redirect_to user
        else
            flash.now[:alert] = "There is something wrong in your login details"
            render 'new'
        end

    end

    def destroy
        session[:user_id]=nil
        flash[:notice]="Logged out"
        redirect_to root_path
    end
end