class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
    	@users = User.paginate(:page => params[:page], :per_page => 5)
  	end

  	def show
  	end

  	def create
  	end

end

