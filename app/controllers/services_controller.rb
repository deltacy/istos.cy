class ServicesController < ApplicationController
  def show
    @service = Service.locale(I18n.locale).find_by(slug: service_id)

    redirect_to @service.website, allow_other_host: true
  end

  private

  def service_id
    params.permit(:id)[:id]
  end
end
