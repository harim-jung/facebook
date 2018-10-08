class FriendshipsController < ApplicationController
before_action :find_friend, except: :index

  def index
  	@friends = current_user.friends.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  	@users = User.all
  end

  def create
    Friendship.request(current_user, @friend)
    flash[:notice] = "Friend Request sent to #{@friend.name}"
	redirect_back fallback_location: root_path
  end

  def update 
    if current_user.requested_friends.include?(@friend)
      Friendship.accept(current_user, @friend)
      flash[:notice] = "Friend Request from #{@friend.name} accepted"
    end
	redirect_back fallback_location: root_path
  end

  def destroy
    if current_user.friends.include?(@friend)
      Friendship.breakup(current_user, @friend)
      flash[:notice] = "Successfully unfriended #{@friend.name}"
    elsif current_user.requested_friends.include?(@friend)
      Friendship.breakup(current_user, @friend)
      flash[:notice] = "Friend Request from #{@friend.name} declined"
    elsif current_user.pending_friends.include?(@friend)
      Friendship.breakup(current_user, @friend)
      flash[:notice] = "Friend Request to #{@friend.name} cancelled"        
    end
	redirect_back fallback_location: root_path
  end

  private
    def find_friend
      @friend = User.find(params[:friend_id])
    end

    def friendship_params
    	params.require(:freindship).permit(:user, :friend)
    end

end
