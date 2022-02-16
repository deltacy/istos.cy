require 'rails_helper'

RSpec.describe Topic, type: :model do
  subject { described_class.new }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:locale) }

  context 'scopes' do
    describe 'locale' do
      it 'filters the services by locale' do
        en_services = create_list(:topic, 4, locale: 'en')
        el_services = create_list(:topic, 3, locale: 'el')

        expect(described_class.locale('en')).to contain_exactly(*en_services)
        expect(described_class.locale('el')).to contain_exactly(*el_services)
      end
    end
  end

  it 'can have a subtopic' do
    subtopic = create(:topic, name: 'a subtopic')
    topic = create(:topic, topic: subtopic)

    expect(topic.topic).to eq(subtopic)
  end
end
