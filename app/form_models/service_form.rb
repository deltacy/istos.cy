class ServiceForm
  include ActiveModel::Model

  attr_accessor :slug, :topic,
                :name_en, :description_en, :website_en, :information_en,
                :name_el, :description_el, :website_el, :information_el

  validates :name_en, :description_en, :website_en,
            :name_el, :description_el, :website_el, presence: true

  validate :uniqueness_of_slug, on: :new

  def uniqueness_of_slug
    errors.add(:slug, :unique) if Service.exists?(slug: slug)
  end

  def save!
    ActiveRecord::Base.transaction do
      Service.new(locale: 'en', slug: slug, name: name_en, description: description_en, website: website_en,
                  information: information_en, topic: retrieve_topic('en')).save!
      Service.new(locale: 'el', slug: slug, name: name_el, description: description_el, website: website_el,
                  information: information_el, topic: retrieve_topic('el')).save!
    end
  end

  def update!
    ActiveRecord::Base.transaction do
      update_service_en!
      update_service_el!
    end
  end

  def self.load_data(slug:, topic:, service_en:, service_el:)
    new({ slug: slug, topic: topic }.merge(service_params(service_en: service_en, service_el: service_el)))
  end

  def retrieve_topic(locale)
    Topic.locale(locale).find_by(slug: topic)
  end

  def self.service_params(service_en:, service_el:)
    { name_en: service_en.name,
      description_en: service_en.description,
      website_en: service_en.website,
      information_en: service_en.information,
      name_el: service_el.name,
      description_el: service_el.description,
      website_el: service_el.website,
      information_el: service_el.information }
  end

  private

  def update_service_en!
    Service.locale('en').find_by(slug: slug).update!(name: name_en,
                                                     description: description_en,
                                                     website: website_en,
                                                     information: information_en,
                                                     topic: retrieve_topic('en'))
  end

  def update_service_el!
    Service.locale('el').find_by(slug: slug).update!(name: name_el,
                                                     description: description_el,
                                                     website: website_el,
                                                     information: information_el,
                                                     topic: retrieve_topic('el'))
  end
end
