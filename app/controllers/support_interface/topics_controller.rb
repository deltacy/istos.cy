module SupportInterface
  class TopicsController < ApplicationController
    def index
      @topics = Topic.locale(I18n.locale).all
    end

    def new
      @topic_form = TopicForm.new
    end

    def create
      @topic_form = TopicForm.new(topic_params)
      if @topic_form.valid?(:new)
        @topic_form.save!
        redirect_to support_interface_root_path, notice: 'Topic created successfully'
      else
        render 'new', status: :unprocessable_entity
      end
    end

    private

    def topic_params
      params.require(:topic_form).permit(:slug, :name_en, :description_en, :name_el, :description_el, :topic)
    end

    helper_method :available_topics

    def available_topics
      Topic.locale(I18n.locale).top_level_topics
    end
  end
end
