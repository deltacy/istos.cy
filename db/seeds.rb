#
# Topic data
#
topic_data = {
  benefits: {
    el: { name: 'Επιδόματα', description: 'Επιδόματα και οικονομική υποστήριξη' },
    en: { name: 'Benefits', description: 'Benefits and financial support' }
  },
  'births-deaths-marriage': {
    el: { name: 'Γεννήσεις, θανάτοι και γάμοι', description: 'Εγγραφές και έκδοσεις πιστοποιητικών' },
    en: { name: 'Births, deaths and weddings', description: 'Registrations and issue certificates' }
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
    en: { name: 'Employment', description: 'Includes salary information, rights, contracts and being fired' }
  },
  environment: {
    el: { name: 'Περιβάλλον ', description: 'Περιλαμβάνει μισθούς, δικαιώματα, συμβόλαιο, απολύσεις' },
    en: { name: 'Environment ', description: 'Περιλαμβάνει μισθούς, δικαιώματα, συμβόλαιο, απολύσεις' }
  },
  'housing-local-services': {
    el: { name: 'Κατοικία και ενοικίαση', description: 'Υπηρεσίες για ιδιοκτήτες και ενοικιαστές σπιτιών' },
    en: { name: 'Hosting and rentals', description: 'Υπηρεσίες για ιδιοκτήτες και ενοικιαστές σπιτιών' }
  },
  'money-and-tax': {
    el: { name: 'Εισόδημα και φορολογία', description: 'Περιλαμβάνει φορολογία, κοινωνικές ασφαλίσεις, χρέη' },
    en: { name: 'Income and taxation', description: 'Περιλαμβάνει φορολογία, κοινωνικές ασφαλίσεις, χρέη' }
  },
  grants: {
    el: { name: 'Χορηγίες', description: 'Χορηγίες' },
    en: { name: 'Grants', description: 'Grants' }
  }
}

topic_data.each_pair.map do |slug, data|
  data.each_pair do |locale, details|
    Topic.create!(locale: locale, slug: slug, name: details[:name], description: details[:description])
  end
end

#
# Subtopic data
#

