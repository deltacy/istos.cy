class Service < ApplicationRecord
  validates :name, :website, :locale, presence: true

  enum locale: { en: 'English',
                 el: 'Greek' }
end
