class PostsController < ApplicationController
  before_action :set_topic, only: [:create]

  def new
    @topic = Topic.find(params[:topic_id])
    @posts = Post.where(topic_id: @topic).order(id: :desc)
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.topic = @topic
    if @post.save
      redirect_to new_topic_post_path(@topic)
    else
      render :new
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
