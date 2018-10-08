class BoardsController < ApplicationController

	def index
	end
 
 	def show
 		#id  필수
    	@board = Board.find(params[:id])
 		@posts = Post.where(board_id:  params[:id]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
 	end

end

