# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
# Topics

benefits_el = Topic.create(locale: 'el', slug: 'benefits', name: 'Επιδόματα', description: 'Επιδόματα και οικονομική υποστήριξη')
benefits_en = Topic.create(locale: 'en', slug: 'benefits', name: 'Benefits', description: 'Benefits and financial support')

birthsanddeaths_el = Topic.create(locale: 'el', slug: 'births-deaths-marriage', name: 'Γεννήσεις, θανάτοι και γάμοι', description: 'Some description')
birthsanddeaths_en = Topic.create(locale: 'en', slug: 'births-deaths-marriage', name: 'Births, deaths and weddings', description: 'Some description')

business_el = Topic.create(locale: 'el', slug: 'business', name: 'Επιχειρήσεις και αυτοεργοδοτούμενα άτομα', description: 'Εργαλία και καθοδήγηση για επιχειρήσεις')
business_en = Topic.create(locale: 'en', slug: 'business', name: 'Businesses and self-employed', description: 'Tools for businesses')

childcare_el = Topic.create(locale: 'el', slug: 'childcare', name: 'Παιδική μέριμνα και φροντίδα', description: 'description')
childcare_en = Topic.create(locale: 'en', slug: 'childcare', name: 'Childcare', description: 'description')

citizenship_el = Topic.create(locale: 'el', slug: 'government', name: 'Κυπριακή υπηκοότητα και ζωή στην Κύπρο', description: 'Πληροφορίες για την ζωή στην Κύπρο')
citizenship_en = Topic.create(locale: 'en', slug: 'government', name: 'Cypriot citizenship and life in Cyprus', description: 'Information about Cyprus')

crime_el = Topic.create(locale: 'el', slug: 'justice', name: 'Δικαοσύνης και νομοθεσία', description: 'Νομοθεσία και δικαιοσύνη')
crime_en = Topic.create(locale: 'en', slug: 'justice', name: 'Justice and law', description: 'justice and law')

disabled_el = Topic.create(locale: 'el', slug: 'disabled', name: 'Άτομα με αναπηρίες', description: 'Περιλαμβάνει δικαιώματα, επιδόματα, φροντίδα')
disabled_en = Topic.create(locale: 'en', slug: 'disabled', name: 'People with disabilities', description: 'Includes rights of disabled people')

education_el = Topic.create(locale: 'el', slug: 'education', name: 'Εκπαίδευση και μάθηση',  description: 'Χορηγίες, υποτροφίες, πιστοποιήσεις')
education_en = Topic.create(locale: 'en', slug: 'education', name: 'Learning and education',  description: 'Grants etc')

transport_el = Topic.create(locale: 'el', slug: 'transport', name: 'Οδήγηση και μεταφορά', description: 'Περιλαμβάνει άδεια κυκλοφορίας, MOT, άδεια οδήγησης')
transport_en = Topic.create(locale: 'en', slug: 'transport', name: 'Driving and transport', description: 'Includes driving licence, MOT etc')

employment_el = Topic.create(locale: 'el', slug: 'employment', name: 'Εργοδότηση', description: 'Περιλαμβάνει μισθούς, δικαιώματα, συμβόλαιο, απολύσεις')
employment_en = Topic.create(locale: 'en', slug: 'employment', name: 'Employment', description: 'Περιλαμβάνει μισθούς, δικαιώματα, συμβόλαιο, απολύσεις')

environment_el = Topic.create(locale: 'el', slug: 'environment', name: 'Περιβάλλον ', description: 'Περιλαμβάνει μισθούς, δικαιώματα, συμβόλαιο, απολύσεις')
environment_en = Topic.create(locale: 'en', slug: 'environment', name: 'Environment ', description: 'Περιλαμβάνει μισθούς, δικαιώματα, συμβόλαιο, απολύσεις')

housing_el = Topic.create(locale: 'el', slug: 'housing-local-services', name: 'Κατοικία και ενοικίαση', description: 'Υπηρεσίες για ιδιοκτήτες και ενοικιαστές σπιτιών')
housing_en = Topic.create(locale: 'en', slug: 'housing-local-services', name: 'Hosing and rentals', description: 'Υπηρεσίες για ιδιοκτήτες και ενοικιαστές σπιτιών')

money_and_tax_el = Topic.create(locale: 'el', slug: 'money-and-tax', name: 'Εισόδημα και φορολογία', description: 'Περιλαμβάνει φορολογία, κοινωνικές ασφαλίσεις, χρέη')
money_and_tax_en = Topic.create(locale: 'en', slug: 'money-and-tax', name: 'Income and taxation', description: 'Περιλαμβάνει φορολογία, κοινωνικές ασφαλίσεις, χρέη')

subtopic_driving_licence_el = Topic.create(locale: 'el', slug: 'driving-licence', name: 'Άδεια οδήγησης', description: 'Πολλες πληροφορίες', topic: transport_el)
subtopic_driving_licence_en = Topic.create(locale: 'en', slug: 'driving-licence', name: 'Driving licence', description: 'Information related to driving licence', topic: transport_en)

service_renew_driving_licence_el_2 = Service.create!(locale: 'el', slug: 'road-tax', name: 'Ανανέωση άδειας κυκλοφορίας', description: 'Ανανεώστε την άδειας κυκλοφορίας του οχήματος σας.', website: 'https://www.jccsmart.com/change-culture/el?returnUrl=%2Froad-transport-department%2F4888160%2F', information: 'Μεταβείτε στην ιστοσελίδα ηλεκτρονικών πληρωμών του Τμήματος Οδικών Μεταφορών και ανανεώστε την άδεια κυκλοφορίας σας χρησιμοποιόντας την πιστωτική σας κάρτα.', topic: subtopic_driving_licence_el)

service_renew_driving_licence_en = Service.create!(locale: 'en', slug: 'road-tax', name: 'Road tax renewal', description: 'Tax your vehicle.', website: 'https://www.jccsmart.com/change-culture/en-GB?returnUrl=%2Froad-transport-department%2F4888160%2F', information: "Visit the Road Transport Department's payment website and renew your Road Tax Licence using a credit card.", topic: subtopic_driving_licence_en)
