require 'net/http'

class ServiceAvailability
  attr_reader :service, :uri

  def initialize(service)
    @service = service
    @uri = URI(service.website)
  end

  def check
    response = Net::HTTP.get_response(uri)
    return service.not_found! if response.code == 404

    service.ok!
  rescue Net::OpenTimeout
    service.temporarily_unavailable!
  end
end
