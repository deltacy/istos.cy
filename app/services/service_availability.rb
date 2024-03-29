require 'net/http'

class ServiceAvailability
  attr_reader :service, :uri

  def initialize(service)
    @service = service
    @uri = URI(service.website)
  end

  def check
    response = Net::HTTP.get_response(uri)
    return service.not_found! if [404, 500].include?(response.code.to_i)

    service.ok!
  rescue Net::OpenTimeout
    service.temporarily_unavailable!
  end
end
