class UsersController < ApplicationController
  before_action :require_login, only: [:index, :all, :show]
  def index
    @all_connections = Connection.all
    @accepted_connections = Connection.where(user_id: current_user.id, status: "Accepted")    
  end

  def new 
  end

  def all
    @all_connections = Connection.all
    @all_users = User.where.not("id = ?", current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    u = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], description: params[:description])

    if u.valid?
      session[:user_id] = u.id
      redirect_to '/profile'
    else
      flash[:errors] = u.errors.full_messages
      redirect_to :back
    end
  end

  def logout
    session[:user_id] = nil

    redirect_to '/'
  end
end
