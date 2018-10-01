class PostsController < ApplicationController

  def new
    @topic = Topic.find(params[:topic_id])
    @posts = Post.all.order(id: :desc)
    @post = Post.new
  end

  private

end
