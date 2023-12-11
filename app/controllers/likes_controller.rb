class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)
    if @like.save
      respond_to do |format|
        format.html { redirect_to user_post_path(user_id: current_user.id, id: @post.id) }
        format.js
      end
    else
      flash[:alert] = "Couldn't add a like!"
      redirect_to user_post_path(user_id: current_user.id, id: @post.id)
    end
  end

  private

  def like_params
    params.require(:like).permit(:author_id)
  end
end
