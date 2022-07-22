class CommentsController < ApplicationController
    def index
        @comments = Post.where(post_id: params[:post_id])
    end
end