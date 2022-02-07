class Service < ApplicationRecord
  validates :name, :website, :locale, presence: true

  enum locale: %i[en el]
end
