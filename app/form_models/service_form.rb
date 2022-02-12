class ServiceForm
  include ActiveModel::Model

  attr_accessor :slug,
                :name_en, :description_en, :website_en, :information_en,
                :name_el, :description_el, :website_el, :information_el

  validates :name_en, :description_en, :website_en, :information_en,
            :name_el, :description_el, :website_el, :information_el, presence: true

  validate :uniqueness_of_slug, on: :new

  def uniqueness_of_slug
    errors.add(:slug, :unique) if Service.exists?(slug: slug)
  end

  def save!
    ActiveRecord::Base.transaction do
      Service.new(locale: 'en', slug: slug, name: name_en, description: description_en, website: website_en,
                  information: information_en).save!
      Service.new(locale: 'el', slug: slug, name: name_el, description: description_el, website: website_el,
                  information: information_el).save!
    end
  end

  def update!
    ActiveRecord::Base.transaction do
      Service.locale('en').find_by(slug: slug).update!(name: name_en,
                                                       description: description_en,
                                                       website: website_en,
                                                       information: information_en)

      Service.locale('el').find_by(slug: slug).update!(name: name_el,
                                                       description: description_el,
                                                       website: website_el,
                                                       information: information_el)
    end
  end

  def self.load_data(slug:, service_en:, service_el:)
    params = { slug: slug,
               name_en: service_en.name,
               description_en: service_en.description,
               website_en: service_en.website,
               information_en: service_en.information,
               name_el: service_el.name,
               description_el: service_el.description,
               website_el: service_el.website,
               information_el: service_el.information }

    new(params)
  end
end
