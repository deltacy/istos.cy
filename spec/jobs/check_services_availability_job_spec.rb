require 'rails_helper'

RSpec.describe CheckServicesAvailabilityJob, type: :job do
  before do
    ActiveJob::Base.queue_adapter = :test
  end

  it 'enqueues the job' do
    expect { described_class.perform_later }.to have_enqueued_job
  end
end
