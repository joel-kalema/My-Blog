# frozen_string_literal: true

class CommentsController < ApplicationController # rubocop:todo Style/Documentation
  def index
    @comments = Post.where(post_id: params[:post_id])
  end
end
