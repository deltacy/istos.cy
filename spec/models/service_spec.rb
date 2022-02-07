require 'rails_helper'

RSpec.describe Service, type: :model do
  subject { described_class.new }

  it { is_expected.to validate_presence_of(:locale) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:website) }
end