subtopic_data = {
  transport: {
    'driving-licence': {
      el: { name: 'Άδεια οδήγησης', description: 'Πολλες πληροφορίες' },
      en: { name: 'Driving licence', description: 'Information related to driving licences' }
    }
  },
  benefits: {
    'help-for-families': {
      el: { name: 'Οικονομική υποστήριξη οικογενειών',
            description: 'Οικονομική βοήθεια για οικογένειες και άτομα που προσέχουν παιδιά' },
      en: { name: 'Financial support for families',
            description: 'Help if you are looking after children or plan to have or adopt a child' }
    }
  },
  'births-deaths-marriage': {
    registry: {
      el: { name: 'Πιστοποιητικά, αλλαγή ονόματος ή φύλου.',
            description: 'Έκδοση πιστοποιητικών γέννησης και γάμου, δήλωση θανάτου, αλλαγή ονόματος, αλλαγές σε επίσημα έγγραφα λόγω αλλαγής φύλου.' },
      en: { name: 'Certificates, changes of name or gender',
            description: 'Birth certificates, registering a birth, death or marriage and correcting certificates' }
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

#
# Service data
#

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
  },
  'child-benefit': {
    el: {
      name: 'Επίδομα τέκνου',
      description: '',
      website: 'https://eforms.eservices.cyprus.gov.cy/mlsi/ApplicationSubmission/SUBMENUINDEX',
      information:
      "
Δικαίωμα για επίδομα τέκνου έχει η οικογένεια της οποίας το ετήσιο ακαθάριστο οικογενειακό εισόδημα για το προηγούμενο έτος δεν υπερβαίνει τις:

- €49.000 για οικογένειες με ένα (1) εξαρτώμενο τέκνο,
- €59.000 για οικογένειες με δύο (2) εξαρτώμενα τέκνα,
- €59.000 αυξανόμενες κατά €5.000 για κάθε εξαρτώμενο τέκνο για οικογένειες με περισσότερα από δύο (2) εξαρτώμενα τέκνα.

Δικαίωμα σε επίδομα μονογονεϊκής οικογένειας έχει οικογένεια της οποίας το ετήσιο ακαθάριστο οικογενειακό εισόδημα της για το προηγούμενο έτος δεν υπερβαίνει τις €49.000.
      ",
      topics: ['help-for-families']
    },
    en: {
      name: 'Child benefit',
      description: '',
      website: 'https://eforms.eservices.cyprus.gov.cy/mlsi/ApplicationSubmission/SUBMENUINDEX',
      information:
      "
In order to apply for child benefit, the family's gross income for the previous financial year must not exceed:

- €49.000 for one dependant child,
- €59.000 for two dependant children,
- €59.000 with a €5.000 for every dependant child for families with more than two children

Single parent families have the right to apply if their gross income for the previous financial year does not exceed €49.000.
      ",
      topics: ['help-for-families']
    }
  },
  'childbirth-grant': {
    el: {
      name: 'Επίδομα τοκετού',
      description: '',
      website: 'http://www.mlsi.gov.cy/mlsi/sid/sidv2.nsf/All/B85AA4D88E3630B4C2257B18003B2C9D/$file/%CE%A5%CE%9A%CE%91%203%20-%20006%20%CE%91%CE%99%CE%A4%CE%97%CE%A3%CE%97%20%CE%93%CE%99%CE%91%20%CE%92%CE%9F%CE%97%CE%98%CE%97%CE%9C%CE%91%20%CE%A4%CE%9F%CE%9A%CE%95%CE%A4%CE%9F%CE%A5.pdf',
      information:
      "
Η μητέρα λαμβάνει εφάπαξ ποσό ύψους €573,96 ανά τέκνο (για το έτος 2021), εάν η ίδια ή ο σύζυγός της είναι ασφαλισμένοι, για τη γέννηση ζωντανού παιδιού ή σε περίπτωση θνησιγένειας κατόπιν κύησης διάρκειας τουλάχιστον 28 εβδομάδων.

Για τη χορήγηση του βοηθήματος τοκετού θα πρέπει να υποβληθεί αίτηση, η οποία να συνοδεύεται με τα απαραίτητα πιστοποιητικά εντός ενός (1) έτους από τη γέννηση, ενώ για τη χορήγηση του επιδόματος μητρότητας η αίτηση και τα απαραίτητα πιστοποιητικά θα πρέπει να υποβληθούν μετά το τέλος της 25ης εβδομάδας κύησης και εντός 21 ημερών από την ημερομηνία για την οποία απαιτείται η καταβολή του επιδόματος.
      ",
      topics: ['help-for-families']
    },
    en: {
      name: 'Childbirth grant',
      description: '',
      website: 'http://www.mlsi.gov.cy/mlsi/sid/sidv2.nsf/All/B85AA4D88E3630B4C2257B18003B2C9D/$file/%CE%A5%CE%9A%CE%91%203%20-%20006%20%CE%91%CE%99%CE%A4%CE%97%CE%A3%CE%97%20%CE%93%CE%99%CE%91%20%CE%92%CE%9F%CE%97%CE%98%CE%97%CE%9C%CE%91%20%CE%A4%CE%9F%CE%9A%CE%95%CE%A4%CE%9F%CE%A5.pdf',
      information:
      "
A lump sum of €573.96 per child (for the year 2021) is paid to the mother if she or her husband are insured for the birth of a live child or a stillbirth after a pregnancy of at least 28 weeks.

To be awarded the childbirth grant, an application form has to be submitted accompanied by the required certificates within one (1) year of the birth, whereas the maternity allowance to be granted the application form and the required certificates may be submitted after the end of the 25th week of pregnancy and must be submitted within 21 days from the day on which the benefit is required.
      ",
      topics: ['help-for-families']
    }
  },
  'maternity-pay': {
    el: {
      name: 'Επίδομα μητρότητας',
      description: '',
      website: 'http://www.mlsi.gov.cy/mlsi/sid/sidv2.nsf/All/376ED526792B2965C2257A0900379BF6/$file/%CE%A5%CE%9A%CE%91%203-007%20%CE%91%CE%99%CE%A4%CE%97%CE%A3%CE%97%20%CE%93%CE%99%CE%91%20%CE%95%CE%A0%CE%99%CE%94%CE%9F%CE%9C%CE%91%20%CE%9C%CE%97%CE%A4%CE%A1%CE%9F%CE%A4%CE%97%CE%A4%CE%91%CE%A3.pdf',
      information:
      "
Το επίδομα μητρότητας καταβάλλεται στις βιολογικές μητέρες για χρονικό διάστημα 18 εβδομάδων, αρχής γενομένης μεταξύ της ένατης και της δεύτερης εβδομάδας πριν την εβδομάδα του αναμενόμενου τοκετού.

Εάν το βρέφος χρειαστεί να νοσηλευτεί σε θερμοκοιτίδα λόγω πρόωρου τοκετού ή να λάβει αγωγή εξαιτίας άλλου προβλήματος υγείας, το επίδομα μητρότητας μπορεί να λάβει παράταση μιας εβδομάδας για κάθε 21 ημέρες νοσηλείας που δεν θα υπερβαίνει τη μέγιστη περίοδο των 6 εβδομάδων.

Οι θετές μητέρες λαμβάνουν το επίδομα για 16 εβδομάδες από την εβδομάδα που έγινε η υιοθεσία, εάν το παιδί είναι κάτω των 12 ετών.

Οι παρένθετες μητέρες λαμβάνουν το επίδομα για 14 εβδομάδες, αρχής γενομένης 2 εβδομάδες πριν από την εβδομάδα του αναμενόμενου τοκετού. Σε περίπτωση απόκτησης παιδιού μέσω παρένθετης μητέρας, το επίδομα καταβάλλεται για 18 εβδομάδες, αρχής γενομένης 2 εβδομάδες πριν από την εβδομάδα του αναμενόμενου τοκετού ή από την εβδομάδα του πραγματικού τοκετού, ανάλογα με την επιλογή της αιτήτριας.
      ",
      topics: ['help-for-families']
    },
    en: {
      name: 'Maternity pay',
      description: '',
      website: 'http://www.mlsi.gov.cy/mlsi/sid/sidv2.nsf/All/376ED526792B2965C2257A0900379BF6/$file/%CE%A5%CE%9A%CE%91%203-007%20%CE%91%CE%99%CE%A4%CE%97%CE%A3%CE%97%20%CE%93%CE%99%CE%91%20%CE%95%CE%A0%CE%99%CE%94%CE%9F%CE%9C%CE%91%20%CE%9C%CE%97%CE%A4%CE%A1%CE%9F%CE%A4%CE%97%CE%A4%CE%91%CE%A3.pdf',
      information:
      "
Maternity allowance is paid for a period of 18 weeks starting between the ninth and second weeks before the week of the expected birth.

If the infant is treated in an incubator because of premature birth or receives treatment because of another health problem, the maternity benefit may be extended by an additional week for each 21 days of treatment for a maximum of 6 weeks.

Adoptive mothers receive the allowance for 16 weeks from the week of the adoption if the child is less than 12 years old.

Surrogate mothers receive the allowance for 14 weeks starting two weeks before the expected week of confinement. In the case of getting a child through surrogacy, the benefit is paid for a period of 18 weeks starting 2 weeks before the expected week of confinement or from the week of the real confinement, according to the choice of the claimant.
      ",
      topics: ['help-for-families']
    }
  },
  'paternity-pay': {
    el: {
      name: 'Επίδομα πατρότητας',
      description: 'Επίδομα που παρέχεται σε βιολογικούς και θετούς πατεράδες. ',
      website: 'http://www.mlsi.gov.cy/mlsi/sid/sidv2.nsf/All/2EEEB0D5888D00F1C225816E00435737/$file/%CE%A5%CE%9A%CE%91%203%20-%20009%20%CE%91%CE%99%CE%A4%CE%97%CE%A3%CE%97%20%CE%93%CE%99%CE%91%20%CE%95%CE%A0%CE%99%CE%94%CE%9F%CE%9C%CE%91%20%CE%A0%CE%91%CE%A4%CE%A1%CE%9F%CE%A4%CE%97%CE%A4%CE%91%CE%A3.pdf',
      information:
      "
Το επίδομα πατρότητας καταβάλλεται στους πατέρες για δύο συνεχείς εβδομάδες, είτε από την εβδομάδα του τοκετού και για τις επόμενες 16 εβδομάδες ή μεταξύ της εβδομάδας του τοκετού και της ολοκλήρωσης της άδειας μητρότητας σε περίπτωση πολλαπλού τοκετού.

Οι θετοί πατέρες λαμβάνουν το επίδομα για περίοδο δύο συνεχών εβδομάδων μεταξύ της εβδομάδας της υιοθεσίας και των επόμενων 16 εβδομάδων.
      ",
      topics: ['help-for-families']
    },
    en: {
      name: 'Paternity pay',
      description: '',
      website: 'http://www.mlsi.gov.cy/mlsi/sid/sidv2.nsf/All/2EEEB0D5888D00F1C225816E00435737/$file/%CE%A5%CE%9A%CE%91%203%20-%20009%20%CE%91%CE%99%CE%A4%CE%97%CE%A3%CE%97%20%CE%93%CE%99%CE%91%20%CE%95%CE%A0%CE%99%CE%94%CE%9F%CE%9C%CE%91%20%CE%A0%CE%91%CE%A4%CE%A1%CE%9F%CE%A4%CE%97%CE%A4%CE%91%CE%A3.pdf',
      information:
      "
Paternity allowance is paid to fathers for a period of two consecutive weeks between the week of child birth and the following 16 weeks or between the week of child birth and the termination of maternity leave in case of multiple birth.

Adoptive fathers receive the allowance for a period of two consecutive weeks between the week of adoption and the following 16 weeks.
      ",
      topics: ['help-for-families']
    }
  },
  'birth-certificate': {
    el: {
      name: 'Εγγραφή γέννησης',
      description: 'Πληροφορίες για την διαδικασία εγγραφής και έκδοσης πιστοποιητικού γέννησης',
      website: 'http://www.moi.gov.cy/moi/crmd/crmd.nsf/All/35C87314AE1A1FBAC2257D1E001D7AB2?OpenDocument',
      information:
      "
Τα πιστοποιητικά γεννήσεως εκδίδονται από όλες τις Επαρχιακές Διοικήσεις. Το έντυπο αίτησης για την εγγραφή του νεογέννητου παιδιού, αφού συμπληρωθεί και υπογραφεί κατάλληλα από τον Ιατρό που διενήργησε τον τοκετό, το ένα αντίγραφο της αίτησης παραμένει στα αρχεία του νοσοκομείου/κλινικής, όπου γεννήθηκε το παιδί, το δεύτερο αντίγραφο αποστέλλεται από το νοσοκομείο/κλινική απευθείας στην οικεία Επαρχιακή Διοίκηση και το τρίτο αντίγραφο δίνεται στους γονείς του παιδιού, για να το υποβάλουν με τη σειρά τους στην οικεία Επαρχιακή Διοίκηση για εγγραφή του νεογέννητου στο ληξιαρχείο γεννήσεων. Η εγγραφή του παιδιού μπορεί να διενεργείται σε οποιοδήποτε Γραφείο της Επαρχιακής Διοίκησης ανεξάρτητα από τον τόπο γέννησης του παιδιού.

Η έκδοση πιστοποιητικού γέννησης είναι δυνατή μόνο αν τα στοιχεία του πολίτη είναι καταχωρημένα στο Σύστημα Αρχείου Πληθυσμού.

Υπάρχει καταβαλλόμενο τέλος για κάθε πιστοποιητικό, νοουμένου φυσικά ότι η γέννηση έχει καταχωρηθεί εντός της χρονικής διάρκειας που καθορίζεται από το Νόμο (εντός 15 ημερών).
Καταβαλλόμενο τέλος 5 ευρώ για κάθε πιστοποιητικό

Καθυστερημένες εγγραφές γεννήσεων

Για τις περιπτώσεις εγγραφών γεννήσεων μετά την εκπνοή της περιόδου των τριών μηνών από την γέννηση, όπως αυτό καθορίζεται από τον νόμο, χρειάζονται τα πιο κάτω:

- Ένορκη δήλωση σε καθορισμένο έντυπο
- Έντυπο εγγραφής γεννήσεως συμπληρωμένο
- Επιβαρυντικό Τέλος : €60
      ",
      topics: ['registry']
    },
    en: {
      name: 'Register a birth',
      description: 'Information on registering a birth and issuing a birth certificate',
      website: 'http://www.moi.gov.cy/MOI/CRMD/crmd.nsf/All/239441159081A5CCC2257D1E00248A00?OpenDocument',
      information:
      "
Birth certificates are issued at all the District Administration Offices. In order to register the new-born child in the Birth Register, the application form should be completed and signed by the Doctor who delivered the child and a copy is kept at the hospital’s/clinic’s records, another copy is sent to the Competent District Administration Office by the hospital/clinic and a third copy is given to the child’s parents, in order for them to submit it to the Competent District Administration Office. The registration of the child can take place in any District Administration Office, independently from the child’s birth place.

Birth certificates can be issued if the citizen’s relevant details are registered in the Civil Registration System.

The payable fee for each certificate is 5 EUR , provided that the birth has been registered within the time period determined by the Law (within 15 days).

In the case of records of births after the expiry of three months from birth, as defined by law, require the following:

* Affidavit in the prescribed form
* Birth registration form filled
* Fee 60 EUR
      ",
      topics: ['registry']
    }
  }
}

#  Template
#
#  'service-slug': {
#    el: {
#      name: '',
#      description: '',
#      website: '',
#      information:
#      "
#
#      ",
#      topics: ['topic-slug']
#    },
#    en: {
#      name: '',
#      description: '',
#      website: '',
#      information:
#      "
#
#      ",
#      topics: ['topic-slug']
#    }
#  }

service_data.each_pair do |slug, data|
  data.each_pair do |locale, details|
    topic_slugs = details[:topics]
    topics = topic_slugs.map { |topic_slug| Topic.find_by(slug: topic_slug, locale: locale) }
    Service.create!(locale: locale, slug: slug, name: details[:name], description: details[:description],
                    website: details[:website], information: details[:information], topic: topics.first)
  end
end
