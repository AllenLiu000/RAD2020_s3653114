class StaticPagesController < ApplicationController

  def home
    @actives = Active.first(12)
    @microposts = Micropost.first(30)
    @topics = Topic.all
    @topics.each do |topic|
      topic.update_attribute(:status, 0)
    end
  end

  def help
  end


  def select
    @actives = Active.first(12)
    @microposts = Micropost.where(id: 1)
    @topics = Topic.all
    @topics.each do |topic|
      if topic.status == 1
        @selectMicroposts = Micropost.where(topic: topic.name)
        @microposts += @selectMicroposts
      end
    end
  end

  def selectTopic
    @topic = Topic.find(params[:id])
    if @topic.status == 0
      @topic.update_attribute(:status, 1)
    else
      @topic.update_attribute(:status, 0)
    end
    redirect_to select_path
  end

  

  def about
  end

  def contact
  end
end