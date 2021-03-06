class TopicsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_topic, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.all.order(id: :desc)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.owner = current_user
    if @topic.save
      redirect_to new_topic_post_path(@topic)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @topic.update(topics_params)
    if @topic.save
      redirect_to new_topic_post_path(@topic)
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topics_params
    params.require(:topic).permit(:title, :info)
  end
end
