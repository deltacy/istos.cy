class CheckServicesAvailabilityJob < ApplicationJob
  queue_as :default

  def perform
    Service.all.each do |service|
      ServiceAvailabilityCheckJob.perform_later(service)
    end
  end
end
