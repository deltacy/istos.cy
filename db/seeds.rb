# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
# Topics
#
topic_data = {
  benefits: {
    el: { name: 'Επιδόματα', description: 'Επιδόματα και οικονομική υποστήριξη' },
    en: { name: 'Benefits', description: 'Benefits and financial support' }
  },
  'births-deaths-marriage': {
    el: { name: 'Γεννήσεις, θανάτοι και γάμοι', description: 'Some description' },
    en: { name: 'Births, deaths and weddings', description: 'Some description' }
  },
  business: {
    el: { name: 'Επιχειρήσεις και αυτοεργοδοτούμενα άτομα', description: 'Εργαλία και καθοδήγηση για επιχειρήσεις' },
    en: { name: 'Businesses and self-employed', description: 'Tools for businesses' }
  },
  childcare: {
    el: { name: 'Παιδική μέριμνα και φροντίδα', description: 'description' },
    en: { name: 'Childcare', description: 'description' }
  },
  government: {
    el: { name: 'Κυπριακή υπηκοότητα και ζωή στην Κύπρο', description: 'Πληροφορίες για την ζωή στην Κύπρο' },
    en: { name: 'Cypriot citizenship and life in Cyprus', description: 'Information about Cyprus' }
  },
  justice: {
    el: { name: 'Δικαοσύνη και νομοθεσία', description: 'Νομοθεσία και δικαιοσύνη' },
    en: { name: 'Justice and law', description: 'justice and law' }
  },
  disabled: {
    el: { name: 'Άτομα με αναπηρίες', description: 'Περιλαμβάνει δικαιώματα, επιδόματα, φροντίδα' },
    en: { name: 'People with disabilities', description: 'Includes rights of disabled people' }
  },
  education: {
    el: { name: 'Εκπαίδευση και μάθηση', description: 'Χορηγίες, υποτροφίες, πιστοποιήσεις' },
    en: { name: 'Learning and education', description: 'Grants etc' }
  },
  transport: {
    el: { name: 'Οδήγηση και μεταφορά', description: 'Περιλαμβάνει άδεια κυκλοφορίας, MOT, άδεια οδήγησης' },
    en: { name: 'Driving and transport', description: 'Includes driving licence, MOT etc' }
  },
  employment: {
    el: { name: 'Εργοδότηση', description: 'Περιλαμβάνει μισθούς, δικαιώματα, συμβόλαιο, απολύσεις' },
    en: { name: 'Employment', description: 'Περιλαμβάνει μισθούς, δικαιώματα, συμβόλαιο, απολύσεις' }
  },
  environment: {
    el: { name: 'Περιβάλλον ', description: 'Περιλαμβάνει μισθούς, δικαιώματα, συμβόλαιο, απολύσεις' },
    en: { name: 'Environment ', description: 'Περιλαμβάνει μισθούς, δικαιώματα, συμβόλαιο, απολύσεις' }
  },
  'housing-local-services': {
    el: { name: 'Κατοικία και ενοικίαση', description: 'Υπηρεσίες για ιδιοκτήτες και ενοικιαστές σπιτιών' },
    en: { name: 'Hosing and rentals', description: 'Υπηρεσίες για ιδιοκτήτες και ενοικιαστές σπιτιών' }
  },
  'money-and-tax': {
    el: { name: 'Εισόδημα και φορολογία', description: 'Περιλαμβάνει φορολογία, κοινωνικές ασφαλίσεις, χρέη' },
    en: { name: 'Income and taxation', description: 'Περιλαμβάνει φορολογία, κοινωνικές ασφαλίσεις, χρέη' }
  }
}

topic_data.each_pair.map do |slug, data|
  data.each_pair do |locale, details|
    Topic.create!(locale: locale, slug: slug, name: details[:name], description: details[:description])
  end
end

subtopic_data = {
  transport: {
    'driving-licence': {
      el: { name: 'Άδεια οδήγησης', description: 'Πολλες πληροφορίες' },
      en: { name: 'Driving licence', description: 'Information related to driving licence' }
    }
  }
}

subtopic_data.each_pair.map do |topic_slug, data|
  data.each_pair do |slug, values|
    values.each_pair do |locale, details|
      topic = Topic.find_by(slug: topic_slug, locale: locale)
      Topic.create!(locale: locale, slug: slug, name: details[:name], description: details[:description], topic: topic)
    end
  end
end

service_data = {
  road_tax: {
    el: {
      name: 'Ανανέωση άδειας κυκλοφορίας',
      description: 'Ανανεώστε την άδειας κυκλοφορίας του οχήματος σας.',
      website: 'https://www.jccsmart.com/change-culture/el?returnUrl=%2Froad-transport-department%2F4888160%2F',
      information: 'Μεταβείτε στην ιστοσελίδα ηλεκτρονικών πληρωμών του Τμήματος Οδικών Μεταφορών και ανανεώστε την ' \
                   'άδεια κυκλοφορίας σας χρησιμοποιώντας την πιστωτική σας κάρτα.',
      topics: ['driving-licence']
    },
    en: {
      name: 'Road tax renewal',
      description: 'Tax your vehicle.',
      website: 'https://www.jccsmart.com/change-culture/en-GB?returnUrl=%2Froad-transport-department%2F4888160%2F',
      information: "Visit the Road Transport Department's payment website and renew your Road Tax Licence using a " \
                   ' credit card.',
      topics: ['driving-licence']
    }
  },
  'licence-renewal': {
    el: {
      name: 'Ανανέωση άδειας οδήγησης',
      description: 'Ανανεώστε την άδειας οδήγησης σας ή εκδώστε καινούρια σε περίπτωση κλοπής ή αλλίωσης.',
      website: 'http://www.mcw.gov.cy/mcw/RTD/rtd.nsf/All/9FE19D004055E3DDC22578240034D9B3?OpenDocument',
      information: 'Μεταβείτε στην ιστοσελίδα του Τμήματος Οδικών Μεταφορών όπου μπορείτε να βρείτε τα απαραίτητα ' \
                   'έντυπα που χρειάζεται να συμπληρώσετε για να πεανεκδόσετε την άδειας οδήγησης σας.',
      topics: ['driving-licence']
    },
    en: {
      name: 'Driving licence renewal',
      description: 'Renew your driving licence or issue a new one in case of theft or damanage.',
      website: 'http://www.mcw.gov.cy/mcw/RTD/rtd.nsf/All/9FE19D004055E3DDC22578240034D9B3?OpenDocument',
      information: "Visit the Road Transport Department's website where you can find the relevant documents that you " \
                   'need to submit in order to re-issue your driving licence.',
      topics: ['driving-licence']
    }
  }
}

service_data.each_pair do |slug, data|
  data.each_pair do |locale, details|
    topic_slugs = details[:topics]
    topics = topic_slugs.map { |topic_slug| Topic.find_by(slug: topic_slug, locale: locale) }
    Service.create!(locale: locale, slug: slug, name: details[:name], description: details[:description],
                    website: details[:website], information: details[:information], topic: topics.first)
  end
end
