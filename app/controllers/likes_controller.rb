class LikesController < ApplicationController
    def new
      @like = Like.new
      @user = current_user
    end
  
    def create
      @post = Post.find(params[:post_id] || params[:id])
      @like = Like.new(post_id: @post.id, author_id: current_user.id)
      @like.author_id = current_user.id
  
      respond_to do |format|
        if @like.save
          format.html { redirect_to user_post_url(current_user, @post), notice: 'Like was successfully created.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
end