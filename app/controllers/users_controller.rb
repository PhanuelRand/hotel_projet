class UsersController < ApplicationController
    around_filter :catch_not_found
    before_filter :set_user, only: [:show, :edit, :update, :destroy]
    respond_to :html
  
    def index
      @users = Chambre.all
      respond_with(@users)
    end
  
    def show      
      @user = User.find(params[:id]) 
      if @user.id == current_user.id
        @reservations = Reservation.all
      else
        redirect_to current_user
      end
    end
  
    def new
      @user = User.new
      respond_with(@user)
    end
  
    def edit
    end
  
    def create
      @user = User.new(params[:user])
      @user.save
      respond_with(@user)
    end
  
    def update
      @user.update_attributes(params[:user])
      respond_with(@user)
    end
  
    def destroy
      @user.destroy
      respond_with(@user)
    end
  
    private
      def catch_not_found
        yield
      rescue ActiveRecord::RecordNotFound
        redirect_to current_user
      end

      def set_user
        @user = User.find(params[:id])
      end
  end
  