class Topic < ApplicationRecord
  belongs_to :topic, optional: true
  has_many :topics, -> { order(:name) }

  has_many :service_topics, -> { order(:name) }
  has_many :services, through: :service_topics

  scope :locale, ->(locale) { where(locale: locale) }
  scope :top_level_topics, -> { includes(:service_topics).where(service_topics: { id: nil }).where(topic: nil) }
  scope :subtopics, -> { where.not(topic_id: nil) }

  validates :locale, :name, :description, presence: true

  def to_param
    slug
  end
end
