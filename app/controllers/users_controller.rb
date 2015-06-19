class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    render json: { user: @user.as_json(only: [:id, :full_name, :username,
                                              :email, :access_token]) }
  end

  def register
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.new(email: params[:email],
                     full_name: params[:full_name],
                     username: params[:username],
                     password: passhash)
    if @user.save
      # render json "register.json.jbuilder", status: :created
      render json: { user: @user.as_json(only: [:id, :email, :access_token]) },
        status: :created
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def login
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.find(email: params[:email],
                         password: passhash)
    if @user.find
      # render json "register.json.jbuilder", status: :created
      render json: { user: @user.as_json(only: [:id, :full_name, :username,
                                                :email, :access_token]) },
             status: :created
      elseg
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end
end