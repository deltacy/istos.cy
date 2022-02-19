require 'rails_helper'

RSpec.describe Service, type: :model do
  subject { described_class.new }

  it { is_expected.to validate_presence_of(:locale) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:website) }

  context 'scopes' do
    describe 'locale' do
      it 'filters the services by locale' do
        en_services = create_list(:service, 4, locale: 'en')
        el_services = create_list(:service, 3, locale: 'el')

        expect(described_class.locale('en')).to contain_exactly(*en_services)
        expect(described_class.locale('el')).to contain_exactly(*el_services)
      end
    end

    describe 'by_name' do
      it 'filters the services by name' do
        services = [create(:service, name: 'Health provider'),
                    create(:service, name: 'Health board')]
        build(:service, name: 'Another provider')

        expect(described_class.by_name('ealt')).to contain_exactly(*services)
      end
    end

    describe 'by_description' do
      it 'filters the services by description' do
        services = [create(:service, description: 'Childcare and benefits'),
                    create(:service, description: 'Registering the birth of a child'),
                    create(:service, description: 'The children are in school')]

        build(:service, description: 'Driving and transport')

        expect(described_class.by_description('child')).to contain_exactly(*services)
      end
    end

    describe 'results' do
      it 'filters the services by name or description' do
        services = [create(:service, name: 'Child benefits', description: 'A services description'),
                    create(:service, name: 'Register a birth', description: 'Registering the birth of a child'),
                    create(:service, name: 'Something else', description: 'The children are in school')]

        build(:service, name: 'Public transport', description: 'Buses and trains')

        expect(described_class.results('child')).to contain_exactly(*services)
      end
    end

    describe 'localised_results' do
      it 'returns localised results if there is a match in any language' do
        create(:service, locale: 'en', slug: 'register-birth', name: 'Register a birth')
        create(:service, locale: 'el', slug: 'register-birth', name: 'Εγγραφή τέκνου')
        create(:service, locale: 'en', slug: 'child-benefit', name: 'Child benefits')
        child_benefit_el = create(:service, locale: 'el', slug: 'child-benefit', name: 'Επίδομα τέκνου')

        expect(described_class.localised_results('child', 'el')).to contain_exactly(child_benefit_el)
      end
    end
  end
end
