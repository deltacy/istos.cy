class ServiceForm
  include ActiveModel::Model

  attr_accessor :slug,
                :name_en, :description_en, :website_en,
                :name_el, :description_el, :website_el

  validates :name_en, :description_en, :website_en,
            :name_el, :description_el, :website_el, presence: true

  def save!
    service_en = Service.locale('en').find_by(slug: slug)
    service_el = Service.locale('el').find_by(slug: slug)

    ActiveRecord::Base.transaction do
      service_en.update!(name: name_en,
                         description: description_en,
                         website: website_en)

      service_el.update!(name: name_el,
                         description: description_el,
                         website: website_el)
    end
  end

  def self.load_data(slug:, service_en:, service_el:)
    params = { slug: slug,
               name_en: service_en.name,
               description_en: service_en.description,
               website_en: service_en.website,
               name_el: service_el.name,
               description_el: service_el.description,
               website_el: service_el.website }

    new(params)
  end
end
