require 'rails_helper'

RSpec.describe ServiceAvailabilityCheckJob, type: :job do
  before do
    ActiveJob::Base.queue_adapter = :test
  end

  it 'enqueues the job' do
    expect { described_class.perform_later(:service) }.to have_enqueued_job
  end
end
