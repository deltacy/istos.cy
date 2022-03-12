class ServiceRequirementForm
  include ActiveModel::Model

  attr_accessor :service, :title_en, :title_el

  validates :service, :title_en, :title_el, presence: true

  def save!
    ActiveRecord::Base.transaction do
      ServiceRequirement.new(locale: 'en', title: title_en, service: retrieve_service('en')).save!
      ServiceRequirement.new(locale: 'el', title: title_el, service: retrieve_service('el')).save!
    end
  end

  def update!
    ActiveRecord::Base.transaction do
      update_service_requirement_en!
      update_service_requirement_el!
    end
  end

  def self.load_data(service:, service_requirement_en:, service_requirement_el:)
    new({ service: service }.merge(service_requirement_params(service_requirement_en: service_requirement_en,
                                                              service_requirement_el: service_requirement_el)))
  end

  def retrieve_service(locale)
    Service.locale(locale).find_by(slug: service)
  end

  def self.service_requirement_params(service_requirement_en:, service_requirement_el:)
    { title_en: service_requirement_en.title,
      title_el: service_requirement_el.title }
  end

  private

  def update_service_requirement_en!
    ServiceRequirement.locale('en').find_by(slug: service).update!(title: title_en)
  end

  def update_service_requirement_el!
    ServiceRequirement.locale('el').find_by(slug: service).update!(title: title_el)
  end
end
