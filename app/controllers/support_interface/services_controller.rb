module SupportInterface
  class ServicesController < ApplicationController
    def index
      @services = Service.locale(I18n.locale)
    end

    def new
      @service_form = ServiceForm.new
    end

    def create
      @service_form = ServiceForm.new(new_service_form_params)

      if @service_form.valid?(:new)
        @service_form.save!
        redirect_to support_interface_root_path, notice: t('.success')
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      service_en = Service.locale('en').find_by(slug: service_slug)
      service_el = Service.locale('el').find_by(slug: service_slug)
      @service_form = ServiceForm.load_data(slug: service_slug,
                                            topic: service_en&.topic&.slug,
                                            service_en: service_en,
                                            service_el: service_el)
    end

    def update
      @service_form = ServiceForm.new(service_form_params.merge(slug: service_slug))

      if @service_form.valid?
        @service_form.update!

        redirect_to support_interface_root_path, notice: t('.success')
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def service_slug
      params.require(:id)
    end

    def service_form_params
      params.require(:service_form).permit(*allowed_form_params)
    end

    def new_service_form_params
      params.require(:service_form).permit(:slug, *allowed_form_params)
    end

    def allowed_form_params
      %i[name_en description_en website_en information_en name_el description_el website_el information_el topic]
    end

    helper_method :available_topics

    def available_topics
      Topic.locale(I18n.locale).subtopics
    end
  end
end
