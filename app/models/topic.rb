class Topic < ApplicationRecord
  belongs_to :topic, optional: true
  has_many :topics

  has_many :service_topics
  has_many :services, through: :service_topics

  scope :locale, ->(locale) { where(locale: locale) }
  scope :top_level_topics, -> { includes(:service_topics).where(service_topics: { id: nil }).where(topic: nil) }
  scope :subtopics, -> { where.not(topic_id: nil) }

  validates :locale, :name, :description, presence: true

  def param
    slug
  end
end
