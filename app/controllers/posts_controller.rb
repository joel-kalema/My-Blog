# frozen_string_literal: true

class PostsController < ApplicationController # rubocop:todo Style/Documentation
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.where(author_id: params[:user_id])
  end
end
