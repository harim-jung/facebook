class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
    	if params[:search]
    		@users = User.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    	else
    		@users = User.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    	end
  	end

  	def show_board
  		@board = current_user.board
  		@posts = Post.where(board_id: @board.id).order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
  	end
end

