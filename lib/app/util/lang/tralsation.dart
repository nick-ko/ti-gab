class AppLocalizations {
  static String language = 'fr'; // Langue par défaut

  static final Map<String, Map<String, String>> _localizedValues = {
    'fr': {
      'dépôt': 'dépôt',
      'retrait': 'retrait',
      'Quelle opération souhaitez-vous effectuer ?':
          'Quelle opération souhaitez-vous effectuer ?',
      'Veuillez insérer les billets dans le bocal à billets':
          'Veuillez insérer les billets dans le bocal à billets',
      'Vous ne pouvez que 40 billets maximum':
          'Vous ne pouvez que 40 billets maximum',
      'Montant total:': 'Montant total:',
      'Ajouter encore': 'Ajouter encore',
      'Total': 'Total',
      'Continuer': 'Continuer',
      'Annuler': 'Annuler',
      'Sélectionnez votre opérateur': 'Sélectionnez votre opérateur',
    },
    'en': {
      'dépôt': 'cash deposit',
      'retrait': 'cash withdrawal',
      'Quelle opération souhaitez-vous effectuer ?':
          'What operation do you want to perform?',
      'Veuillez insérer les billets dans le bocal à billets':
          'Please insert the money bills into the ticket jar',
      'Vous ne pouvez que 40 billets maximum':
          'You can only have a maximum of 40 money bills',
      'Montant total:': 'Total amount:',
      'Ajouter encore': 'Add more',
      'Total': 'Total',
      'Continuer': 'Next',
      'Annuler': 'Cancel',
      'Sélectionnez votre opérateur': 'Select your operator',
    },
  };

  // Fonction pour récupérer la traduction
  static String translate(String key) {
    return _localizedValues[language]?[key] ?? key;
  }

  // Changer la langue
  static void changeLanguage(String newLanguage) {
    if (_localizedValues.containsKey(newLanguage)) {
      language = newLanguage;
    }
  }

  // Fonction pour mettre la première lettre en majuscule
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
