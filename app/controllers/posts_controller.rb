class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @user = current_user
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(title: params[:post][:title], text: params[:post][:text], comments_counter: 0, likes_counter: 0)
    @post.author_id = current_user.id

    respond_to do |format|
      if @post.save!
        format.html { redirect_to new_user_post_url(current_user, @post), notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
  end
end
