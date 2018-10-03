class PostsController < ApplicationController

	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		#@posts = Post.all.paginate(page: params[:page], per_page: 10)
	end

	def show

	end

 # new form page
	def new
		@post = current_user.posts.build
	end

# actually create 
	def create
		@post = current_user.posts.build(post_params)
		@post.save
		@board = Board.where(id: @post.board_id).first
		redirect_to board_path(@board) #post를 저장한후 해당 보드로 돌아와야함.
    end

	def edit
	end

	def update
		if @post.update(post_params)
	        redirect_to @board
    	else
      		render :edit
      	end
    end

	def destroy
		if @post.destroy
			redirect_to @board
		else
			render :destroy
		end
	end

private

	def set_post
    	@post = Post.find(params[:id])
    end

	def post_params
		params.require(:post).permit(:content,:board_id,:user_id) #보호를 위해
    end

end



