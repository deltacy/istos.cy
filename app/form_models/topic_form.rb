class TopicForm
  include ActiveModel::Model

  attr_accessor :slug, :topic,
                :name_en, :description_en,
                :name_el, :description_el

  validates :slug,
            :name_en, :description_en,
            :name_el, :description_el, presence: true

  validate :uniqueness_of_slug, on: :new

  def uniqueness_of_slug
    errors.add(:slug, :unique) if Topic.exists?(slug: slug)
  end

  def save!
    ActiveRecord::Base.transaction do
      Topic.new(locale: 'en', slug: slug, name: name_en, description: description_en, topic: topic_en).save!
      Topic.new(locale: 'el', slug: slug, name: name_el, description: description_el, topic: topic_el).save!
    end
  end

  private

  def topic_en
    Topic.locale('en').find_by(slug: topic)
  end

  def topic_el
    Topic.locale('el').find_by(slug: topic)
  end
end
