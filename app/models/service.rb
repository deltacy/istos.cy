class Service < ApplicationRecord
  validates :name, :website, :locale, presence: true

  scope :locale, ->(locale) { where(locale: locale) }
  scope :by_name, ->(term) { where('lower(name) like ?', "%#{term.downcase}%") }
  scope :by_description, ->(term) { where('lower(description) like ?', "%#{term.downcase}%") }
  scope :results, ->(term) { by_name(term).or(by_description(term)) }

  enum locale: { en: 'English',
                 el: 'Greek' }

  def to_param
    slug
  end
end
