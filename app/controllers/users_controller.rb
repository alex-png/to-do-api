class UsersController < ApplicationController
    
    def init(user)
        @@user = user
    end

    def show
        byebug
        user_notes = @@user.notes
        render json: user_notes
    end

    def authenticate
        user = User.find_by(name:params[:user][:name])
        init(user)
        if user && user.password_digest == params[:user][:password_digest]
            render json: {id: user.id, name: user.name}
        else
            render json: user.errors
        end
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user, status: :created
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end



    private
    def user_params
        params.require(:user).permit(:name, :password_digest)
    end
end
