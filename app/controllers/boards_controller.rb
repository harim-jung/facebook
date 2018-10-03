class BoardsController < ApplicationController

	#before_action :set_board, only: [:show]

	def index
	end
 
 	def show
 		@posts = Post.where(board_id:  params[:id]).paginate(:page => params[:page], :per_page => 3)
 		@board = Board.find(params[:id])
 	end


 	def set_board
    end
end

