class CommentsController < ApplicationController

	before_action :set_comment, only: [:show, :edit, :update, :destroy]
	before_action :set_board, except: :create

	def index
		#@posts = Post.all.paginate(page: params[:page], per_page: 10)
	end

	def show

	end

 # new form page
	def new
		@comment = current_user.comments.build
	end

# actually create 
	def create
		@comment = current_user.comments.build(comment_params)
		@comment.save
		@board = Board.where(id: @comment.post.board.id).first
		redirect_to board_path(@board) #comment를 저장한후 해당 보드로 돌아와야함.
    end

	def edit
		@post = @comment.post
	end

	def update
		if @comment.update(comment_params)
	        redirect_to board_path(@board)
    	else
      		render :edit
      	end
    end

	def destroy
		if @comment.destroy
			redirect_to board_path(@board)
		else
			render :destroy
		end
	end

private

	def set_comment
    	@comment = Comment.find(params[:id])
    end

    def set_board
    	@board = Board.where(id: @comment.post.board.id).first
    end

	def comment_params
		params.require(:comment).permit(:content,:post_id,:user_id) #보호를 위해
    end

end





