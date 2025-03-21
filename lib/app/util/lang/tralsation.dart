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
      'Montant': 'Montant',
      'Ajouter encore': 'Ajouter encore',
      'Total': 'Total',
      'Continuer': 'Continuer',
      'Annuler': 'Annuler',
      'Sélectionnez votre opérateur': 'Sélectionnez votre opérateur',
      'Retour': 'Retour',
      'Retrait via': 'Retrait via',
      'Confirmation': 'Confirmation',
      'Imprimer': 'Imprimer',
      'Terminer': 'Terminer',
      'Réessayer': 'Réessayer',
      'Envoyer sur': 'Envoyer sur',
      'Dépôt effectué avec succès': 'Dépôt effectué avec succès',
      'Impossible d’effectuer le dépôt': 'Impossible d’effectuer le dépôt',
      'Impossible d’effectuer le retrait': 'Impossible d’effectuer le retrait',
      'Retrait effectué avec succès': 'Retrait effectué avec succès',
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
      'Montant': 'Amount',
      'Ajouter encore': 'Add more',
      'Total': 'Total',
      'Continuer': 'Next',
      'Annuler': 'Cancel',
      'Sélectionnez votre opérateur': 'Select your operator',
      'Retour': 'Back',
      'Retrait via': 'Withdrawal via',
      'Confirmation': 'Confirmation',
      'Imprimer': 'Print',
      'Terminer': 'To end',
      'Réessayer': 'Try again',
      'Envoyer sur': 'Send to',
      'Dépôt effectué avec succès': 'Deposit successfully completed',
      'Impossible d’effectuer le dépôt': 'Unable to make deposit',
      'Impossible d’effectuer le retrait': 'Unable to make the withdrawal',
      'Retrait effectué avec succès': 'Withdrawal completed successfully',
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
