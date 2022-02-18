require 'rails_helper'

RSpec.describe ServiceAvailability do
  let(:service) { create(:service) }

  let(:not_found_response) { instance_double(Net::HTTPFound, code: 404) }
  let(:redirect_response) { instance_double(Net::HTTPFound, code: 404) }

  it 'marks a services as not found if it returns a 404' do
    allow(Net::HTTP).to receive(:get_response).and_return(instance_double(Net::HTTPFound, code: 404))

    described_class.new(service).check

    expect(service.not_found?).to be true
  end

  it 'marks a services as tamporarily_unavailable if a request to it times out' do
    allow(Net::HTTP).to receive(:get_response).and_raise(Net::OpenTimeout)

    described_class.new(service).check

    expect(service.temporarily_unavailable?).to be true
  end

  it 'marks a services as ok if the response code is not 404 and it does not timeout' do
    allow(Net::HTTP).to receive(:get_response).and_return(instance_double(Net::HTTPFound, code: 302))

    described_class.new(service).check

    expect(service.ok?).to be true
  end
end
