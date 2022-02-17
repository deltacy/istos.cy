class TopicsController < ApplicationController
  def show
    @topic = Topic.locale(I18n.locale).find_by(slug: topic_id)
    @parent_topic = @topic.topic.presence

    render 'show'
  end

  private

  def topic_id
    params.permit(:id)[:id]
  end
end
