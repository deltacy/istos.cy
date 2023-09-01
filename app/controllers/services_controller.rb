class ServicesController < ApplicationController
  def show
    @service = Service.locale(I18n.locale).find_by(slug: service_id)

    respond_to do |format|
      format.html { redirect_to @service.website, allow_other_host: true unless show_information_page?(@service) }
      format.json { render json: @service }
    end
  end

  private

  def service_id
    params.permit(:id)[:id]
  end

  def show_information_page?(service)
    service.information.present? && redirect_param_set?
  end

  def redirect_param_set?
    !params['redirect'] || params['redirect'] != 'true'
  end
end
