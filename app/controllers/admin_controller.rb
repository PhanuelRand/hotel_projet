class AdminController < ApplicationController
  protect_from_forgery

  before_filter :check_role

  def check_role
    unless current_user.roles.map{|x| x.role_type}.include?("Admin")
      redirect_to root_path
    end
  end

  
end
