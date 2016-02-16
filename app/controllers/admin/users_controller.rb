class Admin::UsersController < ApplicationController
  before_action :set_to_admin
  
  def index
  end

     private
  	def set_to_admin
  		@admin = true
  	end
end
