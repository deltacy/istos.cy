class ServiceAvailabilityCheckJob < ApplicationJob
  queue_as :default

  def perform(service)
    ServiceAvailability.new(service).check
  end
end
