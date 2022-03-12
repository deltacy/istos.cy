class ServiceRequirement < ApplicationRecord
  validates :locale, :title, presence: true

  scope :locale, ->(locale) { where(locale: locale) }
end
