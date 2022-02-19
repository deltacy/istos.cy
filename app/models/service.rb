class Service < ApplicationRecord
  has_one :service_topic
  has_one :topic, through: :service_topic

  validates :name, :website, :locale, presence: true

  scope :locale, ->(locale) { where(locale: locale) }
  scope :by_name, ->(term) { where('lower(name) like ?', "%#{term.downcase}%") }
  scope :by_description, ->(term) { where('lower(description) like ?', "%#{term.downcase}%") }
  scope :results, ->(term) { by_name(term).or(by_description(term)) }
  scope :localised_results, ->(term, locale) { Service.locale(locale).where(slug: results(term).pluck(:slug)) }

  enum locale: {
    en: 'English',
    el: 'Greek'
  }

  enum availability: {
    temporarily_unavailable: 0,
    not_found: 1,
    ok: 2
  }
  def to_param
    slug
  end
end
