abstract class StringValues {
  static final Map<String, Map<String, Map>> values = const {
    'en': {
      'login': {
        'username': 'User name',
        'password': 'Password',
        'login': 'Login',
        'incorrect data': 'Incorrect data provided',
        'error': 'Error',
        'unknown error': 'unknown error',
      },
      'dashboard': {
        'calendar': 'Calendar',
        'task': 'Task',
        'company': 'Company',
        'contact': 'Contact',
      }
    },
    'rs': {
      'login': {
        'username': 'Korisničko ime',
        'password': 'Šifra',
        'login': 'Prijava',
        'incorrect data': 'Krivi podaci',
        'error': 'Greška',
        'unknown error': 'Nepoznata greška',
      },
      'dashboard': {
        'calendar': 'Kalendar',
        'task': 'Planer',
        'company': 'Firma',
        'contact': 'Kontakti',
      }
    },
  };
}
