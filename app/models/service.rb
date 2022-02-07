class Service < ApplicationRecord
  validates :name, :website, :locale, presence: true

  enum locale: [:en, :el]
end
