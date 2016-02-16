class Admin::DashboardController < ApplicationController
 before_action :authenticate_user!
  
  def index
  	@admin = true
  end

  private
  	def set_to_admin
  		@admin = true
  	end


  	def is_admin
  	end


end
