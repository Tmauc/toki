// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get conversationTab => 'Conversation';

  @override
  String get transcriptTab => 'Transcription';

  @override
  String get actionItemsTab => 'Actions à faire';

  @override
  String get deleteConversationTitle => 'Supprimer la conversation ?';

  @override
  String get deleteConversationMessage =>
      'Cela supprimera également les souvenirs, tâches et fichiers audio associés. Cette action est irréversible.';

  @override
  String get confirm => 'Confirmer';

  @override
  String get cancel => 'Annuler';

  @override
  String get ok => 'OK';

  @override
  String get delete => 'Supprimer';

  @override
  String get add => 'Ajouter';

  @override
  String get update => 'Mettre à jour';

  @override
  String get save => 'Enregistrer';

  @override
  String get edit => 'Modifier';

  @override
  String get close => 'Fermer';

  @override
  String get clear => 'Effacer';

  @override
  String get copyTranscript => 'Copier la transcription';

  @override
  String get copySummary => 'Copier le résumé';

  @override
  String get testPrompt => 'Tester le prompt';

  @override
  String get reprocessConversation => 'Retraiter la conversation';

  @override
  String get deleteConversation => 'Supprimer la conversation';

  @override
  String get contentCopied => 'Contenu copié dans le presse-papiers';

  @override
  String get failedToUpdateStarred =>
      'Échec de la mise à jour du statut favori.';

  @override
  String get conversationUrlNotShared =>
      'L\'URL de la conversation n\'a pas pu être partagée.';

  @override
  String get errorProcessingConversation =>
      'Erreur lors du traitement de la conversation. Veuillez réessayer plus tard.';

  @override
  String get noInternetConnection => 'Aucune connexion Internet';

  @override
  String get unableToDeleteConversation =>
      'Impossible de supprimer la conversation';

  @override
  String get somethingWentWrong =>
      'Une erreur s\'est produite ! Veuillez réessayer plus tard.';

  @override
  String get copyErrorMessage => 'Copier le message d\'erreur';

  @override
  String get errorCopied => 'Message d\'erreur copié dans le presse-papiers';

  @override
  String get remaining => 'Restant';

  @override
  String get loading => 'Chargement...';

  @override
  String get loadingDuration => 'Chargement de la durée...';

  @override
  String get people => 'Personnes';

  @override
  String get addNewPerson => 'Ajouter une nouvelle personne';

  @override
  String get editPerson => 'Modifier la personne';

  @override
  String get createPersonHint =>
      'Créez une nouvelle personne et entraînez Toki à reconnaître sa voix aussi !';

  @override
  String get speechProfile => 'Profil Vocal';

  @override
  String sampleNumber(int number) {
    return 'Échantillon $number';
  }

  @override
  String get settings => 'Paramètres';

  @override
  String get language => 'Langue';

  @override
  String get selectLanguage => 'Sélectionner la langue';

  @override
  String get deleting => 'Suppression...';

  @override
  String get importStarted =>
      'Importation démarrée ! Vous serez notifié une fois terminée.';

  @override
  String get failedToStartImport =>
      'Échec du démarrage de l\'importation. Veuillez réessayer.';

  @override
  String get couldNotAccessFile =>
      'Impossible d\'accéder au fichier sélectionné';

  @override
  String get askOmi => 'Demander à Toki';

  @override
  String get done => 'Terminé';

  @override
  String get disconnected => 'Déconnecté';

  @override
  String get searching => 'Recherche en cours...';

  @override
  String get connectDevice => 'Connecter l\'appareil';

  @override
  String get allCaughtUp => 'Tout est à jour';

  @override
  String get sync => 'Synchroniser';

  @override
  String get noConversationsYet => 'Pas encore de conversations';

  @override
  String get noStarredConversations => 'Aucune conversation favorite';

  @override
  String get starConversationHint =>
      'Pour marquer une conversation comme favorite, ouvrez-la et appuyez sur l\'icône étoile dans l\'en-tête.';

  @override
  String get searchConversations => 'Rechercher des conversations...';

  @override
  String selectedCount(int count, Object s) {
    return '$count sélectionné(s)';
  }

  @override
  String get merge => 'Fusionner';

  @override
  String get mergeConversations => 'Fusionner les conversations';

  @override
  String mergeConversationsMessage(int count) {
    return 'Cela combinera $count conversations en une seule. Tout le contenu sera fusionné et régénéré.';
  }

  @override
  String get mergingInBackground =>
      'Fusion en cours en arrière-plan. Cela peut prendre un moment.';

  @override
  String get failedToStartMerge => 'Échec du démarrage de la fusion';

  @override
  String get askAnything => 'Demandez n\'importe quoi';

  @override
  String get noMessagesYet =>
      'Pas encore de messages !\nPourquoi ne pas commencer une conversation ?';

  @override
  String get deletingMessages =>
      'Suppression de vos messages de la mémoire d\'Toki...';

  @override
  String get messageCopied => '✨ Message copié dans le presse-papiers';

  @override
  String get clearChat => 'Effacer la conversation';

  @override
  String get clearChatConfirm =>
      'Êtes-vous sûr de vouloir effacer la discussion ? Cette action est irréversible.';

  @override
  String get maxFilesLimit =>
      'Vous ne pouvez télécharger que 4 fichiers à la fois';

  @override
  String get apps => 'Applications';

  @override
  String get aboutOmi => 'À propos d\'Toki';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get visitWebsite => 'Visiter le site web';

  @override
  String get helpOrInquiries => 'Aide ou questions ?';

  @override
  String get joinCommunity => 'Rejoignez la communauté !';

  @override
  String get membersAndCounting => '8000+ membres et ça continue.';

  @override
  String get deleteAccountTitle => 'Supprimer le compte';

  @override
  String get deleteAccountConfirm =>
      'Êtes-vous sûr de vouloir supprimer votre compte ?';

  @override
  String get cannotBeUndone => 'Cette action est irréversible.';

  @override
  String get allDataErased =>
      'Toutes vos mémoires et conversations seront définitivement effacées.';

  @override
  String get appsDisconnected =>
      'Vos applications et intégrations seront déconnectées immédiatement.';

  @override
  String get exportBeforeDelete =>
      'Vous pouvez exporter vos données avant de supprimer votre compte, mais une fois supprimé, il ne pourra pas être récupéré.';

  @override
  String get deleteAccountCheckbox =>
      'Je comprends que la suppression de mon compte est permanente et que toutes les données, y compris les mémoires et conversations, seront perdues et ne pourront pas être récupérées.';

  @override
  String get areYouSure => 'Êtes-vous sûr ?';

  @override
  String get deleteAccountFinal =>
      'Cette action est irréversible et supprimera définitivement votre compte et toutes les données associées. Êtes-vous sûr de vouloir continuer ?';

  @override
  String get deleteNow => 'Supprimer maintenant';

  @override
  String get goBack => 'Retour';

  @override
  String get checkBoxToConfirm =>
      'Cochez la case pour confirmer que vous comprenez que la suppression de votre compte est permanente et irréversible.';

  @override
  String get profile => 'Profil';

  @override
  String get name => 'Nom';

  @override
  String get email => 'E-mail';

  @override
  String get customVocabulary => 'Vocabulaire Personnalisé';

  @override
  String get identifyingOthers => 'Identification des Autres';

  @override
  String get conversationDisplay => 'Affichage des Conversations';

  @override
  String get dataPrivacy => 'Confidentialité des Données';

  @override
  String get userId => 'ID Utilisateur';

  @override
  String get notSet => 'Non défini';

  @override
  String get userIdCopied => 'ID utilisateur copié dans le presse-papiers';

  @override
  String get systemDefault => 'Par défaut du système';

  @override
  String get offlineSync => 'Synchronisation hors ligne';

  @override
  String get deviceSettings => 'Paramètres de l\'appareil';

  @override
  String get integrations => 'Intégrations';

  @override
  String get developerSettings => 'Paramètres développeur';

  @override
  String get signOut => 'Se Déconnecter';

  @override
  String get appAndDeviceCopied =>
      'Détails de l\'application et de l\'appareil copiés';

  @override
  String get wrapped2025 => 'Rétrospective 2025';

  @override
  String get yourPrivacyYourControl => 'Votre vie privée, votre contrôle';

  @override
  String get privacyIntro =>
      'Chez Toki, nous nous engageons à protéger votre vie privée. Cette page vous permet de contrôler la façon dont vos données sont stockées et utilisées.';

  @override
  String get dataProtectionLevel => 'Niveau de protection des données';

  @override
  String get dataProtectionDesc =>
      'Vos données sont sécurisées par défaut avec un cryptage fort. Vérifiez vos paramètres et les futures options de confidentialité ci-dessous.';

  @override
  String get deviceName => 'Nom de l\'appareil';

  @override
  String get deviceId => 'ID de l\'appareil';

  @override
  String get firmware => 'Micrologiciel';

  @override
  String get sdCardSync => 'Synchronisation de la carte SD';

  @override
  String get hardwareRevision => 'Révision matérielle';

  @override
  String get modelNumber => 'Numéro de modèle';

  @override
  String get manufacturer => 'Fabricant';

  @override
  String get doubleTap => 'Double appui';

  @override
  String get ledBrightness => 'Luminosité LED';

  @override
  String get micGain => 'Gain du micro';

  @override
  String get disconnect => 'Déconnecter';

  @override
  String get chargingIssues => 'Problèmes de charge';

  @override
  String get disconnectDevice => 'Déconnecter l\'appareil';

  @override
  String get unpairDevice => 'Dissocier l\'appareil';

  @override
  String get unpairAndForget => 'Dissocier et oublier l\'appareil';

  @override
  String get deviceDisconnectedMessage => 'Votre Toki a été déconnecté 😔';

  @override
  String get deviceUnpairedMessage =>
      'Appareil dissocié. Allez dans Paramètres > Bluetooth et oubliez l\'appareil pour terminer la dissociation.';

  @override
  String get unpairDialogTitle => 'Dissocier l\'appareil';

  @override
  String get unpairDialogMessage =>
      'Cela dissociera l\'appareil afin qu\'il puisse être connecté à un autre téléphone. Vous devrez aller dans Réglages > Bluetooth et oublier l\'appareil pour terminer le processus.';

  @override
  String get deviceNotConnected => 'Appareil non connecté';

  @override
  String get connectDeviceMessage =>
      'Connectez votre appareil Toki pour accéder aux\nparamètres et à la personnalisation de l\'appareil';

  @override
  String get deviceInfoSection => 'Informations sur l\'appareil';

  @override
  String get customizationSection => 'Personnalisation';

  @override
  String get hardwareSection => 'Matériel';

  @override
  String get v2Undetected => 'V2 non détecté';

  @override
  String get v2UndetectedMessage =>
      'Nous voyons que vous avez soit un appareil V1, soit votre appareil n\'est pas connecté. La fonctionnalité carte SD n\'est disponible que pour les appareils V2.';

  @override
  String get endConversation => 'Terminer la conversation';

  @override
  String get pauseResume => 'Pause/Reprendre';

  @override
  String get starConversation => 'Marquer la conversation comme favorite';

  @override
  String get doubleTapAction => 'Action double appui';

  @override
  String get endAndProcess => 'Terminer et traiter la conversation';

  @override
  String get pauseResumeRecording => 'Pause/Reprendre l\'enregistrement';

  @override
  String get starOngoing => 'Marquer la conversation en cours comme favorite';

  @override
  String get off => 'Désactivé';

  @override
  String get max => 'Max';

  @override
  String get mute => 'Muet';

  @override
  String get quiet => 'Silencieux';

  @override
  String get normal => 'Normal';

  @override
  String get high => 'Élevé';

  @override
  String get micGainDescMuted => 'Le microphone est en sourdine';

  @override
  String get micGainDescLow =>
      'Très silencieux - pour les environnements bruyants';

  @override
  String get micGainDescModerate => 'Silencieux - pour un bruit modéré';

  @override
  String get micGainDescNeutral => 'Neutre - enregistrement équilibré';

  @override
  String get micGainDescSlightlyBoosted =>
      'Légèrement amplifié - utilisation normale';

  @override
  String get micGainDescBoosted => 'Amplifié - pour les environnements calmes';

  @override
  String get micGainDescHigh => 'Élevé - pour les voix distantes ou douces';

  @override
  String get micGainDescVeryHigh =>
      'Très élevé - pour les sources très silencieuses';

  @override
  String get micGainDescMax => 'Maximum - à utiliser avec précaution';

  @override
  String get saving => 'Enregistrement...';

  @override
  String get beta => 'BÊTA';

  @override
  String get transcription => 'Transcription';

  @override
  String get conversationTimeout => 'Délai de conversation';

  @override
  String get importData => 'Importer des données';

  @override
  String get endpointUrl => 'URL du point de terminaison';

  @override
  String get noApiKeys => 'Pas encore de clés API';

  @override
  String get createKey => 'Créer une Clé';

  @override
  String get docs => 'Documentation';

  @override
  String get today => 'Aujourd\'hui';

  @override
  String get thisMonth => 'Ce mois-ci';

  @override
  String get thisYear => 'Cette année';

  @override
  String get allTime => 'Depuis toujours';

  @override
  String get startConversationToSeeInsights =>
      'Commencez une conversation avec Toki\npour voir vos statistiques d\'utilisation ici.';

  @override
  String get listening => 'Écoute';

  @override
  String get listeningSubtitle => 'Temps total d\'écoute active d\'Toki.';

  @override
  String get understanding => 'Compréhension';

  @override
  String get understandingSubtitle => 'Mots compris de vos conversations.';

  @override
  String get providing => 'Fourniture';

  @override
  String get providingSubtitle =>
      'Actions à faire et notes capturées automatiquement.';

  @override
  String get remembering => 'Mémorisation';

  @override
  String get rememberingSubtitle => 'Faits et détails mémorisés pour vous.';

  @override
  String get debugLogs => 'Journaux de débogage';

  @override
  String get noLogFilesFound => 'Aucun fichier journal trouvé.';

  @override
  String get selectLogFile => 'Sélectionner un fichier journal';

  @override
  String get shareLogs => 'Partager les journaux';

  @override
  String get debugLogCleared => 'Journal de débogage effacé';

  @override
  String get exportStarted =>
      'Exportation démarrée. Cela peut prendre quelques secondes...';

  @override
  String get exportAllData => 'Exporter toutes les données';

  @override
  String get knowledgeGraphDeleted => 'Graphe de connaissances supprimé';

  @override
  String get deleteKnowledgeGraph => 'Supprimer le graphe de connaissances';

  @override
  String get mcp => 'MCP';

  @override
  String get mcpServer => 'Serveur MCP';

  @override
  String get serverUrl => 'URL du serveur';

  @override
  String get urlCopied => 'URL copiée';

  @override
  String get apiKeyAuth => 'Authentification par clé API';

  @override
  String get header => 'En-tête';

  @override
  String get clientId => 'ID client';

  @override
  String get clientSecret => 'Secret client';

  @override
  String get webhooks => 'Webhooks';

  @override
  String get conversationEvents => 'Événements de conversation';

  @override
  String get newConversationCreated => 'Nouvelle conversation créée';

  @override
  String get transcriptReceived => 'Transcription reçue';

  @override
  String get audioBytes => 'Octets audio';

  @override
  String get audioDataReceived => 'Données audio reçues';

  @override
  String get intervalSeconds => 'Intervalle (secondes)';

  @override
  String get daySummary => 'Résumé du jour';

  @override
  String get summaryGenerated => 'Résumé généré';

  @override
  String get claudeDesktop => 'Claude Desktop';

  @override
  String get copyConfig => 'Copier la configuration';

  @override
  String get configCopied => 'Configuration copiée dans le presse-papiers';

  @override
  String get listeningMins => 'Écoute (min)';

  @override
  String get understandingWords => 'Compréhension (mots)';

  @override
  String get insights => 'Informations';

  @override
  String get memories => 'Souvenirs';

  @override
  String get visibility => 'Visibilité';

  @override
  String get visibilitySubtitle =>
      'Contrôlez quelles conversations apparaissent dans votre liste';

  @override
  String get showShortConversations => 'Afficher les conversations courtes';

  @override
  String get showShortConversationsDesc =>
      'Afficher les conversations plus courtes que le seuil';

  @override
  String get showDiscardedConversations =>
      'Afficher les conversations ignorées';

  @override
  String get showDiscardedConversationsDesc =>
      'Inclure les conversations marquées comme ignorées';

  @override
  String get shortConversationThreshold => 'Seuil de conversation courte';

  @override
  String get shortConversationThresholdSubtitle =>
      'Les conversations plus courtes que cela seront masquées sauf si activé ci-dessus';

  @override
  String get durationThreshold => 'Seuil de durée';

  @override
  String get durationThresholdDesc =>
      'Masquer les conversations plus courtes que cela';

  @override
  String minLabel(int count) {
    return '$count min';
  }

  @override
  String get customVocabularyTitle => 'Vocabulaire personnalisé';

  @override
  String get addWords => 'Ajouter des mots';

  @override
  String get addWordsDesc => 'Noms, termes ou mots inhabituels';

  @override
  String get vocabularyHint => 'Toki, Callie, OpenAI';

  @override
  String get connect => 'Connecter';

  @override
  String get comingSoon => 'Bientôt disponible';

  @override
  String get integrationsFooter =>
      'Connectez vos applications pour afficher les données et les métriques dans le chat.';

  @override
  String get completeAuthInBrowser =>
      'Veuillez compléter l\'authentification dans votre navigateur. Une fois terminé, revenez à l\'application.';

  @override
  String failedToStartAuth(String appName) {
    return 'Échec du démarrage de l\'authentification $appName';
  }

  @override
  String disconnectAppTitle(String appName) {
    return 'Déconnecter $appName ?';
  }

  @override
  String disconnectAppMessage(String appName) {
    return 'Êtes-vous sûr de vouloir vous déconnecter de $appName ? Vous pouvez vous reconnecter à tout moment.';
  }

  @override
  String disconnectedFrom(String appName) {
    return 'Déconnecté de $appName';
  }

  @override
  String get failedToDisconnect => 'Échec de la déconnexion';

  @override
  String connectTo(String appName) {
    return 'Se connecter à $appName';
  }

  @override
  String authAccessMessage(String appName) {
    return 'Vous devrez autoriser Toki à accéder à vos données $appName. Cela ouvrira votre navigateur pour l\'authentification.';
  }

  @override
  String get continueAction => 'Continuer';

  @override
  String get languageTitle => 'Langue';

  @override
  String get primaryLanguage => 'Langue principale';

  @override
  String get automaticTranslation => 'Traduction automatique';

  @override
  String get detectLanguages => 'Détecter plus de 10 langues';

  @override
  String get authorizeSavingRecordings =>
      'Autoriser l\'enregistrement des enregistrements';

  @override
  String get thanksForAuthorizing => 'Merci pour l\'autorisation !';

  @override
  String get needYourPermission => 'Nous avons besoin de votre permission';

  @override
  String get alreadyGavePermission =>
      'Vous nous avez déjà donné la permission d\'enregistrer vos enregistrements. Voici un rappel de pourquoi nous en avons besoin :';

  @override
  String get wouldLikePermission =>
      'Nous aimerions avoir votre permission pour sauvegarder vos enregistrements vocaux. Voici pourquoi :';

  @override
  String get improveSpeechProfile => 'Améliorer votre profil vocal';

  @override
  String get improveSpeechProfileDesc =>
      'Nous utilisons les enregistrements pour entraîner et améliorer davantage votre profil vocal personnel.';

  @override
  String get trainFamilyProfiles =>
      'Entraîner des profils pour les amis et la famille';

  @override
  String get trainFamilyProfilesDesc =>
      'Vos enregistrements nous aident à reconnaître et créer des profils pour vos amis et votre famille.';

  @override
  String get enhanceTranscriptAccuracy =>
      'Améliorer la précision de la transcription';

  @override
  String get enhanceTranscriptAccuracyDesc =>
      'À mesure que notre modèle s\'améliore, nous pouvons fournir de meilleurs résultats de transcription pour vos enregistrements.';

  @override
  String get legalNotice =>
      'Avis juridique : La légalité de l\'enregistrement et du stockage des données vocales peut varier selon votre emplacement et la façon dont vous utilisez cette fonctionnalité. Il est de votre responsabilité de vous assurer de la conformité aux lois et réglementations locales.';

  @override
  String get alreadyAuthorized => 'Déjà autorisé';

  @override
  String get authorize => 'Autoriser';

  @override
  String get revokeAuthorization => 'Révoquer l\'autorisation';

  @override
  String get authorizationSuccessful => 'Autorisation réussie !';

  @override
  String get failedToAuthorize =>
      'Échec de l\'autorisation. Veuillez réessayer.';

  @override
  String get authorizationRevoked => 'Autorisation révoquée.';

  @override
  String get recordingsDeleted => 'Enregistrements supprimés.';

  @override
  String get failedToRevoke =>
      'Échec de la révocation de l\'autorisation. Veuillez réessayer.';

  @override
  String get permissionRevokedTitle => 'Permission révoquée';

  @override
  String get permissionRevokedMessage =>
      'Voulez-vous que nous supprimions également tous vos enregistrements existants ?';

  @override
  String get yes => 'Oui';

  @override
  String get editName => 'Modifier le nom';

  @override
  String get howShouldOmiCallYou => 'Comment Toki devrait-il vous appeler ?';

  @override
  String get enterYourName => 'Entrez votre nom';

  @override
  String get nameCannotBeEmpty => 'Le nom ne peut pas être vide';

  @override
  String get nameUpdatedSuccessfully => 'Nom mis à jour avec succès !';

  @override
  String get calendarSettings => 'Paramètres du calendrier';

  @override
  String get calendarProviders => 'Fournisseurs de calendrier';

  @override
  String get macOsCalendar => 'Calendrier macOS';

  @override
  String get connectMacOsCalendar => 'Connectez votre calendrier macOS local';

  @override
  String get googleCalendar => 'Google Agenda';

  @override
  String get syncGoogleAccount => 'Synchroniser avec votre compte Google';

  @override
  String get showMeetingsMenuBar =>
      'Afficher les réunions à venir dans la barre de menus';

  @override
  String get showMeetingsMenuBarDesc =>
      'Afficher votre prochaine réunion et le temps restant avant son début dans la barre de menus macOS';

  @override
  String get showEventsNoParticipants =>
      'Afficher les événements sans participants';

  @override
  String get showEventsNoParticipantsDesc =>
      'Lorsque activé, À venir affiche les événements sans participants ou lien vidéo.';

  @override
  String get yourMeetings => 'Vos réunions';

  @override
  String get refresh => 'Actualiser';

  @override
  String get noUpcomingMeetings => 'Aucune réunion à venir';

  @override
  String get checkingNextDays => 'Vérification des 30 prochains jours';

  @override
  String get tomorrow => 'Demain';

  @override
  String get googleCalendarComingSoon =>
      'L\'intégration Google Agenda arrive bientôt !';

  @override
  String connectedAsUser(String userId) {
    return 'Connecté en tant qu\'utilisateur : $userId';
  }

  @override
  String get defaultWorkspace => 'Espace de travail par défaut';

  @override
  String get tasksCreatedInWorkspace =>
      'Les tâches seront créées dans cet espace de travail';

  @override
  String get defaultProjectOptional => 'Projet par défaut (facultatif)';

  @override
  String get leaveUnselectedTasks =>
      'Laissez non sélectionné pour créer des tâches sans projet';

  @override
  String get noProjectsInWorkspace =>
      'Aucun projet trouvé dans cet espace de travail';

  @override
  String get conversationTimeoutDesc =>
      'Choisissez combien de temps attendre en silence avant de terminer automatiquement une conversation :';

  @override
  String get timeout2Minutes => '2 minutes';

  @override
  String get timeout2MinutesDesc =>
      'Terminer la conversation après 2 minutes de silence';

  @override
  String get timeout5Minutes => '5 minutes';

  @override
  String get timeout5MinutesDesc =>
      'Terminer la conversation après 5 minutes de silence';

  @override
  String get timeout10Minutes => '10 minutes';

  @override
  String get timeout10MinutesDesc =>
      'Terminer la conversation après 10 minutes de silence';

  @override
  String get timeout30Minutes => '30 minutes';

  @override
  String get timeout30MinutesDesc =>
      'Terminer la conversation après 30 minutes de silence';

  @override
  String get timeout4Hours => '4 heures';

  @override
  String get timeout4HoursDesc =>
      'Terminer la conversation après 4 heures de silence';

  @override
  String get conversationEndAfterHours =>
      'Les conversations se termineront maintenant après 4 heures de silence';

  @override
  String conversationEndAfterMinutes(int minutes) {
    return 'Les conversations se termineront maintenant après $minutes minute(s) de silence';
  }

  @override
  String get tellUsPrimaryLanguage => 'Dites-nous votre langue principale';

  @override
  String get languageForTranscription =>
      'Définissez votre langue pour des transcriptions plus précises et une expérience personnalisée.';

  @override
  String get singleLanguageModeInfo =>
      'Le mode langue unique est activé. La traduction est désactivée pour une meilleure précision.';

  @override
  String get searchLanguageHint => 'Rechercher une langue par nom ou code';

  @override
  String get noLanguagesFound => 'Aucune langue trouvée';

  @override
  String get skip => 'Ignorer';

  @override
  String languageSetTo(String language) {
    return 'Langue définie sur $language';
  }

  @override
  String get failedToSetLanguage => 'Échec de la définition de la langue';

  @override
  String appSettings(String appName) {
    return 'Paramètres de $appName';
  }

  @override
  String disconnectFromApp(String appName) {
    return 'Déconnecter de $appName ?';
  }

  @override
  String disconnectFromAppDesc(String appName) {
    return 'Cela supprimera votre authentification $appName. Vous devrez vous reconnecter pour l\'utiliser à nouveau.';
  }

  @override
  String connectedToApp(String appName) {
    return 'Connecté à $appName';
  }

  @override
  String get account => 'Compte';

  @override
  String actionItemsSyncedTo(String appName) {
    return 'Vos actions à faire seront synchronisées avec votre compte $appName';
  }

  @override
  String get defaultSpace => 'Espace par défaut';

  @override
  String get selectSpaceInWorkspace =>
      'Sélectionnez un espace dans votre espace de travail';

  @override
  String get noSpacesInWorkspace =>
      'Aucun espace trouvé dans cet espace de travail';

  @override
  String get defaultList => 'Liste par défaut';

  @override
  String get tasksAddedToList => 'Les tâches seront ajoutées à cette liste';

  @override
  String get noListsInSpace => 'Aucune liste trouvée dans cet espace';

  @override
  String get private => 'Privé';

  @override
  String get yesterday => 'Hier';

  @override
  String get taskIntegrations => 'Intégrations de tâches';

  @override
  String get configureSettings => 'Configurer les paramètres';

  @override
  String get completeAuthBrowser =>
      'Veuillez compléter l\'authentification dans votre navigateur. Une fois terminé, revenez à l\'application.';

  @override
  String failedToStartAppAuth(String appName) {
    return 'Échec du démarrage de l\'authentification $appName';
  }

  @override
  String connectToAppTitle(String appName) {
    return 'Se connecter à $appName';
  }

  @override
  String authorizeOmiForTasks(String appName) {
    return 'Vous devrez autoriser Toki à créer des tâches dans votre compte $appName. Cela ouvrira votre navigateur pour l\'authentification.';
  }

  @override
  String get continueButton => 'Continuer';

  @override
  String appIntegration(String appName) {
    return 'Intégration $appName';
  }

  @override
  String integrationComingSoon(String appName) {
    return 'L\'intégration avec $appName arrive bientôt ! Nous travaillons dur pour vous apporter plus d\'options de gestion des tâches.';
  }

  @override
  String get gotIt => 'Compris';

  @override
  String get tasksExportedOneApp =>
      'Les tâches peuvent être exportées vers une seule application à la fois.';

  @override
  String get importConfiguration => 'Importer la configuration';

  @override
  String get exportConfiguration => 'Exporter la configuration';

  @override
  String get payYourSttProvider =>
      'Utilisez Toki librement. Vous ne payez que votre fournisseur STT directement.';

  @override
  String get hostRequired => 'L\'hôte est requis';

  @override
  String get validPortRequired => 'Un port valide est requis';

  @override
  String get validWebsocketUrlRequired =>
      'Une URL WebSocket valide est requise (wss://)';

  @override
  String get apiUrlRequired => 'L\'URL de l\'API est requise';

  @override
  String get apiKeyRequired => 'La clé API est requise';

  @override
  String get invalidJsonConfig => 'Configuration JSON invalide';

  @override
  String errorSaving(String error) {
    return 'Erreur d\'enregistrement : $error';
  }

  @override
  String get configCopiedToClipboard =>
      'Configuration copiée dans le presse-papiers';

  @override
  String get pasteJsonConfig => 'Collez votre configuration JSON ci-dessous :';

  @override
  String get addApiKeyAfterImport =>
      'Vous devrez ajouter votre propre clé API après l\'importation';

  @override
  String get paste => 'Coller';

  @override
  String get import => 'Importer';

  @override
  String get invalidProviderInConfig =>
      'Fournisseur invalide dans la configuration';

  @override
  String importedConfig(String providerName) {
    return 'Configuration $providerName importée';
  }

  @override
  String invalidJson(String error) {
    return 'JSON invalide : $error';
  }

  @override
  String get provider => 'Fournisseur';

  @override
  String get live => 'En direct';

  @override
  String get onDevice => 'Sur l\'appareil';

  @override
  String get apiUrl => 'URL de l\'API';

  @override
  String get enterSttHttpEndpoint =>
      'Entrez votre point de terminaison HTTP STT';

  @override
  String get websocketUrl => 'URL WebSocket';

  @override
  String get enterLiveSttWebsocket =>
      'Entrez votre point de terminaison WebSocket STT en direct';

  @override
  String get apiKey => 'Clé API';

  @override
  String get enterApiKey => 'Entrez votre clé API';

  @override
  String get storedLocallyNeverShared => 'Stocké localement, jamais partagé';

  @override
  String get host => 'Hôte';

  @override
  String get port => 'Port';

  @override
  String get advanced => 'Avancé';

  @override
  String get configuration => 'Configuration';

  @override
  String get requestConfiguration => 'Configuration de la requête';

  @override
  String get responseSchema => 'Schéma de réponse';

  @override
  String get modified => 'Modifié';

  @override
  String get resetRequestConfig =>
      'Réinitialiser la config de requête par défaut';

  @override
  String get logs => 'Journaux';

  @override
  String get logsCopied => 'Journaux copiés';

  @override
  String get noLogsYet =>
      'Pas encore de journaux. Commencez à enregistrer pour voir l\'activité STT personnalisée.';

  @override
  String deviceUsesCodec(String device, String reason) {
    return '$device utilise $reason. Toki sera utilisé.';
  }

  @override
  String get omiTranscription => 'Transcription Toki';

  @override
  String get processing => 'Traitement...';

  @override
  String get creatingYourApp => 'Création de votre application...';

  @override
  String get appName => 'App Name';

  @override
  String get description => 'Description';

  @override
  String get free => 'Gratuit';

  @override
  String get makePublic => 'Rendre public';

  @override
  String get anyoneCanDiscover =>
      'N\'importe qui peut découvrir votre application';

  @override
  String get onlyYouCanUse => 'Vous seul pouvez utiliser cette application';

  @override
  String get creating => 'Création...';

  @override
  String get searchingForDevices => 'Recherche d\'appareils...';

  @override
  String devicesFoundNearby(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'APPAREILS',
      one: 'APPAREIL',
    );
    return '$count $_temp0 TROUVÉ(S) À PROXIMITÉ';
  }

  @override
  String get pairingSuccessful => 'APPAIRAGE RÉUSSI';

  @override
  String errorConnectingAppleWatch(String error) {
    return 'Erreur de connexion à l\'Apple Watch : $error';
  }

  @override
  String get dontShowAgain => 'Ne plus afficher';

  @override
  String get iUnderstand => 'Je comprends';

  @override
  String get enableBluetooth => 'Activer le Bluetooth';

  @override
  String get bluetoothNeeded =>
      'Toki a besoin du Bluetooth pour se connecter à votre wearable. Veuillez activer le Bluetooth et réessayer.';

  @override
  String get contactSupport => 'Contacter le support ?';

  @override
  String get connectLater => 'Se connecter plus tard';

  @override
  String get grantPermissions => 'Accorder les autorisations';

  @override
  String get backgroundActivity => 'Activité en arrière-plan';

  @override
  String get backgroundActivityDesc =>
      'Laissez Toki fonctionner en arrière-plan pour une meilleure stabilité';

  @override
  String get locationAccess => 'Accès à la localisation';

  @override
  String get locationAccessDesc =>
      'Activez la localisation en arrière-plan pour l\'expérience complète';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsDesc =>
      'Activez les notifications pour rester informé';

  @override
  String get locationServiceDisabled => 'Service de localisation désactivé';

  @override
  String get locationServiceDisabledDesc =>
      'Le service de localisation est désactivé. Veuillez aller dans Réglages > Confidentialité et sécurité > Services de localisation et l\'activer';

  @override
  String get leaveReviewIos =>
      'Aidez-nous à atteindre plus de personnes en laissant un avis sur l\'App Store. Votre retour compte énormément pour nous !';

  @override
  String get leaveReviewAndroid =>
      'Aidez-nous à atteindre plus de personnes en laissant un avis sur le Google Play Store. Votre retour compte énormément pour nous !';

  @override
  String get rateOnGooglePlay => 'Noter sur Google Play';

  @override
  String get maybeLater => 'Peut-être plus tard';

  @override
  String get speechProfileIntro =>
      'Toki doit apprendre vos objectifs et votre voix. Vous pourrez le modifier plus tard.';

  @override
  String get getStarted => 'Commencer';

  @override
  String get allDone => 'Terminé !';

  @override
  String get keepGoing => 'Continuez, vous vous en sortez très bien';

  @override
  String get skipThisQuestion => 'Passer cette question';

  @override
  String get skipForNow => 'Passer pour l\'instant';

  @override
  String get connectionError => 'Erreur de connexion';

  @override
  String get connectionErrorDesc =>
      'Échec de la connexion au serveur. Veuillez vérifier votre connexion internet et réessayer.';

  @override
  String get invalidRecordingMultipleSpeakers =>
      'Enregistrement invalide détecté';

  @override
  String get multipleSpeakersDesc =>
      'Il semble y avoir plusieurs locuteurs dans l\'enregistrement. Veuillez vous assurer d\'être dans un endroit calme et réessayer.';

  @override
  String get tooShortDesc =>
      'Pas assez de parole détectée. Veuillez parler davantage et réessayer.';

  @override
  String get invalidRecordingDesc =>
      'Veuillez vous assurer de parler pendant au moins 5 secondes et pas plus de 90.';

  @override
  String get areYouThere => 'Êtes-vous là ?';

  @override
  String get noSpeechDesc =>
      'Nous n\'avons pas pu détecter de parole. Veuillez vous assurer de parler pendant au moins 10 secondes et pas plus de 3 minutes.';

  @override
  String get connectionLost => 'Connexion perdue';

  @override
  String get connectionLostDesc =>
      'La connexion a été interrompue. Veuillez vérifier votre connexion internet et réessayer.';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get connectOmiOmiGlass => 'Connecter Toki / TokiGlass';

  @override
  String get continueWithoutDevice => 'Continuer sans appareil';

  @override
  String get permissionsRequired => 'Autorisations requises';

  @override
  String get permissionsRequiredDesc =>
      'Cette application a besoin des autorisations Bluetooth et Localisation pour fonctionner correctement. Veuillez les activer dans les paramètres.';

  @override
  String get openSettings => 'Ouvrir les paramètres';

  @override
  String get wantDifferentName => 'Voulez-vous utiliser un autre nom ?';

  @override
  String get whatsYourName => 'Comment vous appelez-vous ?';

  @override
  String get speakTranscribeSummarize => 'Parlez. Transcrivez. Résumez.';

  @override
  String get signInWithApple => 'Se connecter avec Apple';

  @override
  String get signInWithGoogle => 'Se connecter avec Google';

  @override
  String get byContinuingAgree => 'En continuant, vous acceptez notre ';

  @override
  String get termsOfUse => 'Conditions d\'utilisation';

  @override
  String get omiYourAiCompanion => 'Toki – Votre compagnon IA';

  @override
  String get captureEveryMoment =>
      'Capturez chaque moment. Obtenez des résumés\nalimentés par l\'IA. Ne prenez plus jamais de notes.';

  @override
  String get appleWatchSetup => 'Configuration Apple Watch';

  @override
  String get permissionRequestedExclaim => 'Permission demandée !';

  @override
  String get microphonePermission => 'Permission du microphone';

  @override
  String get permissionGrantedNow =>
      'Permission accordée ! Maintenant :\n\nOuvrez l\'application Toki sur votre montre et appuyez sur « Continuer » ci-dessous';

  @override
  String get needMicrophonePermission =>
      'Nous avons besoin de la permission du microphone.\n\n1. Appuyez sur « Accorder la permission »\n2. Autorisez sur votre iPhone\n3. L\'application de la montre se fermera\n4. Rouvrez et appuyez sur « Continuer »';

  @override
  String get grantPermissionButton => 'Accorder la permission';

  @override
  String get needHelp => 'Besoin d\'aide ?';

  @override
  String get troubleshootingSteps =>
      'Dépannage :\n\n1. Assurez-vous qu\'Toki est installé sur votre montre\n2. Ouvrez l\'application Toki sur votre montre\n3. Recherchez la fenêtre de permission\n4. Appuyez sur « Autoriser » lorsque demandé\n5. L\'application sur votre montre se fermera - rouvrez-la\n6. Revenez et appuyez sur « Continuer » sur votre iPhone';

  @override
  String get recordingStartedSuccessfully =>
      'Enregistrement démarré avec succès !';

  @override
  String get permissionNotGrantedYet =>
      'Permission non encore accordée. Veuillez vous assurer d\'avoir autorisé l\'accès au microphone et rouvert l\'application sur votre montre.';

  @override
  String errorRequestingPermission(String error) {
    return 'Erreur lors de la demande de permission : $error';
  }

  @override
  String errorStartingRecording(String error) {
    return 'Erreur lors du démarrage de l\'enregistrement : $error';
  }

  @override
  String get selectPrimaryLanguage => 'Sélectionnez votre langue principale';

  @override
  String get languageBenefits =>
      'Définissez votre langue pour des transcriptions plus précises et une expérience personnalisée';

  @override
  String get whatsYourPrimaryLanguage => 'Quelle est votre langue principale ?';

  @override
  String get selectYourLanguage => 'Sélectionnez votre langue';

  @override
  String get personalGrowthJourney =>
      'Votre parcours de croissance personnelle avec une IA qui écoute chacun de vos mots.';

  @override
  String get selectAll => 'Tout sélectionner';

  @override
  String get searchMemories => 'Rechercher des souvenirs...';

  @override
  String get memoryDeleted => 'Mémoire supprimée.';

  @override
  String get undo => 'Annuler';

  @override
  String get noMemoriesYet => '🧠 Pas encore de souvenirs';

  @override
  String get noManualMemories => 'Pas encore de mémoires manuelles';

  @override
  String get noMemoriesInCategories => 'Aucune mémoire dans ces catégories';

  @override
  String get noMemoriesFound => '🔍 Aucun souvenir trouvé';

  @override
  String get addFirstMemory => 'Ajoutez votre première mémoire';

  @override
  String get clearMemoryTitle => 'Effacer la mémoire d\'Toki';

  @override
  String get clearMemoryMessage =>
      'Êtes-vous sûr de vouloir effacer la mémoire d\'Toki ? Cette action est irréversible.';

  @override
  String get clearMemoryButton => 'Effacer la mémoire';

  @override
  String get memoryClearedSuccess =>
      'La mémoire d\'Toki vous concernant a été effacée';

  @override
  String get noMemoriesToDelete => 'Aucun souvenir à supprimer';

  @override
  String get createMemoryTooltip => 'Créer une nouvelle mémoire';

  @override
  String get memoryManagement => 'Gestion de la mémoire';

  @override
  String get filterMemories => 'Filtrer les mémoires';

  @override
  String totalMemoriesCount(int count) {
    return 'Vous avez $count mémoires au total';
  }

  @override
  String get publicMemories => 'Mémoires publiques';

  @override
  String get privateMemories => 'Mémoires privées';

  @override
  String get makeAllPrivate => 'Rendre toutes les mémoires privées';

  @override
  String get makeAllPublic => 'Rendre toutes les mémoires publiques';

  @override
  String get deleteAllMemories => 'Supprimer tous les souvenirs';

  @override
  String get allMemoriesPrivateResult =>
      'Toutes les mémoires sont maintenant privées';

  @override
  String get allMemoriesPublicResult =>
      'Toutes les mémoires sont maintenant publiques';

  @override
  String get newMemory => '✨ Nouveau souvenir';

  @override
  String get editMemory => '✏️ Modifier le souvenir';

  @override
  String get memoryContentHint => 'J\'aime manger des glaces...';

  @override
  String get failedToSaveMemory =>
      'Échec de l\'enregistrement. Veuillez vérifier votre connexion.';

  @override
  String get saveMemory => 'Enregistrer la mémoire';

  @override
  String get retry => 'Réessayer';

  @override
  String get createActionItem => 'Créer une tâche';

  @override
  String get actionItemDescriptionHint => 'Que faut-il faire ?';

  @override
  String get actionItemDescriptionEmpty =>
      'La description de l\'action ne peut pas être vide.';

  @override
  String get actionItemUpdated => 'Action mise à jour';

  @override
  String get failedToUpdateActionItem => 'Échec de la mise à jour de la tâche';

  @override
  String get actionItemCreated => 'Action créée';

  @override
  String get failedToCreateActionItem => 'Échec de la création de la tâche';

  @override
  String get time => 'Heure';

  @override
  String get addDueDate => 'Ajouter une date d\'échéance';

  @override
  String get pressDoneToSave => 'Appuyez sur Terminé pour enregistrer';

  @override
  String get pressDoneToCreate => 'Appuyez sur Terminé pour créer';

  @override
  String get filterAll => 'Tous';

  @override
  String get filterSystem => 'À propos de vous';

  @override
  String get filterInteresting => 'Aperçus';

  @override
  String get filterManual => 'Manuel';

  @override
  String get completed => 'Terminé';

  @override
  String get markComplete => 'Marquer comme terminé';

  @override
  String get actionItemDeleted => 'Élément d\'action supprimé';

  @override
  String get failedToDeleteActionItem => 'Échec de la suppression de la tâche';

  @override
  String get deleteActionItemConfirmTitle => 'Supprimer l\'action';

  @override
  String get deleteActionItemConfirmMessage =>
      'Êtes-vous sûr de vouloir supprimer cette action ?';

  @override
  String get appLanguage => 'Langue de l\'application';

  @override
  String get appInterfaceSectionTitle => 'INTERFACE DE L\'APPLICATION';

  @override
  String get speechTranscriptionSectionTitle => 'VOIX ET TRANSCRIPTION';

  @override
  String get languageSettingsHelperText =>
      'La langue de l\'application modifie les menus et les boutons. La langue vocale affecte la transcription de vos enregistrements.';

  @override
  String get translationNotice => 'Avis de traduction';

  @override
  String get translationNoticeMessage =>
      'Toki traduit les conversations dans votre langue principale. Mettez-la à jour à tout moment dans Paramètres → Profils.';

  @override
  String get pleaseCheckInternetConnection =>
      'Veuillez vérifier votre connexion Internet et réessayer';

  @override
  String get pleaseSelectReason => 'Veuillez sélectionner une raison';

  @override
  String get tellUsMoreWhatWentWrong =>
      'Dites-nous en plus sur ce qui s\'est mal passé...';

  @override
  String get selectText => 'Sélectionner le texte';

  @override
  String maximumGoalsAllowed(int count) {
    return 'Maximum $count objectifs autorisés';
  }

  @override
  String get conversationCannotBeMerged =>
      'Cette conversation ne peut pas être fusionnée (verrouillée ou déjà en cours de fusion)';

  @override
  String get pleaseEnterFolderName => 'Veuillez saisir un nom de dossier';

  @override
  String get failedToCreateFolder => 'Échec de la création du dossier';

  @override
  String get failedToUpdateFolder => 'Échec de la mise à jour du dossier';

  @override
  String get folderName => 'Nom du dossier';

  @override
  String get descriptionOptional => 'Description (facultatif)';

  @override
  String get failedToDeleteFolder => 'Échec de la suppression du dossier';

  @override
  String get editFolder => 'Modifier le dossier';

  @override
  String get deleteFolder => 'Supprimer le dossier';

  @override
  String get transcriptCopiedToClipboard =>
      'Transcription copiée dans le presse-papiers';

  @override
  String get actionItemsCopiedToClipboard =>
      'Éléments d\'action copiés dans le presse-papiers';

  @override
  String get summarize => 'Résumer';

  @override
  String get generateSummary => 'Générer un résumé';

  @override
  String get conversationNotFoundOrDeleted =>
      'Conversation introuvable ou supprimée';

  @override
  String get deleteMemory => 'Supprimer le souvenir';

  @override
  String get thisActionCannotBeUndone =>
      'Cette action ne peut pas être annulée.';

  @override
  String memoriesCount(int count) {
    return '$count souvenirs';
  }

  @override
  String get noMemoriesInCategory =>
      'Aucun souvenir dans cette catégorie pour le moment';

  @override
  String get addYourFirstMemory => 'Ajoutez votre premier souvenir';

  @override
  String get firmwareDisconnectUsb => 'Déconnecter USB';

  @override
  String get firmwareUsbWarning =>
      'La connexion USB pendant les mises à jour peut endommager votre appareil.';

  @override
  String get firmwareBatteryAbove15 => 'Batterie supérieure à 15%';

  @override
  String get firmwareEnsureBattery =>
      'Assurez-vous que votre appareil a 15% de batterie.';

  @override
  String get firmwareStableConnection => 'Connexion stable';

  @override
  String get firmwareConnectWifi =>
      'Connectez-vous au WiFi ou aux données cellulaires.';

  @override
  String failedToStartUpdate(String error) {
    return 'Échec du démarrage de la mise à jour: $error';
  }

  @override
  String get beforeUpdateMakeSure => 'Avant la mise à jour, assurez-vous:';

  @override
  String get confirmed => 'Confirmé!';

  @override
  String get release => 'Relâcher';

  @override
  String get slideToUpdate => 'Glisser pour mettre à jour';

  @override
  String copiedToClipboard(String title) {
    return '$title copié dans le presse-papiers';
  }

  @override
  String get batteryLevel => 'Niveau de batterie';

  @override
  String get productUpdate => 'Mise à jour du produit';

  @override
  String get offline => 'Hors ligne';

  @override
  String get available => 'Disponible';

  @override
  String get unpairDeviceDialogTitle => 'Dissocier l\'appareil';

  @override
  String get unpairDeviceDialogMessage =>
      'Cela dissociera l\'appareil pour qu\'il puisse être connecté à un autre téléphone. Vous devrez aller dans Paramètres > Bluetooth et oublier l\'appareil pour terminer le processus.';

  @override
  String get unpair => 'Dissocier';

  @override
  String get unpairAndForgetDevice => 'Dissocier et oublier l\'appareil';

  @override
  String get unknownDevice => 'Inconnu';

  @override
  String get unknown => 'Inconnu';

  @override
  String get productName => 'Nom du produit';

  @override
  String get serialNumber => 'Numéro de série';

  @override
  String get connected => 'Connecté';

  @override
  String get privacyPolicyTitle => 'Politique de confidentialité';

  @override
  String labelCopied(String label) {
    return '$label copié';
  }

  @override
  String get noApiKeysYet =>
      'Pas encore de clés API. Créez-en une pour intégrer votre application.';

  @override
  String get createKeyToGetStarted => 'Créez une clé pour commencer';

  @override
  String get persona => 'Persona';

  @override
  String get configureSttProvider => 'Configurer le fournisseur STT';

  @override
  String get setWhenConversationsAutoEnd =>
      'Définir quand les conversations se terminent automatiquement';

  @override
  String get importDataFromOtherSources =>
      'Importer des données d\'autres sources';

  @override
  String get debugAndDiagnostics => 'Débogage et diagnostics';

  @override
  String get helpsDiagnoseIssues => 'Aide à diagnostiquer les problèmes';

  @override
  String get exportConversationsToJson =>
      'Exporter les conversations vers un fichier JSON';

  @override
  String get knowledgeGraphDeletedSuccess =>
      'Graphe de connaissances supprimé avec succès';

  @override
  String failedToDeleteGraph(String error) {
    return 'Échec de la suppression du graphe : $error';
  }

  @override
  String get clearAllNodesAndConnections =>
      'Effacer tous les nœuds et connexions';

  @override
  String get addToClaudeDesktopConfig => 'Ajouter à claude_desktop_config.json';

  @override
  String get useYourMcpApiKey => 'Utilisez votre clé API MCP';

  @override
  String get realTimeTranscript => 'Transcription en temps réel';

  @override
  String get experimental => 'Expérimental';

  @override
  String get transcriptionDiagnostics => 'Diagnostics de transcription';

  @override
  String get detailedDiagnosticMessages => 'Messages de diagnostic détaillés';

  @override
  String get autoCreateSpeakers => 'Créer automatiquement les locuteurs';

  @override
  String get autoCreateWhenNameDetected =>
      'Créer automatiquement quand un nom est détecté';

  @override
  String get followUpQuestions => 'Questions de suivi';

  @override
  String get suggestQuestionsAfterConversations =>
      'Suggérer des questions après les conversations';

  @override
  String get goalTracker => 'Suivi des objectifs';

  @override
  String get dailyReflection => 'Réflexion quotidienne';

  @override
  String get overdue => 'En retard';

  @override
  String get howDoesItWork => 'Comment ça marche ?';

  @override
  String get sdCardSyncDescription =>
      'La synchronisation de la carte SD importera vos souvenirs de la carte SD vers l\'application';

  @override
  String get checksForAudioFiles =>
      'Vérifie les fichiers audio sur la carte SD';

  @override
  String get omiSyncsAudioFiles =>
      'Toki synchronise ensuite les fichiers audio avec le serveur';

  @override
  String get serverProcessesAudio =>
      'Le serveur traite les fichiers audio et crée des souvenirs';

  @override
  String get youreAllSet => 'Vous êtes prêt !';

  @override
  String get back => 'Retour';

  @override
  String get space => 'Espace';

  @override
  String get search => 'Rechercher';

  @override
  String get addGoal => 'Ajouter un objectif';

  @override
  String get editGoal => 'Modifier l\'objectif';

  @override
  String get icon => 'Icône';

  @override
  String get goalTitle => 'Titre de l\'objectif';

  @override
  String get current => 'Actuel';

  @override
  String get target => 'Cible';

  @override
  String get goals => 'Objectifs';

  @override
  String get noTasksForToday =>
      'Aucune tâche pour aujourd\'hui.\nDemandez à Toki plus de tâches ou créez-les manuellement.';

  @override
  String get dailyScore => 'SCORE QUOTIDIEN';

  @override
  String get dailyScoreDescription =>
      'Un score pour vous aider\nà mieux vous concentrer sur l\'exécution.';

  @override
  String get actionItems => 'Actions à faire';

  @override
  String get tasksNoDeadline => 'Sans échéance';

  @override
  String get tasksLater => 'Plus tard';

  @override
  String get tasks => 'Tâches';

  @override
  String get create => 'Créer';

  @override
  String get noTasksYet => 'Aucune tâche pour l\'instant';

  @override
  String get monthJan => 'Jan';

  @override
  String get monthFeb => 'Fév';

  @override
  String get monthMar => 'Mar';

  @override
  String get monthApr => 'Avr';

  @override
  String get monthMay => 'Mai';

  @override
  String get monthJun => 'Juin';

  @override
  String get monthJul => 'Juil';

  @override
  String get monthAug => 'Août';

  @override
  String get monthSep => 'Sep';

  @override
  String get monthOct => 'Oct';

  @override
  String get monthNov => 'Nov';

  @override
  String get monthDec => 'Déc';

  @override
  String get timePM => 'PM';

  @override
  String get timeAM => 'AM';

  @override
  String get deleteActionItem => 'Supprimer la tâche';

  @override
  String get all => 'All';

  @override
  String get open => 'Ouvrir';

  @override
  String get install => 'Installer';

  @override
  String get pleaseCheckInternetConnectionAndTryAgain =>
      'Veuillez vérifier votre connexion Internet et réessayer';

  @override
  String get chatPrompt => 'Invite de chat';

  @override
  String get conversationPrompt => 'Invite de conversation';

  @override
  String get notificationScopes => 'Portées de notification';

  @override
  String get connectNow => 'Connecter maintenant';

  @override
  String get subscribe => 'S\'abonner';

  @override
  String get setupInstructions => 'Instructions de configuration';

  @override
  String get errorActivatingApp =>
      'Erreur lors de l\'activation de l\'application';

  @override
  String get pleaseEnterAppName => 'Veuillez saisir le nom de l\'application';

  @override
  String get startConversation =>
      'Commencez une conversation et laissez la magie opérer';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get selectFile => 'Sélectionner un fichier';

  @override
  String get clearChatTitle => 'Effacer le chat ?';

  @override
  String get confirmClearChat =>
      'Êtes-vous sûr de vouloir effacer le chat ? Cette action ne peut pas être annulée.';

  @override
  String get copy => 'Copier';

  @override
  String get share => 'Partager';

  @override
  String get report => 'Signaler';

  @override
  String get transcribing => 'Transcription...';

  @override
  String get discardedConversation => 'Conversation abandonnée';

  @override
  String get at => 'à';

  @override
  String get from => 'de';

  @override
  String get copied => 'Copié !';

  @override
  String get transcript => 'Transcription';

  @override
  String get user => 'Utilisateur';

  @override
  String get starred => 'Favoris';

  @override
  String get date => 'Date';

  @override
  String get conversations => 'Conversations';

  @override
  String get chat => 'Chat';

  @override
  String get actions => 'Actions';

  @override
  String get help => 'Aide';

  @override
  String get pro => 'Pro';

  @override
  String get allMemories => 'Tous les souvenirs';

  @override
  String get manual => 'Manuel';

  @override
  String get category => 'Catégorie';

  @override
  String get public => 'Public';

  @override
  String get createMemory => 'Créer un souvenir';

  @override
  String get total => 'Total';

  @override
  String get continueWithApple => 'Continuer avec Apple';

  @override
  String get continueWithGoogle => 'Continuer avec Google';

  @override
  String get termsOfService => 'Conditions de service';

  @override
  String get and => ' et ';

  @override
  String get dataAndPrivacy => 'Données et confidentialité';

  @override
  String get dataProtection => 'Protection des données';

  @override
  String get yourDataIsProtected =>
      'Vos données sont protégées et régies par notre ';

  @override
  String get pleaseWait => 'Veuillez patienter...';

  @override
  String get teachOmiYourVoice => 'Apprenez à Toki votre voix';

  @override
  String get payment => 'Paiement';

  @override
  String get deleteAccount => 'Supprimer le Compte';

  @override
  String get exportConversations => 'Exporter les conversations';

  @override
  String get saveSettings => 'Enregistrer les Paramètres';

  @override
  String get summary => 'Résumé';

  @override
  String get auto => 'Automatique';

  @override
  String get noSummaryForApp =>
      'Aucun résumé disponible pour cette application. Essayez une autre application pour de meilleurs résultats.';

  @override
  String get overview => 'Vue d\'ensemble';

  @override
  String get unknownApp => 'Application inconnue';

  @override
  String get reconnecting => 'Reconnexion...';

  @override
  String get startRecording => 'Démarrer l\'enregistrement';

  @override
  String get paused => 'En pause';

  @override
  String get recording => 'Enregistrement';

  @override
  String get you => 'Vous';

  @override
  String speakerWithId(String speakerId) {
    return 'Locuteur $speakerId';
  }

  @override
  String get systemAudio => 'Système';

  @override
  String get mic => 'Micro';

  @override
  String get calendarIntegration => 'Intégration du Calendrier';

  @override
  String get dailySummary => 'Résumé quotidien';

  @override
  String get developer => 'Développeur';

  @override
  String get about => 'À propos';

  @override
  String get selectTime => 'Sélectionner l\'heure';

  @override
  String get signOutQuestion => 'Se déconnecter ?';

  @override
  String get signOutConfirmation =>
      'Êtes-vous sûr de vouloir vous déconnecter ?';

  @override
  String get dailySummaryDescription =>
      'Recevez un résumé personnalisé des conversations de votre journée sous forme de notification.';

  @override
  String get deliveryTime => 'Heure de livraison';

  @override
  String get displayOptions => 'Options d\'affichage';

  @override
  String get showMeetingsInMenuBar =>
      'Afficher les réunions dans la barre de menu';

  @override
  String get upcomingMeetings => 'Réunions à venir';

  @override
  String get deleteKnowledgeGraphQuestion =>
      'Supprimer le graphe de connaissances ?';

  @override
  String get dailyReflectionDescription =>
      'Recevez un rappel à 21h pour réfléchir à votre journée et capturer vos pensées.';

  @override
  String get capabilities => 'Capacités';

  @override
  String get updateApp => 'Mettre à jour l\'application';

  @override
  String get newVersionAvailable => 'Nouvelle version disponible  🎉';

  @override
  String get no => 'Non';

  @override
  String get installs => 'INSTALLATIONS';

  @override
  String get updateReview => 'Mettre à jour l\'avis';

  @override
  String get weekdayMon => 'Lun';

  @override
  String get weekdayTue => 'Mar';

  @override
  String get weekdayWed => 'Mer';

  @override
  String get weekdayThu => 'Jeu';

  @override
  String get weekdayFri => 'Ven';

  @override
  String get weekdaySat => 'Sam';

  @override
  String get weekdaySun => 'Dim';

  @override
  String serviceIntegrationComingSoon(String serviceName) {
    return 'Intégration $serviceName bientôt disponible';
  }

  @override
  String alreadyExportedTo(String platform) {
    return 'Déjà exporté vers $platform';
  }

  @override
  String get anotherPlatform => 'une autre plateforme';

  @override
  String pleaseAuthenticateWithService(String serviceName) {
    return 'Veuillez vous authentifier avec $serviceName dans Paramètres > Intégrations des tâches';
  }

  @override
  String addingToService(String serviceName) {
    return 'Ajout à $serviceName...';
  }

  @override
  String addedToService(String serviceName) {
    return 'Ajouté à $serviceName';
  }

  @override
  String failedToAddToService(String serviceName) {
    return 'Échec de l\'ajout à $serviceName';
  }

  @override
  String get permissionDeniedForAppleReminders =>
      'Autorisation refusée pour Apple Reminders';

  @override
  String get createAKey => 'Créer une clé';

  @override
  String get revokeKey => 'Révoquer la clé';

  @override
  String get revoke => 'Révoquer';

  @override
  String get revokeKeyQuestion => 'Révoquer la clé ?';

  @override
  String revokeKeyConfirmation(String keyName) {
    return 'Êtes-vous sûr de vouloir révoquer la clé \"$keyName\" ? Cette action est irréversible.';
  }

  @override
  String get createNewKey => 'Créer une nouvelle clé';

  @override
  String get keyNameHint => 'ex. Claude Desktop';

  @override
  String get pleaseEnterAName => 'Veuillez entrer un nom.';

  @override
  String failedToCreateKeyWithError(String error) {
    return 'Échec de la création de la clé : $error';
  }

  @override
  String get failedToCreateKeyTryAgain =>
      'Échec de la création de la clé. Veuillez réessayer.';

  @override
  String get keyCreated => 'Clé créée';

  @override
  String get keyCreatedMessage =>
      'Votre nouvelle clé a été créée. Veuillez la copier maintenant. Vous ne pourrez plus la voir.';

  @override
  String get keyWord => 'Clé';

  @override
  String get noExternalAppsHaveAccess =>
      'Aucune application externe n\'a accès à vos données.';

  @override
  String get maximumSecurityE2ee => 'Sécurité maximale (E2EE)';

  @override
  String get e2eeDescription =>
      'Le chiffrement de bout en bout est la référence en matière de confidentialité. Lorsqu\'il est activé, vos données sont chiffrées sur votre appareil avant d\'être envoyées à nos serveurs. Cela signifie que personne, pas même Toki, ne peut accéder à votre contenu.';

  @override
  String get importantTradeoffs => 'Compromis importants :';

  @override
  String get e2eeTradeoff1 =>
      '• Certaines fonctionnalités comme les intégrations d\'applications externes peuvent être désactivées.';

  @override
  String get e2eeTradeoff2 =>
      '• Si vous perdez votre mot de passe, vos données ne peuvent pas être récupérées.';

  @override
  String get featureComingSoon => 'Cette fonctionnalité arrive bientôt !';

  @override
  String get migrationInProgressMessage =>
      'Migration en cours. Vous ne pouvez pas modifier le niveau de protection tant qu\'elle n\'est pas terminée.';

  @override
  String get migrationFailed => 'Échec de la migration';

  @override
  String migratingFromTo(String source, String target) {
    return 'Migration de $source vers $target';
  }

  @override
  String objectsCount(String processed, String total) {
    return '$processed / $total objets';
  }

  @override
  String get secureEncryption => 'Chiffrement sécurisé';

  @override
  String get secureEncryptionDescription =>
      'Vos données sont chiffrées avec une clé unique sur nos serveurs, hébergés sur Google Cloud. Cela signifie que votre contenu brut est inaccessible à quiconque, y compris le personnel d\'Toki ou Google, directement depuis la base de données.';

  @override
  String get endToEndEncryption => 'Chiffrement de bout en bout';

  @override
  String get e2eeCardDescription =>
      'Activez pour une sécurité maximale où seul vous pouvez accéder à vos données. Appuyez pour en savoir plus.';

  @override
  String get dataAlwaysEncrypted =>
      'Quel que soit le niveau, vos données sont toujours chiffrées au repos et en transit.';

  @override
  String get readOnlyScope => 'Lecture seule';

  @override
  String get fullAccessScope => 'Accès complet';

  @override
  String get readScope => 'Lecture';

  @override
  String get writeScope => 'Écriture';

  @override
  String get apiKeyCreated => 'Clé API créée !';

  @override
  String get saveKeyWarning =>
      'Enregistrez cette clé maintenant ! Vous ne pourrez plus la voir.';

  @override
  String get yourApiKey => 'VOTRE CLÉ API';

  @override
  String get tapToCopy => 'Appuyez pour copier';

  @override
  String get copyKey => 'Copier la clé';

  @override
  String get createApiKey => 'Créer une clé API';

  @override
  String get accessDataProgrammatically =>
      'Accédez à vos données par programmation';

  @override
  String get keyNameLabel => 'NOM DE LA CLÉ';

  @override
  String get keyNamePlaceholder => 'ex., Mon intégration';

  @override
  String get permissionsLabel => 'AUTORISATIONS';

  @override
  String get permissionsInfoNote =>
      'R = Lecture, W = Écriture. Lecture seule par défaut si rien n\'est sélectionné.';

  @override
  String get developerApi => 'API développeur';

  @override
  String get createAKeyToGetStarted => 'Créez une clé pour commencer';

  @override
  String errorWithMessage(String error) {
    return 'Erreur : $error';
  }

  @override
  String get active => 'Actif';

  @override
  String get configure => 'Configurer';

  @override
  String get privacyInformation => 'Informations de confidentialité';

  @override
  String get yourPrivacyMattersToUs => 'Votre vie privée nous tient à cœur';

  @override
  String get privacyIntroText =>
      'Chez Toki, nous prenons votre vie privée très au sérieux. Nous voulons être transparents sur les données que nous collectons et comment nous les utilisons. Voici ce que vous devez savoir :';

  @override
  String get whatWeTrack => 'Ce que nous suivons';

  @override
  String get anonymityAndPrivacy => 'Anonymat et confidentialité';

  @override
  String get optInAndOptOutOptions => 'Options d\'acceptation et de refus';

  @override
  String get ourCommitment => 'Notre engagement';

  @override
  String get commitmentText =>
      'Nous nous engageons à n\'utiliser les données collectées que pour améliorer Toki pour vous. Votre vie privée et votre confiance sont primordiales pour nous.';

  @override
  String get thankYouText =>
      'Merci d\'être un utilisateur précieux d\'Toki. Si vous avez des questions ou des préoccupations, n\'hésitez pas à nous contacter à team@basedhardware.com.';

  @override
  String get password => 'Mot de passe';

  @override
  String summaryGeneratedForDate(String date) {
    return 'Résumé généré pour $date';
  }

  @override
  String get failedToGenerateSummaryCheckConversations =>
      'Échec de la génération du résumé. Assurez-vous d\'avoir des conversations pour ce jour.';

  @override
  String get summaryNotFound => 'Résumé non trouvé';

  @override
  String get yourDaysJourney => 'Votre parcours du jour';

  @override
  String get highlights => 'Points forts';

  @override
  String get unresolvedQuestions => 'Questions non résolues';

  @override
  String get decisions => 'Décisions';

  @override
  String get learnings => 'Apprentissages';

  @override
  String get autoDeletesAfterThreeDays =>
      'Suppression automatique après 3 jours.';

  @override
  String get knowledgeGraphDeletedSuccessfully =>
      'Graphe de connaissances supprimé avec succès';

  @override
  String get exportStartedMayTakeFewSeconds =>
      'Exportation commencée. Cela peut prendre quelques secondes...';

  @override
  String get knowledgeGraphDeleteDescription =>
      'Ceci supprimera toutes les données dérivées du graphe de connaissances (nœuds et connexions). Vos souvenirs originaux resteront en sécurité. Le graphe sera reconstruit au fil du temps ou à la prochaine demande.';

  @override
  String accessesDataTypes(String dataTypes) {
    return 'Accède à $dataTypes';
  }

  @override
  String triggeredByType(String triggerType) {
    return 'déclenché par $triggerType';
  }

  @override
  String accessesAndTriggeredBy(
    String accessDescription,
    String triggerDescription,
  ) {
    return '$accessDescription et est $triggerDescription.';
  }

  @override
  String isTriggeredBy(String triggerDescription) {
    return 'Est $triggerDescription.';
  }

  @override
  String get noSpecificDataAccessConfigured =>
      'Aucun accès aux données spécifique configuré.';

  @override
  String get minutes => 'minutes';

  @override
  String get setupOnDevice => 'Configurer sur l\'appareil';

  @override
  String get importHistory => 'Historique d\'importation';

  @override
  String get noImportsYet => 'Aucune importation pour le moment';

  @override
  String get selectZipFileToImport =>
      'Sélectionnez le fichier .zip à importer!';

  @override
  String get otherDevicesComingSoon => 'Autres appareils bientôt disponibles';

  @override
  String get deleteAllLimitlessConversations =>
      'Supprimer toutes les conversations Limitless?';

  @override
  String get deleteAllLimitlessWarning =>
      'Cela supprimera définitivement toutes les conversations importées de Limitless. Cette action ne peut pas être annulée.';

  @override
  String deletedLimitlessConversations(int count) {
    return '$count conversations Limitless supprimées';
  }

  @override
  String get failedToDeleteConversations =>
      'Échec de la suppression des conversations';

  @override
  String get deleteImportedData => 'Supprimer les données importées';

  @override
  String get statusPending => 'En attente';

  @override
  String get statusProcessing => 'Traitement';

  @override
  String get statusCompleted => 'Terminé';

  @override
  String get statusFailed => 'Échoué';

  @override
  String nConversations(int count) {
    return '$count conversations';
  }

  @override
  String get pleaseEnterName => 'Veuillez entrer un nom';

  @override
  String get nameMustBeBetweenCharacters =>
      'Le nom doit comporter entre 2 et 40 caractères';

  @override
  String get deleteSampleQuestion => 'Supprimer l\'échantillon?';

  @override
  String deleteSampleConfirmation(String name) {
    return 'Êtes-vous sûr de vouloir supprimer l\'échantillon de $name?';
  }

  @override
  String get confirmDeletion => 'Confirmer la suppression';

  @override
  String deletePersonConfirmation(String name) {
    return 'Êtes-vous sûr de vouloir supprimer $name? Cela supprimera également tous les échantillons vocaux associés.';
  }

  @override
  String get howItWorksTitle => 'Comment ça marche?';

  @override
  String get howPeopleWorks =>
      'Une fois qu\'une personne est créée, vous pouvez aller dans la transcription d\'une conversation et lui attribuer les segments correspondants, ainsi Toki pourra également reconnaître sa voix!';

  @override
  String get tapToDelete => 'Appuyez pour supprimer';

  @override
  String get newTag => 'NOUVEAU';

  @override
  String get localStorageEnabled => 'Stockage local activé';

  @override
  String get localStorageDisabled => 'Stockage local désactivé';

  @override
  String failedToUpdateSettings(String error) {
    return 'Échec de la mise à jour des paramètres : $error';
  }

  @override
  String get privacyNotice => 'Avis de confidentialité';

  @override
  String get recordingsMayCaptureOthers =>
      'Les enregistrements peuvent capturer les voix d\'autres personnes. Assurez-vous d\'avoir le consentement de tous les participants avant d\'activer.';

  @override
  String get enable => 'Activer';

  @override
  String get storeAudioOnPhone => 'Stocker l\'audio sur le téléphone';

  @override
  String get on => 'On';

  @override
  String get storeAudioDescription =>
      'Conservez tous les enregistrements audio stockés localement sur votre téléphone. Lorsque désactivé, seuls les téléchargements échoués sont conservés pour économiser de l\'espace.';

  @override
  String get enableLocalStorage => 'Activer le stockage local';

  @override
  String get cloudStorageEnabled => 'Stockage cloud activé';

  @override
  String get cloudStorageDisabled => 'Stockage cloud désactivé';

  @override
  String get enableCloudStorage => 'Activer le stockage cloud';

  @override
  String get storeAudioOnCloud => 'Stocker l\'audio dans le cloud';

  @override
  String get cloudStorageDialogMessage =>
      'Vos enregistrements en temps réel seront stockés dans un stockage cloud privé pendant que vous parlez.';

  @override
  String get storeAudioCloudDescription =>
      'Stockez vos enregistrements en temps réel dans un stockage cloud privé pendant que vous parlez. L\'audio est capturé et enregistré en toute sécurité en temps réel.';

  @override
  String get downloadingFirmware => 'Téléchargement du firmware';

  @override
  String get installingFirmware => 'Installation du firmware';

  @override
  String get firmwareUpdateWarning =>
      'Ne fermez pas l\'application et n\'éteignez pas l\'appareil. Cela pourrait endommager votre appareil.';

  @override
  String get firmwareUpdated => 'Firmware mis à jour';

  @override
  String restartDeviceToComplete(Object deviceName) {
    return 'Veuillez redémarrer votre $deviceName pour terminer la mise à jour.';
  }

  @override
  String get yourDeviceIsUpToDate => 'Votre appareil est à jour';

  @override
  String get currentVersion => 'Version actuelle';

  @override
  String get latestVersion => 'Dernière version';

  @override
  String get whatsNew => 'Nouveautés';

  @override
  String get installUpdate => 'Installer la mise à jour';

  @override
  String get updateNow => 'Mettre à jour maintenant';

  @override
  String get updateGuide => 'Guide de mise à jour';

  @override
  String get checkingForUpdates => 'Recherche de mises à jour';

  @override
  String get checkingFirmwareVersion =>
      'Vérification de la version du firmware...';

  @override
  String get firmwareUpdate => 'Mise à jour du firmware';

  @override
  String get payments => 'Paiements';

  @override
  String get connectPaymentMethodInfo =>
      'Connectez un mode de paiement ci-dessous pour commencer à recevoir des paiements pour vos applications.';

  @override
  String get selectedPaymentMethod => 'Mode de paiement sélectionné';

  @override
  String get availablePaymentMethods => 'Modes de paiement disponibles';

  @override
  String get setActive => 'Définir comme actif';

  @override
  String get getPaidThroughStripe =>
      'Recevez des paiements pour vos ventes d\'applications via Stripe';

  @override
  String get monthlyPayouts => 'Paiements mensuels';

  @override
  String get monthlyPayoutsDescription =>
      'Recevez des paiements mensuels directement sur votre compte lorsque vous atteignez 10 \$ de gains';

  @override
  String get secureAndReliable => 'Sécurisé et fiable';

  @override
  String get stripeSecureDescription =>
      'Stripe assure des transferts sécurisés et ponctuels des revenus de votre application';

  @override
  String get selectYourCountry => 'Sélectionnez votre pays';

  @override
  String get countrySelectionPermanent =>
      'Votre sélection de pays est permanente et ne peut pas être modifiée ultérieurement.';

  @override
  String get byClickingConnectNow =>
      'En cliquant sur \"Connecter maintenant\", vous acceptez';

  @override
  String get stripeConnectedAccountAgreement =>
      'Accord de compte connecté Stripe';

  @override
  String get errorConnectingToStripe =>
      'Erreur de connexion à Stripe ! Veuillez réessayer plus tard.';

  @override
  String get connectingYourStripeAccount => 'Connexion de votre compte Stripe';

  @override
  String get stripeOnboardingInstructions =>
      'Veuillez compléter le processus d\'intégration Stripe dans votre navigateur. Cette page se mettra à jour automatiquement une fois terminé.';

  @override
  String get failedTryAgain => 'Échec ? Réessayer';

  @override
  String get illDoItLater => 'Je le ferai plus tard';

  @override
  String get successfullyConnected => 'Connexion réussie !';

  @override
  String get stripeReadyForPayments =>
      'Votre compte Stripe est maintenant prêt à recevoir des paiements. Vous pouvez commencer à gagner de l\'argent grâce aux ventes de vos applications dès maintenant.';

  @override
  String get updateStripeDetails => 'Mettre à jour les détails Stripe';

  @override
  String get errorUpdatingStripeDetails =>
      'Erreur lors de la mise à jour des détails Stripe ! Veuillez réessayer plus tard.';

  @override
  String get updatePayPal => 'Mettre à jour PayPal';

  @override
  String get setUpPayPal => 'Configurer PayPal';

  @override
  String get updatePayPalAccountDetails =>
      'Mettez à jour les détails de votre compte PayPal';

  @override
  String get connectPayPalToReceivePayments =>
      'Connectez votre compte PayPal pour commencer à recevoir des paiements pour vos applications';

  @override
  String get paypalEmail => 'E-mail PayPal';

  @override
  String get paypalMeLink => 'Lien PayPal.me';

  @override
  String get stripeRecommendation =>
      'Si Stripe est disponible dans votre pays, nous vous recommandons fortement de l\'utiliser pour des paiements plus rapides et plus faciles.';

  @override
  String get updatePayPalDetails => 'Mettre à jour les détails PayPal';

  @override
  String get savePayPalDetails => 'Enregistrer les détails PayPal';

  @override
  String get pleaseEnterPayPalEmail => 'Veuillez entrer votre e-mail PayPal';

  @override
  String get pleaseEnterPayPalMeLink => 'Veuillez entrer votre lien PayPal.me';

  @override
  String get doNotIncludeHttpInLink =>
      'N\'incluez pas http ou https ou www dans le lien';

  @override
  String get pleaseEnterValidPayPalMeLink =>
      'Veuillez entrer un lien PayPal.me valide';

  @override
  String get pleaseEnterValidEmail =>
      'Veuillez entrer une adresse e-mail valide';

  @override
  String get syncingYourRecordings => 'Synchronisation de vos enregistrements';

  @override
  String get syncYourRecordings => 'Synchroniser vos enregistrements';

  @override
  String get syncNow => 'Synchroniser maintenant';

  @override
  String get error => 'Erreur';

  @override
  String get speechSamples => 'Échantillons vocaux';

  @override
  String additionalSampleIndex(String index) {
    return 'Échantillon supplémentaire $index';
  }

  @override
  String durationSeconds(String seconds) {
    return 'Durée : $seconds secondes';
  }

  @override
  String get additionalSpeechSampleRemoved =>
      'Échantillon vocal supplémentaire supprimé';

  @override
  String get consentDataMessage =>
      'En continuant, toutes les données que vous partagez avec cette application (y compris vos conversations, enregistrements et informations personnelles) seront stockées en toute sécurité sur nos serveurs pour vous fournir des informations basées sur l\'IA et activer toutes les fonctionnalités de l\'application.';

  @override
  String get tasksEmptyStateMessage =>
      'Les tâches de vos conversations apparaîtront ici.\nAppuyez sur + pour en créer une manuellement.';

  @override
  String get clearChatAction => 'Effacer le chat';

  @override
  String get omiAppName => 'Toki';

  @override
  String get showMore => 'afficher plus ↓';

  @override
  String get showLess => 'afficher moins ↑';

  @override
  String get loadingYourRecording => 'Chargement de votre enregistrement...';

  @override
  String get photoDiscardedMessage =>
      'Cette photo a été écartée car elle n\'était pas significative.';

  @override
  String get analyzing => 'Analyse en cours...';

  @override
  String get searchCountries => 'Rechercher des pays...';

  @override
  String get checkingAppleWatch => 'Vérification de l\'Apple Watch...';

  @override
  String get installOmiOnAppleWatch => 'Installez Toki sur votre\nApple Watch';

  @override
  String get installOmiOnAppleWatchDescription =>
      'Pour utiliser votre Apple Watch avec Toki, vous devez d\'abord installer l\'application Toki sur votre montre.';

  @override
  String get openOmiOnAppleWatch => 'Ouvrez Toki sur votre\nApple Watch';

  @override
  String get openOmiOnAppleWatchDescription =>
      'L\'application Toki est installée sur votre Apple Watch. Ouvrez-la et appuyez sur Démarrer.';

  @override
  String get openWatchApp => 'Ouvrir l\'app Watch';

  @override
  String get iveInstalledAndOpenedTheApp =>
      'J\'ai installé et ouvert l\'application';

  @override
  String get unableToOpenWatchApp =>
      'Impossible d\'ouvrir l\'app Apple Watch. Ouvrez manuellement l\'app Watch sur votre Apple Watch et installez Toki depuis la section \"Apps disponibles\".';

  @override
  String get appleWatchConnectedSuccessfully =>
      'Apple Watch connectée avec succès !';

  @override
  String get appleWatchNotReachable =>
      'Apple Watch toujours inaccessible. Assurez-vous que l\'application Toki est ouverte sur votre montre.';

  @override
  String errorCheckingConnection(String error) {
    return 'Erreur lors de la vérification de la connexion : $error';
  }

  @override
  String get muted => 'Muet';

  @override
  String get processNow => 'Traiter maintenant';

  @override
  String get finishedConversation => 'Conversation terminée ?';

  @override
  String get stopRecordingConfirmation =>
      'Voulez-vous vraiment arrêter l\'enregistrement et résumer la conversation maintenant ?';

  @override
  String get conversationEndsManually =>
      'La conversation ne se terminera que manuellement.';

  @override
  String conversationSummarizedAfterMinutes(int minutes, String suffix) {
    return 'La conversation est résumée après $minutes minute$suffix sans parole.';
  }

  @override
  String get dontAskAgain => 'Ne plus me demander';

  @override
  String get waitingForTranscriptOrPhotos =>
      'En attente de transcription ou de photos...';

  @override
  String get noSummaryYet => 'Pas encore de résumé';

  @override
  String hints(String text) {
    return 'Conseils : $text';
  }

  @override
  String get testConversationPrompt => 'Tester un prompt de conversation';

  @override
  String get prompt => 'Invite';

  @override
  String get result => 'Résultat :';

  @override
  String get compareTranscripts => 'Comparer les transcriptions';

  @override
  String get notHelpful => 'Pas utile';

  @override
  String get exportTasksWithOneTap => 'Exportez vos tâches en un clic !';

  @override
  String get inProgress => 'En cours';

  @override
  String get photos => 'Photos';

  @override
  String get rawData => 'Données brutes';

  @override
  String get content => 'Contenu';

  @override
  String get noContentToDisplay => 'Aucun contenu à afficher';

  @override
  String get noSummary => 'Pas de résumé';

  @override
  String get updateOmiFirmware => 'Mettre à jour le firmware omi';

  @override
  String loadMoreRemaining(String count) {
    return 'Charger plus ($count restants)';
  }

  @override
  String wrappedTopPercentUser(String percentile) {
    return 'Top $percentile% Utilisateur';
  }

  @override
  String get wrappedMinutes => 'minutes';

  @override
  String get wrappedConversations => 'conversations';

  @override
  String get wrappedDaysActive => 'jours actifs';

  @override
  String get wrappedYouTalkedAbout => 'Vous avez parlé de';

  @override
  String get wrappedActionItems => 'Tâches';

  @override
  String get wrappedTasksCreated => 'tâches créées';

  @override
  String get wrappedCompleted => 'terminées';

  @override
  String wrappedCompletionRate(String rate) {
    return '$rate% taux de réalisation';
  }

  @override
  String get wrappedBestMoments => 'Meilleurs moments';

  @override
  String get wrappedMyBuddies => 'Mes amis';

  @override
  String get wrappedCouldntStopTalkingAbout =>
      'Je n\'arrêtais pas de parler de';

  @override
  String get wrappedShow => 'SÉRIE';

  @override
  String get wrappedMovie => 'FILM';

  @override
  String get wrappedBook => 'LIVRE';

  @override
  String get wrappedCelebrity => 'CÉLÉBRITÉ';

  @override
  String get wrappedFood => 'NOURRITURE';

  @override
  String get wrappedMovieRecs => 'Recommandations de films';

  @override
  String get wrappedBiggest => 'Plus grand';

  @override
  String get wrappedStruggle => 'Défi';

  @override
  String get wrappedButYouPushedThrough => 'Mais vous y êtes arrivé 💪';

  @override
  String get wrappedWin => 'Victoire';

  @override
  String get wrappedYouDidIt => 'Vous l\'avez fait ! 🎉';

  @override
  String get wrappedTopPhrases => 'Top 5 phrases';

  @override
  String get wrappedMins => 'min';

  @override
  String get wrappedConvos => 'conversations';

  @override
  String get wrappedDays => 'jours';

  @override
  String get wrappedMyBuddiesLabel => 'MES AMIS';

  @override
  String get wrappedObsessionsLabel => 'OBSESSIONS';

  @override
  String get wrappedStruggleLabel => 'DÉFI';

  @override
  String get wrappedWinLabel => 'VICTOIRE';

  @override
  String get wrappedTopPhrasesLabel => 'EXPRESSIONS FAVORITES';

  @override
  String get wrappedLetsHitRewind => 'Rembobinons ton';

  @override
  String get wrappedGenerateMyWrapped => 'Générer mon Wrapped';

  @override
  String get wrappedProcessingDefault => 'Traitement...';

  @override
  String get wrappedCreatingYourStory => 'Création de ton\nhistoire 2025...';

  @override
  String get wrappedSomethingWentWrong => 'Quelque chose\ns\'est mal passé';

  @override
  String get wrappedAnErrorOccurred => 'Une erreur s\'est produite';

  @override
  String get wrappedTryAgain => 'Réessayer';

  @override
  String get wrappedNoDataAvailable => 'Aucune donnée disponible';

  @override
  String get wrappedOmiLifeRecap => 'Récap vie Toki';

  @override
  String get wrappedSwipeUpToBegin => 'Glisse vers le haut pour commencer';

  @override
  String get wrappedShareText => 'Mon 2025, mémorisé par Toki ✨ omi.me/wrapped';

  @override
  String get wrappedFailedToShare => 'Échec du partage. Veuillez réessayer.';

  @override
  String get wrappedFailedToStartGeneration =>
      'Échec du démarrage de la génération. Veuillez réessayer.';

  @override
  String get wrappedStarting => 'Démarrage...';

  @override
  String get wrappedShare => 'Partager';

  @override
  String get wrappedMy2025 => 'Mon 2025';

  @override
  String get wrappedRememberedByOmi => 'mémorisé par Toki';

  @override
  String get wrappedMostFunDay => 'Plus amusant';

  @override
  String get wrappedMostProductiveDay => 'Plus productif';

  @override
  String get wrappedMostIntenseDay => 'Plus intense';

  @override
  String get wrappedFunniestMoment => 'Plus drôle';

  @override
  String get wrappedMostCringeMoment => 'Plus gênant';

  @override
  String get wrappedTasksGenerated => 'tâches générées';

  @override
  String get wrappedTasksCompleted => 'tâches complétées';

  @override
  String get wrappedTopFivePhrases => 'Top 5 des phrases';

  @override
  String get wrappedAGreatDay => 'Une super journée';

  @override
  String get wrappedGettingItDone => 'Accomplir les choses';

  @override
  String get wrappedAChallenge => 'Un défi';

  @override
  String get wrappedAHilariousMoment => 'Un moment hilarant';

  @override
  String get wrappedThatAwkwardMoment => 'Ce moment gênant';

  @override
  String get wrappedYouHadFunnyMoments =>
      'Tu as eu des moments drôles cette année !';

  @override
  String get wrappedWeveAllBeenThere => 'On est tous passés par là !';

  @override
  String get wrappedFriend => 'Ami';

  @override
  String get wrappedYourBuddy => 'Ton pote !';

  @override
  String get wrappedNotMentioned => 'Non mentionné';

  @override
  String get wrappedTheHardPart => 'La partie difficile';

  @override
  String get wrappedPersonalGrowth => 'Développement personnel';

  @override
  String get wrappedFunDay => 'Amusant';

  @override
  String get wrappedProductiveDay => 'Productif';

  @override
  String get wrappedIntenseDay => 'Intense';

  @override
  String get wrappedFunnyMomentTitle => 'Moment drôle';

  @override
  String get wrappedCringeMomentTitle => 'Moment gênant';

  @override
  String get wrappedCompletedLabel => 'Complété';

  @override
  String get wrappedMyBuddiesCard => 'Mes potes';

  @override
  String get wrappedBuddiesLabel => 'POTES';

  @override
  String get wrappedObsessionsLabelUpper => 'OBSESSIONS';

  @override
  String get wrappedStruggleLabelUpper => 'COMBAT';

  @override
  String get wrappedWinLabelUpper => 'VICTOIRE';

  @override
  String get wrappedTopPhrasesLabelUpper => 'EXPRESSIONS FAVORITES';

  @override
  String get wrappedBestHeader => 'Meilleurs';

  @override
  String get wrappedMomentsHeader => 'Moments forts';

  @override
  String get wrappedBestMomentsBadge => 'Meilleurs moments';

  @override
  String get wrappedBiggestHeader => 'Plus grand';

  @override
  String get wrappedStruggleHeader => 'Combat';

  @override
  String get wrappedWinHeader => 'Victoire';

  @override
  String get wrappedButYouPushedThroughEmoji => 'Mais tu as persévéré 💪';

  @override
  String get wrappedYouDidItEmoji => 'Tu l\'as fait ! 🎉';

  @override
  String get wrappedHours => 'heures';

  @override
  String get wrappedActions => 'actions';

  @override
  String get multipleSpeakersDetected => 'Plusieurs interlocuteurs détectés';

  @override
  String get multipleSpeakersDescription =>
      'Il semble qu\'il y ait plusieurs interlocuteurs dans l\'enregistrement. Assurez-vous d\'être dans un endroit calme et réessayez.';

  @override
  String get invalidRecordingDetected => 'Enregistrement invalide détecté';

  @override
  String get notEnoughSpeechDescription =>
      'Pas assez de parole détectée. Veuillez parler davantage et réessayer.';

  @override
  String get speechDurationDescription =>
      'Assurez-vous de parler au moins 5 secondes et pas plus de 90.';

  @override
  String get connectionLostDescription =>
      'La connexion a été interrompue. Veuillez vérifier votre connexion Internet et réessayer.';

  @override
  String get howToTakeGoodSample => 'Comment faire un bon échantillon ?';

  @override
  String get goodSampleInstructions =>
      '1. Assurez-vous d\'être dans un endroit calme.\n2. Parlez clairement et naturellement.\n3. Assurez-vous que votre appareil est dans sa position naturelle sur votre cou.\n\nUne fois créé, vous pouvez toujours l\'améliorer ou le refaire.';

  @override
  String get noDeviceConnectedUseMic =>
      'Aucun appareil connecté. Le microphone du téléphone sera utilisé.';

  @override
  String get doItAgain => 'Refaire';

  @override
  String get listenToSpeechProfile => 'Écouter mon profil vocal ➡️';

  @override
  String get recognizingOthers => 'Reconnaître les autres 👀';

  @override
  String get keepGoingGreat => 'Continuez, vous vous en sortez très bien';

  @override
  String get somethingWentWrongTryAgain =>
      'Une erreur s\'est produite ! Veuillez réessayer plus tard.';

  @override
  String get uploadingVoiceProfile =>
      'Téléchargement de votre profil vocal....';

  @override
  String get memorizingYourVoice => 'Mémorisation de votre voix...';

  @override
  String get personalizingExperience =>
      'Personnalisation de votre expérience...';

  @override
  String get notificationFrequency => 'Fréquence des notifications';

  @override
  String get dailyScoreBreakdown => 'Détail du score quotidien';

  @override
  String get todaysScore => 'Score du jour';

  @override
  String get tasksCompleted => 'Tâches terminées';

  @override
  String get completionRate => 'Taux de complétion';

  @override
  String get howItWorks => 'Comment ça marche';

  @override
  String get dailyScoreExplanation =>
      'Votre score quotidien est basé sur l\'achèvement des tâches. Terminez vos tâches pour améliorer votre score!';

  @override
  String get notificationFrequencyDescription =>
      'Contrôlez la fréquence à laquelle Toki vous envoie des notifications proactives et des rappels.';

  @override
  String get sliderOff => 'Désactivé';

  @override
  String get sliderMax => 'Max.';

  @override
  String summaryGeneratedFor(String date) {
    return 'Résumé généré pour le $date';
  }

  @override
  String get failedToGenerateSummary =>
      'Échec de la génération du résumé. Assurez-vous d\'avoir des conversations pour ce jour.';

  @override
  String deleteQuoted(String name) {
    return 'Supprimer « $name »';
  }

  @override
  String moveConversationsTo(int count) {
    return 'Déplacer $count conversations vers :';
  }

  @override
  String get noFolder => 'Sans dossier';

  @override
  String get removeFromAllFolders => 'Retirer de tous les dossiers';

  @override
  String get frequencyOff => 'Désactivé';

  @override
  String get frequencyMinimal => 'Minimal';

  @override
  String get frequencyLow => 'Faible';

  @override
  String get frequencyBalanced => 'Équilibré';

  @override
  String get frequencyHigh => 'Élevé';

  @override
  String get frequencyMaximum => 'Maximum';

  @override
  String get frequencyDescOff => 'Pas de notifications proactives';

  @override
  String get frequencyDescMinimal => 'Rappels critiques uniquement';

  @override
  String get frequencyDescLow => 'Mises à jour importantes uniquement';

  @override
  String get frequencyDescBalanced => 'Rappels utiles réguliers';

  @override
  String get frequencyDescHigh => 'Vérifications fréquentes';

  @override
  String get frequencyDescMaximum => 'Restez constamment engagé';

  @override
  String get clearChatQuestion => 'Effacer la conversation ?';

  @override
  String get syncingMessages =>
      'Synchronisation des messages avec le serveur...';

  @override
  String get disable => 'Désactiver';

  @override
  String get photoLibrary => 'Photothèque';

  @override
  String get chooseFile => 'Choisir un fichier';

  @override
  String get configureAiPersona => 'Configurez votre personnage IA';

  @override
  String get connectAiAssistantsToYourData =>
      'Connectez des assistants IA à vos données';

  @override
  String get oAuth => 'OAuth';

  @override
  String get trackYourGoalsOnHomepage =>
      'Suivez vos objectifs personnels sur la page d\'accueil';

  @override
  String get deleteRecording => 'Supprimer l\'enregistrement';

  @override
  String get thisCannotBeUndone => 'Cette action est irréversible.';

  @override
  String get sdCard => 'SD Card';

  @override
  String get fromSd => 'Depuis SD';

  @override
  String get limitless => 'Limitless';

  @override
  String get fastTransfer => 'Transfert rapide';

  @override
  String get syncingStatus => 'Synchronisation';

  @override
  String get failedStatus => 'Échoué';

  @override
  String etaLabel(String time) {
    return 'ETA: $time';
  }

  @override
  String get transferMethod => 'Méthode de transfert';

  @override
  String get fast => 'Rapide';

  @override
  String get ble => 'BLE';

  @override
  String get phone => 'Téléphone';

  @override
  String get cancelSync => 'Annuler la synchronisation';

  @override
  String get cancelSyncMessage =>
      'Les données déjà téléchargées seront sauvegardées. Vous pouvez reprendre plus tard.';

  @override
  String get syncCancelled => 'Synchronisation annulée';

  @override
  String get wifiEnableFailed =>
      'Échec de l\'activation du WiFi sur l\'appareil. Veuillez réessayer.';

  @override
  String get deviceNoFastTransfer =>
      'Votre appareil ne prend pas en charge le transfert rapide. Utilisez le Bluetooth à la place.';

  @override
  String get enableHotspotMessage =>
      'Veuillez activer le point d\'accès de votre téléphone et réessayer.';

  @override
  String get transferStartFailed =>
      'Échec du démarrage du transfert. Veuillez réessayer.';

  @override
  String get deviceNotResponding =>
      'L\'appareil n\'a pas répondu. Veuillez réessayer.';

  @override
  String get invalidWifiCredentials =>
      'Identifiants WiFi invalides. Vérifiez les paramètres de votre point d\'accès.';

  @override
  String get wifiConnectionFailed =>
      'La connexion WiFi a échoué. Veuillez réessayer.';

  @override
  String get sdCardProcessing => 'Traitement de la carte SD';

  @override
  String sdCardProcessingMessage(int count) {
    return 'Traitement de $count enregistrement(s). Les fichiers seront supprimés de la carte SD ensuite.';
  }

  @override
  String get process => 'Traiter';

  @override
  String get wifiSyncFailed => 'Échec de la synchronisation WiFi';

  @override
  String get processingFailed => 'Échec du traitement';

  @override
  String processingProgress(int current, int total) {
    return 'Traitement $current/$total';
  }

  @override
  String conversationsCreated(int count) {
    return '$count conversations créées';
  }

  @override
  String get internetRequired => 'Connexion Internet requise';

  @override
  String get processAudio => 'Traiter l\'audio';

  @override
  String get start => 'Démarrer';

  @override
  String get noRecordings => 'Aucun enregistrement';

  @override
  String get audioFromOmiWillAppearHere =>
      'L\'audio de votre appareil Toki apparaîtra ici';

  @override
  String get recordings => 'Enregistrements';

  @override
  String get enableRemindersAccess =>
      'Veuillez activer l\'accès aux Rappels dans les Réglages pour utiliser les Rappels Apple';

  @override
  String todayAtTime(String time) {
    return 'Aujourd\'hui à $time';
  }

  @override
  String yesterdayAtTime(String time) {
    return 'Hier à $time';
  }

  @override
  String get lessThanAMinute => 'Moins d\'une minute';

  @override
  String estimatedMinutes(int count) {
    return '~$count minute(s)';
  }

  @override
  String estimatedHours(int count) {
    return '~$count heure(s)';
  }

  @override
  String estimatedTimeRemaining(String time) {
    return 'Estimation : $time restant';
  }

  @override
  String get summarizingConversation =>
      'Résumé de la conversation...\nCela peut prendre quelques secondes';

  @override
  String get resummarizingConversation =>
      'Nouveau résumé de la conversation...\nCela peut prendre quelques secondes';

  @override
  String get nothingInterestingRetry =>
      'Rien d\'intéressant trouvé,\nvoulez-vous réessayer ?';

  @override
  String get noSummaryForConversation =>
      'Aucun résumé disponible\npour cette conversation.';

  @override
  String get unknownLocation => 'Lieu inconnu';

  @override
  String get couldNotLoadMap => 'Impossible de charger la carte';

  @override
  String get triggerConversationIntegration =>
      'Déclencher l\'intégration de création de conversation';

  @override
  String get webhookUrlNotSet => 'URL du webhook non définie';

  @override
  String get setWebhookUrlInSettings =>
      'Veuillez définir l\'URL du webhook dans les paramètres développeur.';

  @override
  String get debugModeDetected => 'Mode débogage détecté';

  @override
  String get performanceReduced => 'Les performances peuvent être réduites';

  @override
  String autoClosingInSeconds(int seconds) {
    return 'Fermeture automatique dans $seconds secondes';
  }

  @override
  String get modelRequired => 'Modèle requis';

  @override
  String get downloadWhisperModel =>
      'Téléchargez un modèle whisper pour utiliser la transcription sur appareil';

  @override
  String get deviceNotCompatible =>
      'Votre appareil nest pas compatible avec la transcription sur appareil';

  @override
  String get willLikelyCrash =>
      'Activer ceci provoquera probablement le plantage ou le gel de lapplication.';

  @override
  String get transcriptionSlowerLessAccurate =>
      'La transcription sera nettement plus lente et moins précise.';

  @override
  String get proceedAnyway => 'Continuer quand même';

  @override
  String get olderDeviceDetected => 'Ancien appareil détecté';

  @override
  String get batteryUsageHigher =>
      'La consommation de batterie sera plus élevée que la transcription cloud.';

  @override
  String get considerOmiCloud =>
      'Envisagez dutiliser Toki Cloud pour de meilleures performances.';

  @override
  String get highResourceUsage => 'Utilisation élevée des ressources';

  @override
  String get deviceMayWarmUp =>
      'Lappareil peut chauffer lors dune utilisation prolongée.';

  @override
  String get speedAccuracyLower =>
      'La vitesse et la précision peuvent être inférieures aux modèles cloud.';

  @override
  String get cloudProvider => 'Fournisseur cloud';

  @override
  String get model => 'Modèle';

  @override
  String get performanceWarning => 'Avertissement de performance';

  @override
  String get usingNativeIosSpeech =>
      'Utilisation de la reconnaissance vocale native iOS';

  @override
  String get modelReady => 'Modèle prêt';

  @override
  String get doNotCloseApp => 'Veuillez ne pas fermer lapplication.';

  @override
  String get downloading => 'Téléchargement...';

  @override
  String get downloadModel => 'Télécharger le modèle';

  @override
  String estimatedSize(String size) {
    return 'Taille estimée : ~$size Mo';
  }

  @override
  String availableSpace(String space) {
    return 'Espace disponible : $space';
  }

  @override
  String get notEnoughSpace => 'Attention: Pas assez despace!';

  @override
  String get download => 'Télécharger';

  @override
  String downloadError(String error) {
    return 'Erreur de téléchargement : $error';
  }

  @override
  String get cancelled => 'Annulé';

  @override
  String get deviceNotCompatibleTitle => 'Appareil non compatible';

  @override
  String get deviceNotMeetRequirements =>
      'Votre appareil ne répond pas aux exigences pour la transcription sur appareil.';

  @override
  String get transcriptionSlowerOnDevice =>
      'La transcription sur appareil peut être plus lente sur cet appareil.';

  @override
  String get computationallyIntensive =>
      'La transcription sur appareil est gourmande en calculs.';

  @override
  String get batteryDrainSignificantly =>
      'La consommation de batterie augmentera considérablement.';

  @override
  String get audioProcessedLocally =>
      'Laudio est traité localement. Fonctionne hors ligne, plus privé, mais consomme plus de batterie.';

  @override
  String get languageLabel => 'Langue';

  @override
  String get modelLabel => 'Modèle';

  @override
  String get modelTooLargeWarning =>
      'Ce modèle est volumineux et peut provoquer le plantage de lapplication ou un fonctionnement très lent sur les appareils mobiles.\n\nsmall ou base est recommandé.';

  @override
  String get nativeEngineNoDownload =>
      'Le moteur vocal natif de votre appareil sera utilisé. Aucun téléchargement de modèle requis.';

  @override
  String modelReadyWithName(String model) {
    return 'Modèle prêt ($model)';
  }

  @override
  String get reDownload => 'Re-télécharger';

  @override
  String downloadingModelProgress(String model, String received, String total) {
    return 'Téléchargement de $model: $received / $total Mo';
  }

  @override
  String preparingModel(String model) {
    return 'Préparation de $model...';
  }

  @override
  String downloadErrorWithMessage(String error) {
    return 'Erreur de téléchargement: $error';
  }

  @override
  String estimatedSizeWithValue(String size) {
    return 'Taille estimée: ~$size Mo';
  }

  @override
  String availableSpaceWithValue(String space) {
    return 'Espace disponible: $space';
  }

  @override
  String get omiTranscriptionOptimized =>
      'La transcription en direct intégrée dToki est optimisée pour les conversations en temps réel avec détection automatique des interlocuteurs et diarisation.';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get useTemplateFrom => 'Utiliser le modèle de';

  @override
  String get selectProviderTemplate =>
      'Sélectionnez un modèle de fournisseur...';

  @override
  String get quicklyPopulateResponse =>
      'Remplir rapidement avec un format de réponse de fournisseur connu';

  @override
  String get quicklyPopulateRequest =>
      'Remplir rapidement avec un format de requête de fournisseur connu';

  @override
  String get invalidJsonError => 'JSON invalide';

  @override
  String downloadModelWithName(String model) {
    return 'Télécharger le modèle ($model)';
  }

  @override
  String modelNameWithFile(String model) {
    return 'Modèle: $model';
  }

  @override
  String get device => 'Appareil';

  @override
  String get setupCompleted => 'Terminé';

  @override
  String get setupQuestionsIntro =>
      'Aidez-nous à améliorer Toki en répondant à quelques questions. 🫶 💜';

  @override
  String get setupQuestionProfession => '1. Que faites-vous ?';

  @override
  String get setupQuestionUsage =>
      '2. Où prévoyez-vous d\'utiliser votre Toki ?';

  @override
  String get setupQuestionAge => '3. Quelle est votre tranche d\'âge ?';

  @override
  String get setupAnswerAllQuestions =>
      'Vous n\'avez pas encore répondu à toutes les questions ! 🥺';

  @override
  String get setupSkipHelp => 'Passer, je ne veux pas aider :C';

  @override
  String get professionEntrepreneur => 'Entrepreneur';

  @override
  String get professionSoftwareEngineer => 'Ingénieur logiciel';

  @override
  String get professionProductManager => 'Chef de produit';

  @override
  String get professionExecutive => 'Cadre dirigeant';

  @override
  String get professionSales => 'Ventes';

  @override
  String get professionStudent => 'Étudiant';

  @override
  String get usageAtWork => 'Au travail';

  @override
  String get usageIrlEvents => 'Événements IRL';

  @override
  String get usageOnline => 'En ligne';

  @override
  String get usageSocialSettings => 'Dans des contextes sociaux';

  @override
  String get usageEverywhere => 'Partout';

  @override
  String get customBackendUrlTitle => 'URL du serveur personnalisée';

  @override
  String get backendUrlLabel => 'URL du serveur';

  @override
  String get saveUrlButton => 'Enregistrer l\'URL';

  @override
  String get enterBackendUrlError => 'Veuillez entrer l\'URL du serveur';

  @override
  String get urlMustEndWithSlashError => 'L\'URL doit se terminer par \"/\"';

  @override
  String get invalidUrlError => 'Veuillez entrer une URL valide';

  @override
  String get backendUrlSavedSuccess => 'URL du serveur enregistrée !';

  @override
  String get signInTitle => 'Se connecter';

  @override
  String get signInButton => 'Se connecter';

  @override
  String get enterEmailError => 'Veuillez entrer votre e-mail';

  @override
  String get invalidEmailError => 'Veuillez entrer un e-mail valide';

  @override
  String get enterPasswordError => 'Veuillez entrer votre mot de passe';

  @override
  String get passwordMinLengthError =>
      'Le mot de passe doit contenir au moins 8 caractères';

  @override
  String get signInSuccess => 'Connexion réussie !';

  @override
  String get alreadyHaveAccountLogin =>
      'Vous avez déjà un compte ? Connectez-vous';

  @override
  String get emailLabel => 'E-mail';

  @override
  String get passwordLabel => 'Mot de passe';

  @override
  String get createAccountTitle => 'Créer un compte';

  @override
  String get nameLabel => 'Nom';

  @override
  String get repeatPasswordLabel => 'Répéter le mot de passe';

  @override
  String get signUpButton => 'S\'inscrire';

  @override
  String get enterNameError => 'Veuillez entrer votre nom';

  @override
  String get passwordsDoNotMatch => 'Les mots de passe ne correspondent pas';

  @override
  String get signUpSuccess => 'Inscription réussie !';

  @override
  String get loadingKnowledgeGraph =>
      'Chargement du graphe de connaissances...';

  @override
  String get noKnowledgeGraphYet => 'Pas encore de graphe de connaissances';

  @override
  String get buildingKnowledgeGraphFromMemories =>
      'Construction du graphe de connaissances à partir des souvenirs...';

  @override
  String get knowledgeGraphWillBuildAutomatically =>
      'Votre graphe de connaissances sera construit automatiquement lorsque vous créerez de nouveaux souvenirs.';

  @override
  String get buildGraphButton => 'Construire le graphe';

  @override
  String get checkOutMyMemoryGraph => 'Découvrez mon graphe de mémoire !';

  @override
  String get send => 'Envoyer';

  @override
  String get sharePublicLink => 'Partager le lien public';

  @override
  String get makePersonaPublic => 'Rendre le personnage public';

  @override
  String get connectedKnowledgeData => 'Données de connaissances connectées';

  @override
  String get enterName => 'Saisir le nom';

  @override
  String get disconnectTwitter => 'Déconnecter Twitter';

  @override
  String get disconnectTwitterConfirmation =>
      'Êtes-vous sûr de vouloir déconnecter votre compte Twitter ? Votre personnage n\'aura plus accès à vos données Twitter.';

  @override
  String get iHaveOmiDevice => 'J\'ai un appareil Toki';

  @override
  String get goal => 'OBJECTIF';

  @override
  String get tapToTrackThisGoal => 'Appuyez pour suivre cet objectif';

  @override
  String get tapToSetAGoal => 'Appuyez pour définir un objectif';

  @override
  String get processedConversations => 'Conversations traitées';

  @override
  String get updatedConversations => 'Conversations mises à jour';

  @override
  String get newConversations => 'Nouvelles conversations';

  @override
  String get createCustomTemplate => 'Créer un modèle personnalisé';

  @override
  String tagSpeaker(int speakerId) {
    return 'Identifier le locuteur $speakerId';
  }

  @override
  String get personNameAlreadyExists => 'Une personne avec ce nom existe déjà.';

  @override
  String get selectYouFromList =>
      'Pour vous identifier, veuillez sélectionner \"Vous\" dans la liste.';

  @override
  String get enterPersonsName => 'Entrez le nom de la personne';

  @override
  String get addPerson => 'Ajouter une personne';

  @override
  String tagOtherSegmentsFromSpeaker(int selected, int total) {
    return 'Identifier d\'autres segments de ce locuteur ($selected/$total)';
  }

  @override
  String get tagOtherSegments => 'Identifier d\'autres segments';

  @override
  String get managePeople => 'Gérer les personnes';

  @override
  String get shareViaSms => 'Partager par SMS';

  @override
  String get selectContactsToShareSummary =>
      'Sélectionnez des contacts pour partager le résumé de votre conversation';

  @override
  String get searchContactsHint => 'Rechercher des contacts...';

  @override
  String contactsSelectedCount(int count) {
    return '$count sélectionnés';
  }

  @override
  String get clearAllSelection => 'Tout effacer';

  @override
  String get selectContactsToShare => 'Sélectionnez des contacts à partager';

  @override
  String shareWithContactCount(int count) {
    return 'Partager avec $count contact';
  }

  @override
  String shareWithContactsCount(int count) {
    return 'Partager avec $count contacts';
  }

  @override
  String get contactsPermissionRequired => 'Autorisation des contacts requise';

  @override
  String get contactsPermissionRequiredForSms =>
      'L\'autorisation des contacts est requise pour partager par SMS';

  @override
  String get grantContactsPermissionForSms =>
      'Veuillez accorder l\'autorisation des contacts pour partager par SMS';

  @override
  String get noContactsWithPhoneNumbers =>
      'Aucun contact avec numéro de téléphone trouvé';

  @override
  String get noContactsMatchSearch =>
      'Aucun contact ne correspond à votre recherche';

  @override
  String get failedToLoadContacts => 'Échec du chargement des contacts';

  @override
  String get failedToPrepareConversationForSharing =>
      'Échec de la préparation de la conversation pour le partage. Veuillez réessayer.';

  @override
  String get couldNotOpenSmsApp =>
      'Impossible d\'ouvrir l\'application SMS. Veuillez réessayer.';

  @override
  String heresWhatWeDiscussed(String link) {
    return 'Voici ce dont nous venons de discuter : $link';
  }

  @override
  String get wifiSync => 'Synchronisation WiFi';

  @override
  String itemCopiedToClipboard(String item) {
    return '$item copié dans le presse-papiers';
  }

  @override
  String get wifiConnectionFailedTitle => 'Échec de la connexion';

  @override
  String connectingToDeviceName(String deviceName) {
    return 'Connexion à $deviceName';
  }

  @override
  String enableDeviceWifi(String deviceName) {
    return 'Activer le WiFi de $deviceName';
  }

  @override
  String connectToDeviceName(String deviceName) {
    return 'Se connecter à $deviceName';
  }

  @override
  String get recordingDetails => 'Détails de l\'enregistrement';

  @override
  String get storageLocationSdCard => 'Carte SD';

  @override
  String get storageLocationLimitlessPendant => 'Pendentif Limitless';

  @override
  String get storageLocationPhone => 'Téléphone';

  @override
  String get storageLocationPhoneMemory => 'Téléphone (mémoire)';

  @override
  String storedOnDevice(String deviceName) {
    return 'Stocké sur $deviceName';
  }

  @override
  String get transferring => 'Transfert...';

  @override
  String get transferRequired => 'Transfert requis';

  @override
  String get downloadingAudioFromSdCard =>
      'Téléchargement de l\'audio depuis la carte SD de votre appareil';

  @override
  String get transferRequiredDescription =>
      'Cet enregistrement est stocké sur la carte SD de votre appareil. Transférez-le sur votre téléphone pour le lire ou le partager.';

  @override
  String get cancelTransfer => 'Annuler le transfert';

  @override
  String get transferToPhone => 'Transférer vers le téléphone';

  @override
  String get privateAndSecureOnDevice => 'Privé et sécurisé sur votre appareil';

  @override
  String get recordingInfo => 'Info d\'enregistrement';

  @override
  String get transferInProgress => 'Transfert en cours...';

  @override
  String get shareRecording => 'Partager l\'enregistrement';

  @override
  String get deleteRecordingConfirmation =>
      'Êtes-vous sûr de vouloir supprimer définitivement cet enregistrement ? Cette action est irréversible.';

  @override
  String get recordingIdLabel => 'ID d\'enregistrement';

  @override
  String get dateTimeLabel => 'Date et heure';

  @override
  String get durationLabel => 'Durée';

  @override
  String get audioFormatLabel => 'Format audio';

  @override
  String get storageLocationLabel => 'Emplacement de stockage';

  @override
  String get estimatedSizeLabel => 'Taille estimée';

  @override
  String get deviceModelLabel => 'Modèle d\'appareil';

  @override
  String get deviceIdLabel => 'ID d\'appareil';

  @override
  String get statusLabel => 'Statut';

  @override
  String get statusProcessed => 'Traité';

  @override
  String get statusUnprocessed => 'Non traité';

  @override
  String get switchedToFastTransfer => 'Passé au transfert rapide';

  @override
  String get transferCompleteMessage =>
      'Transfert terminé ! Vous pouvez maintenant lire cet enregistrement.';

  @override
  String transferFailedMessage(String error) {
    return 'Échec du transfert : $error';
  }

  @override
  String get transferCancelled => 'Transfert annulé';

  @override
  String get fastTransferEnabled => 'Transfert rapide activé';

  @override
  String get bluetoothSyncEnabled => 'Synchronisation Bluetooth activée';

  @override
  String get enableFastTransfer => 'Activer le transfert rapide';

  @override
  String get fastTransferDescription =>
      'Le transfert rapide utilise le WiFi pour des vitesses ~5x plus rapides. Votre téléphone se connectera temporairement au réseau WiFi de votre appareil Toki pendant le transfert.';

  @override
  String get internetAccessPausedDuringTransfer =>
      'L\'accès Internet est suspendu pendant le transfert';

  @override
  String get chooseTransferMethodDescription =>
      'Choisissez comment les enregistrements sont transférés de votre appareil Toki vers votre téléphone.';

  @override
  String get wifiSpeed => '~150 Ko/s via WiFi';

  @override
  String get fiveTimesFaster => '5X PLUS RAPIDE';

  @override
  String get fastTransferMethodDescription =>
      'Crée une connexion WiFi directe à votre appareil Toki. Votre téléphone se déconnecte temporairement de votre WiFi habituel pendant le transfert.';

  @override
  String get bluetooth => 'Bluetooth';

  @override
  String get bleSpeed => '~30 Ko/s via BLE';

  @override
  String get bluetoothMethodDescription =>
      'Utilise une connexion Bluetooth Low Energy standard. Plus lent mais n\'affecte pas votre connexion WiFi.';

  @override
  String get selected => 'Sélectionné';

  @override
  String get selectOption => 'Sélectionner';

  @override
  String get lowBatteryAlertTitle => 'Alerte de batterie faible';

  @override
  String get lowBatteryAlertBody =>
      'La batterie de votre appareil est faible. Il est temps de recharger ! 🔋';

  @override
  String get deviceDisconnectedNotificationTitle =>
      'Votre appareil Toki s\'est déconnecté';

  @override
  String get deviceDisconnectedNotificationBody =>
      'Veuillez vous reconnecter pour continuer à utiliser votre Toki.';

  @override
  String get firmwareUpdateAvailable => 'Mise à jour du firmware disponible';

  @override
  String firmwareUpdateAvailableDescription(String version) {
    return 'Une nouvelle mise à jour du firmware ($version) est disponible pour votre appareil Toki. Voulez-vous mettre à jour maintenant ?';
  }

  @override
  String get later => 'Plus tard';

  @override
  String get appDeletedSuccessfully => 'Application supprimée avec succès';

  @override
  String get appDeleteFailed =>
      'Échec de la suppression de l\'application. Veuillez réessayer plus tard.';

  @override
  String get appVisibilityChangedSuccessfully =>
      'La visibilité de l\'application a été modifiée avec succès. Cela peut prendre quelques minutes.';

  @override
  String get errorActivatingAppIntegration =>
      'Erreur lors de l\'activation de l\'application. S\'il s\'agit d\'une intégration, assurez-vous que la configuration est terminée.';

  @override
  String get errorUpdatingAppStatus =>
      'Une erreur s\'est produite lors de la mise à jour du statut de l\'application.';

  @override
  String get calculatingETA => 'Calcul en cours...';

  @override
  String aboutMinutesRemaining(int minutes) {
    return 'Environ $minutes minutes restantes';
  }

  @override
  String get aboutAMinuteRemaining => 'Environ une minute restante';

  @override
  String get almostDone => 'Presque terminé...';

  @override
  String get omiSays => 'omi says';

  @override
  String get analyzingYourData => 'Analyse de vos données...';

  @override
  String migratingToProtection(String level) {
    return 'Migration vers la protection $level...';
  }

  @override
  String get noDataToMigrateFinalizing =>
      'Aucune donnée à migrer. Finalisation...';

  @override
  String migratingItemsProgress(String itemType, int percentage) {
    return 'Migration de $itemType... $percentage%';
  }

  @override
  String get allObjectsMigratedFinalizing =>
      'Tous les objets migrés. Finalisation...';

  @override
  String get migrationErrorOccurred =>
      'Une erreur s\'est produite lors de la migration. Veuillez réessayer.';

  @override
  String get migrationComplete => 'Migration terminée !';

  @override
  String dataProtectedWithSettings(String level) {
    return 'Vos données sont maintenant protégées avec les nouveaux paramètres $level.';
  }

  @override
  String get chatsLowercase => 'discussions';

  @override
  String get dataLowercase => 'données';

  @override
  String get fallNotificationTitle => 'Aïe';

  @override
  String get fallNotificationBody => 'Êtes-vous tombé ?';

  @override
  String get importantConversationTitle => 'Conversation importante';

  @override
  String get importantConversationBody =>
      'Vous venez d\'avoir une conversation importante. Appuyez pour partager le résumé.';

  @override
  String get templateName => 'Nom du modèle';

  @override
  String get templateNameHint => 'ex. Extracteur d\'actions de réunion';

  @override
  String get nameMustBeAtLeast3Characters =>
      'Le nom doit contenir au moins 3 caractères';

  @override
  String get conversationPromptHint =>
      'ex., Extraire les actions, les décisions prises et les points clés de la conversation fournie.';

  @override
  String get pleaseEnterAppPrompt =>
      'Veuillez entrer une invite pour votre application';

  @override
  String get promptMustBeAtLeast10Characters =>
      'L\'invite doit contenir au moins 10 caractères';

  @override
  String get anyoneCanDiscoverTemplate =>
      'Tout le monde peut découvrir votre modèle';

  @override
  String get onlyYouCanUseTemplate => 'Vous seul pouvez utiliser ce modèle';

  @override
  String get generatingDescription => 'Génération de la description...';

  @override
  String get creatingAppIcon => 'Création de l\'icône...';

  @override
  String get installingApp => 'Installation de l\'application...';

  @override
  String get appCreatedAndInstalled => 'Application créée et installée !';

  @override
  String get appCreatedSuccessfully => 'Application créée avec succès !';

  @override
  String get personaTwitterHandleNotFound => 'Identifiant Twitter non trouvé';

  @override
  String get personaTwitterHandleSuspended => 'Identifiant Twitter suspendu';

  @override
  String get personaFailedToVerifyTwitter =>
      'Échec de la vérification de l\'identifiant Twitter';

  @override
  String get personaFailedToFetch =>
      'Échec de la récupération de votre persona';

  @override
  String get personaFailedToCreate => 'Échec de la création de votre persona';

  @override
  String get personaConnectKnowledgeSource =>
      'Veuillez connecter au moins une source de données (Toki ou Twitter)';

  @override
  String get personaUpdatedSuccessfully => 'Persona mis à jour avec succès';

  @override
  String get personaFailedToUpdate => 'Échec de la mise à jour du persona';

  @override
  String get personaPleaseSelectImage => 'Veuillez sélectionner une image';

  @override
  String get personaFailedToCreateTryLater =>
      'Échec de la création du persona. Veuillez réessayer plus tard.';

  @override
  String personaFailedToCreateWithError(String error) {
    return 'Échec de la création du persona: $error';
  }

  @override
  String get personaFailedToEnable => 'Échec de l\'activation du persona';

  @override
  String personaErrorEnablingWithError(String error) {
    return 'Erreur lors de l\'activation du persona: $error';
  }

  @override
  String get paymentFailedToFetchCountries =>
      'Échec de la récupération des pays pris en charge. Veuillez réessayer plus tard.';

  @override
  String get paymentFailedToSetDefault =>
      'Échec de la définition du mode de paiement par défaut. Veuillez réessayer plus tard.';

  @override
  String get paymentFailedToSavePaypal =>
      'Échec de l\'enregistrement des détails PayPal. Veuillez réessayer plus tard.';

  @override
  String get paypalEmailHint => 'nik@example.com';

  @override
  String get paypalMeLinkHint => 'paypal.me/nik';

  @override
  String get paymentMethodStripe => 'Stripe';

  @override
  String get paymentMethodPayPal => 'PayPal';

  @override
  String get paymentStatusActive => 'Actif';

  @override
  String get paymentStatusConnected => 'Connecté';

  @override
  String get paymentStatusNotConnected => 'Non connecté';

  @override
  String get paymentPlan => 'Plan de paiement';

  @override
  String get xHandleTitle => 'Quel est votre identifiant X ?';

  @override
  String get xHandleDescription => 'Nous pré-entraînerons votre clone Toki';

  @override
  String get xHandleHint => '@nikshevchenko';

  @override
  String get xHandlePleaseEnter => 'Veuillez entrer votre identifiant X';

  @override
  String get xHandlePleaseEnterValid =>
      'Veuillez entrer un identifiant X valide';

  @override
  String get nextButton => 'Suivant';

  @override
  String get connectOmiDevice => 'Connecter un appareil Toki';

  @override
  String get transcriptionJsonPlaceholder =>
      'Collez votre configuration JSON ici...';

  @override
  String get transcriptionSourceOmi => 'Toki';

  @override
  String importErrorOpeningFilePicker(String message) {
    return 'Erreur lors de l\'ouverture du sélecteur de fichiers : $message';
  }

  @override
  String importErrorGeneric(String error) {
    return 'Erreur : $error';
  }

  @override
  String get mergeConversationsSuccessTitle =>
      'Conversations fusionnées avec succès';

  @override
  String mergeConversationsSuccessBody(int count) {
    return '$count conversations ont été fusionnées avec succès';
  }

  @override
  String get dailyReflectionNotificationTitle =>
      'L\'heure de la réflexion quotidienne';

  @override
  String get dailyReflectionNotificationBody => 'Raconte-moi ta journée';

  @override
  String get actionItemReminderTitle => 'Rappel Toki';

  @override
  String deviceDisconnectedTitle(String deviceName) {
    return '$deviceName déconnecté';
  }

  @override
  String deviceDisconnectedBody(String deviceName) {
    return 'Veuillez vous reconnecter pour continuer à utiliser votre $deviceName.';
  }

  @override
  String get onboardingComplete => 'Terminé';

  @override
  String get searchTranscriptOrSummary =>
      'Rechercher dans la transcription ou le résumé...';

  @override
  String get myGoal => 'Mon objectif';

  @override
  String get appNotAvailable =>
      'Oups ! L\'application que vous recherchez ne semble pas être disponible.';

  @override
  String get failedToConnectTodoist => 'Échec de la connexion à Todoist';

  @override
  String get failedToConnectAsana => 'Échec de la connexion à Asana';

  @override
  String get failedToConnectGoogleTasks =>
      'Échec de la connexion à Google Tasks';

  @override
  String get failedToConnectClickUp => 'Échec de la connexion à ClickUp';

  @override
  String failedToConnectServiceWithError(String serviceName, String error) {
    return 'Échec de la connexion à $serviceName : $error';
  }

  @override
  String get successfullyConnectedTodoist => 'Connecté avec succès à Todoist !';

  @override
  String get failedToConnectTodoistRetry =>
      'Échec de la connexion à Todoist. Veuillez réessayer.';

  @override
  String get successfullyConnectedAsana => 'Connecté avec succès à Asana !';

  @override
  String get failedToConnectAsanaRetry =>
      'Échec de la connexion à Asana. Veuillez réessayer.';

  @override
  String get successfullyConnectedGoogleTasks =>
      'Connecté avec succès à Google Tasks !';

  @override
  String get failedToConnectGoogleTasksRetry =>
      'Échec de la connexion à Google Tasks. Veuillez réessayer.';

  @override
  String get successfullyConnectedClickUp => 'Connecté avec succès à ClickUp !';

  @override
  String get failedToConnectClickUpRetry =>
      'Échec de la connexion à ClickUp. Veuillez réessayer.';

  @override
  String get successfullyConnectedGoogle => 'Connecté avec succès à Google !';

  @override
  String get failedToRefreshGoogleStatus =>
      'Échec de l\'actualisation de l\'état de connexion Google.';

  @override
  String get authFailedToSignInWithGoogle =>
      'Échec de la connexion avec Google, veuillez réessayer.';

  @override
  String get authenticationFailed =>
      'Échec de l\'authentification. Veuillez réessayer.';

  @override
  String get authFailedToSignInWithApple =>
      'Échec de la connexion avec Apple, veuillez réessayer.';

  @override
  String get authFailedToRetrieveToken =>
      'Échec de la récupération du jeton Firebase, veuillez réessayer.';

  @override
  String get authUnexpectedErrorFirebase =>
      'Erreur inattendue lors de la connexion, erreur Firebase, veuillez réessayer.';

  @override
  String get authUnexpectedError =>
      'Erreur inattendue lors de la connexion, veuillez réessayer';

  @override
  String get authFailedToLinkGoogle =>
      'Échec de la liaison avec Google, veuillez réessayer.';

  @override
  String get authFailedToLinkApple =>
      'Échec de la liaison avec Apple, veuillez réessayer.';

  @override
  String get onboardingBluetoothRequired =>
      'L\'autorisation Bluetooth est requise pour connecter votre appareil.';

  @override
  String get onboardingBluetoothDeniedSystemPrefs =>
      'Autorisation Bluetooth refusée. Veuillez accorder l\'autorisation dans les Préférences Système.';

  @override
  String onboardingBluetoothStatusCheckPrefs(String status) {
    return 'État de l\'autorisation Bluetooth : $status. Veuillez vérifier les Préférences Système.';
  }

  @override
  String onboardingFailedCheckBluetooth(String error) {
    return 'Échec de la vérification de l\'autorisation Bluetooth : $error';
  }

  @override
  String get onboardingNotificationDeniedSystemPrefs =>
      'Autorisation de notification refusée. Veuillez accorder l\'autorisation dans les Préférences Système.';

  @override
  String get onboardingNotificationDeniedNotifications =>
      'Autorisation de notification refusée. Veuillez accorder l\'autorisation dans Préférences Système > Notifications.';

  @override
  String onboardingNotificationStatusCheckPrefs(String status) {
    return 'État de l\'autorisation de notification : $status. Veuillez vérifier les Préférences Système.';
  }

  @override
  String onboardingFailedCheckNotification(String error) {
    return 'Échec de la vérification de l\'autorisation de notification : $error';
  }

  @override
  String get onboardingLocationGrantInSettings =>
      'Veuillez accorder l\'autorisation de localisation dans Réglages > Confidentialité et sécurité > Services de localisation';

  @override
  String get onboardingMicrophoneRequired =>
      'L\'autorisation du microphone est requise pour l\'enregistrement.';

  @override
  String get onboardingMicrophoneDenied =>
      'Autorisation du microphone refusée. Veuillez accorder l\'autorisation dans Préférences Système > Confidentialité et sécurité > Microphone.';

  @override
  String onboardingMicrophoneStatusCheckPrefs(String status) {
    return 'État de l\'autorisation du microphone : $status. Veuillez vérifier les Préférences Système.';
  }

  @override
  String onboardingFailedCheckMicrophone(String error) {
    return 'Échec de la vérification de l\'autorisation du microphone : $error';
  }

  @override
  String get onboardingScreenCaptureRequired =>
      'L\'autorisation de capture d\'écran est requise pour l\'enregistrement audio système.';

  @override
  String get onboardingScreenCaptureDenied =>
      'Autorisation de capture d\'écran refusée. Veuillez accorder l\'autorisation dans Préférences Système > Confidentialité et sécurité > Enregistrement d\'écran.';

  @override
  String onboardingScreenCaptureStatusCheckPrefs(String status) {
    return 'État de l\'autorisation de capture d\'écran : $status. Veuillez vérifier les Préférences Système.';
  }

  @override
  String onboardingFailedCheckScreenCapture(String error) {
    return 'Échec de la vérification de l\'autorisation de capture d\'écran : $error';
  }

  @override
  String get onboardingAccessibilityRequired =>
      'L\'autorisation d\'accessibilité est requise pour détecter les réunions du navigateur.';

  @override
  String onboardingAccessibilityStatusCheckPrefs(String status) {
    return 'État de l\'autorisation d\'accessibilité : $status. Veuillez vérifier les Préférences Système.';
  }

  @override
  String onboardingFailedCheckAccessibility(String error) {
    return 'Échec de la vérification de l\'autorisation d\'accessibilité : $error';
  }

  @override
  String get msgCameraNotAvailable =>
      'La capture par caméra n\'est pas disponible sur cette plateforme';

  @override
  String get msgCameraPermissionDenied =>
      'Permission de caméra refusée. Veuillez autoriser l\'accès à la caméra';

  @override
  String msgCameraAccessError(String error) {
    return 'Erreur d\'accès à la caméra : $error';
  }

  @override
  String get msgPhotoError =>
      'Erreur lors de la prise de photo. Veuillez réessayer.';

  @override
  String get msgMaxImagesLimit =>
      'Vous ne pouvez sélectionner que 4 images maximum';

  @override
  String msgFilePickerError(String error) {
    return 'Erreur d\'ouverture du sélecteur de fichiers : $error';
  }

  @override
  String msgSelectImagesError(String error) {
    return 'Erreur lors de la sélection d\'images : $error';
  }

  @override
  String get msgPhotosPermissionDenied =>
      'Permission photos refusée. Veuillez autoriser l\'accès aux photos pour sélectionner des images';

  @override
  String get msgSelectImagesGenericError =>
      'Erreur lors de la sélection d\'images. Veuillez réessayer.';

  @override
  String get msgMaxFilesLimit =>
      'Vous ne pouvez sélectionner que 4 fichiers maximum';

  @override
  String msgSelectFilesError(String error) {
    return 'Erreur lors de la sélection de fichiers : $error';
  }

  @override
  String get msgSelectFilesGenericError =>
      'Erreur lors de la sélection de fichiers. Veuillez réessayer.';

  @override
  String get msgUploadFileFailed =>
      'Échec du téléchargement du fichier, veuillez réessayer plus tard';

  @override
  String get msgReadingMemories => 'Lecture de vos souvenirs...';

  @override
  String get msgLearningMemories => 'Apprentissage de vos souvenirs...';

  @override
  String get msgUploadAttachedFileFailed =>
      'Échec du téléchargement du fichier joint.';

  @override
  String captureRecordingError(String error) {
    return 'Une erreur s\'est produite pendant l\'enregistrement : $error';
  }

  @override
  String captureRecordingStoppedDisplayIssue(String reason) {
    return 'Enregistrement arrêté : $reason. Vous devrez peut-être reconnecter les écrans externes ou redémarrer l\'enregistrement.';
  }

  @override
  String get captureMicrophonePermissionRequired =>
      'Autorisation du microphone requise';

  @override
  String get captureMicrophonePermissionInSystemPreferences =>
      'Accordez l\'autorisation du microphone dans les Préférences Système';

  @override
  String get captureScreenRecordingPermissionRequired =>
      'Autorisation d\'enregistrement d\'écran requise';

  @override
  String get captureDisplayDetectionFailed =>
      'La détection d\'écran a échoué. Enregistrement arrêté.';

  @override
  String get devModeInvalidAudioBytesWebhookUrl =>
      'URL du webhook des octets audio invalide';

  @override
  String get devModeInvalidRealtimeTranscriptWebhookUrl =>
      'URL du webhook de transcription en temps réel invalide';

  @override
  String get devModeInvalidConversationCreatedWebhookUrl =>
      'URL du webhook de conversation créée invalide';

  @override
  String get devModeInvalidDaySummaryWebhookUrl =>
      'URL du webhook du résumé quotidien invalide';

  @override
  String get devModeSettingsSaved => 'Paramètres enregistrés !';

  @override
  String get voiceFailedToTranscribe => 'Échec de la transcription audio';

  @override
  String get locationPermissionRequired =>
      'Autorisation de localisation requise';

  @override
  String get locationPermissionContent =>
      'Le transfert rapide nécessite l\'autorisation de localisation pour vérifier la connexion WiFi. Veuillez accorder l\'autorisation de localisation pour continuer.';

  @override
  String get conversationNewIndicator => 'Nouveau 🚀';

  @override
  String conversationPhotosCount(int count) {
    return '$count photos';
  }

  @override
  String get mergingStatus => 'Fusion en cours...';

  @override
  String timeSecsSingular(int count) {
    return '$count sec';
  }

  @override
  String timeSecsPlural(int count) {
    return '$count sec';
  }

  @override
  String timeMinSingular(int count) {
    return '$count min';
  }

  @override
  String timeMinsPlural(int count) {
    return '$count min';
  }

  @override
  String timeMinsAndSecs(int mins, int secs) {
    return '$mins min $secs sec';
  }

  @override
  String timeHourSingular(int count) {
    return '$count heure';
  }

  @override
  String timeHoursPlural(int count) {
    return '$count heures';
  }

  @override
  String timeHoursAndMins(int hours, int mins) {
    return '$hours heures $mins mins';
  }

  @override
  String timeDaySingular(int count) {
    return '$count jour';
  }

  @override
  String timeDaysPlural(int count) {
    return '$count jours';
  }

  @override
  String timeDaysAndHours(int days, int hours) {
    return '$days jours $hours heures';
  }

  @override
  String timeCompactSecs(int count) {
    return '${count}s';
  }

  @override
  String timeCompactMins(int count) {
    return '${count}m';
  }

  @override
  String timeCompactMinsAndSecs(int mins, int secs) {
    return '${mins}m ${secs}s';
  }

  @override
  String timeCompactHours(int count) {
    return '${count}h';
  }

  @override
  String timeCompactHoursAndMins(int hours, int mins) {
    return '${hours}h ${mins}m';
  }

  @override
  String get moveToFolder => 'Déplacer vers le dossier';

  @override
  String get noFoldersAvailable => 'Aucun dossier disponible';

  @override
  String get newFolder => 'Nouveau dossier';

  @override
  String get color => 'Couleur';

  @override
  String get waitingForDevice => 'En attente de l\'appareil...';

  @override
  String get saySomething => 'Dites quelque chose...';

  @override
  String get initialisingSystemAudio => 'Initialisation de l\'audio système';

  @override
  String get stopRecording => 'Arrêter l\'enregistrement';

  @override
  String get continueRecording => 'Continuer l\'enregistrement';

  @override
  String get initialisingRecorder => 'Initialisation de l\'enregistreur';

  @override
  String get pauseRecording => 'Mettre en pause l\'enregistrement';

  @override
  String get resumeRecording => 'Reprendre l\'enregistrement';

  @override
  String get noDailyRecapsYet => 'Pas encore de récapitulatifs quotidiens';

  @override
  String get dailyRecapsDescription =>
      'Vos récapitulatifs quotidiens apparaîtront ici une fois générés';

  @override
  String get chooseTransferMethod => 'Choisir la méthode de transfert';

  @override
  String get fastTransferSpeed => '~150 Ko/s via WiFi';

  @override
  String largeTimeGapDetected(String gap) {
    return 'Grand écart de temps détecté ($gap)';
  }

  @override
  String largeTimeGapsDetected(String gaps) {
    return 'Grands écarts de temps détectés ($gaps)';
  }

  @override
  String get deviceDoesNotSupportWifiSwitchingToBle =>
      'L\'appareil ne prend pas en charge la synchronisation WiFi, passage au Bluetooth';

  @override
  String get appleHealthNotAvailable =>
      'Apple Health n\'est pas disponible sur cet appareil';

  @override
  String get audioDownloadFailed => 'Échec du téléchargement de l\'audio';

  @override
  String get downloadingAudio => 'Téléchargement de l\'audio...';

  @override
  String get shareAudio => 'Partager l\'audio';

  @override
  String get preparingAudio => 'Préparation de l\'audio';

  @override
  String get downloadingAudioProgress => 'Téléchargement de l\'audio';

  @override
  String get processingAudio => 'Traitement de l\'audio';

  @override
  String get audioReady => 'Audio prêt';

  @override
  String get audioShareFailed => 'Échec du partage';

  @override
  String get dailyRecaps => 'Récapitulatifs Quotidiens';

  @override
  String get removeFilter => 'Supprimer le Filtre';

  @override
  String get categoryConversationAnalysis => 'Analyse des conversations';

  @override
  String get categoryPersonalityClone => 'Clone de personnalité';

  @override
  String get categoryHealth => 'Santé';

  @override
  String get categoryEducation => 'Éducation';

  @override
  String get categoryCommunication => 'Communication';

  @override
  String get categoryEmotionalSupport => 'Soutien émotionnel';

  @override
  String get categoryProductivity => 'Productivité';

  @override
  String get categoryEntertainment => 'Divertissement';

  @override
  String get categoryFinancial => 'Finance';

  @override
  String get categoryTravel => 'Voyage';

  @override
  String get categorySafety => 'Sécurité';

  @override
  String get categoryShopping => 'Achats';

  @override
  String get categorySocial => 'Social';

  @override
  String get categoryNews => 'Actualités';

  @override
  String get categoryUtilities => 'Utilitaires';

  @override
  String get categoryOther => 'Autres';

  @override
  String get capabilityChat => 'Discussion';

  @override
  String get capabilityConversations => 'Conversations';

  @override
  String get capabilityExternalIntegration => 'Intégration externe';

  @override
  String get capabilityNotification => 'Notification';

  @override
  String get triggerAudioBytes => 'Octets audio';

  @override
  String get triggerConversationCreation => 'Création de conversation';

  @override
  String get triggerTranscriptProcessed => 'Transcription traitée';

  @override
  String get actionCreateConversations => 'Créer des conversations';

  @override
  String get actionCreateMemories => 'Créer des souvenirs';

  @override
  String get actionReadConversations => 'Lire les conversations';

  @override
  String get actionReadMemories => 'Lire les souvenirs';

  @override
  String get actionReadTasks => 'Lire les tâches';

  @override
  String get scopeUserName => 'Nom d\'utilisateur';

  @override
  String get scopeUserFacts => 'Informations utilisateur';

  @override
  String get scopeUserConversations => 'Conversations utilisateur';

  @override
  String get scopeUserChat => 'Chat utilisateur';

  @override
  String get capabilityFeatured => 'À la une';

  @override
  String get capabilityTasks => 'Tâches';

  @override
  String get capabilityIntegrations => 'Intégrations';

  @override
  String get categoryPersonalityClones => 'Clones de personnalité';

  @override
  String get categoryProductivityLifestyle => 'Productivité et style de vie';

  @override
  String get categorySocialEntertainment => 'Social et divertissement';

  @override
  String get categoryProductivityTools => 'Outils de productivité';

  @override
  String get categoryPersonalWellness => 'Bien-être personnel';

  @override
  String get rating => 'Note';

  @override
  String get categories => 'Catégories';

  @override
  String get newTask => 'Nouvelle tâche';

  @override
  String get viewAll => 'Tout afficher';

  @override
  String get addTask => 'Ajouter une tâche';

  @override
  String get mcpServerUrl => 'MCP Server URL';

  @override
  String get whereDidYouHearAboutOmi => 'Comment nous avez-vous trouvés ?';

  @override
  String get tiktok => 'TikTok';

  @override
  String get youtube => 'YouTube';

  @override
  String get instagram => 'Instagram';

  @override
  String get xTwitter => 'X (Twitter)';

  @override
  String get reddit => 'Reddit';

  @override
  String get friendWordOfMouth => 'Ami';

  @override
  String get otherSource => 'Autre';

  @override
  String get pleaseSpecify => 'Veuillez préciser';

  @override
  String get event => 'Événement';

  @override
  String get coworker => 'Collègue';

  @override
  String get linkedIn => 'LinkedIn';

  @override
  String get googleSearch => 'Google Search';

  @override
  String get audioPlaybackUnavailable =>
      'Le fichier audio n\'est pas disponible pour la lecture';

  @override
  String get audioPlaybackFailed =>
      'Impossible de lire l\'audio. Le fichier est peut-être corrompu ou manquant.';

  @override
  String get connectionGuide => 'Guide de connexion';

  @override
  String get iveDoneThis => 'C\'est fait';

  @override
  String get reportAnIssue => 'Signaler un problème';

  @override
  String get pairingTitleOmi => 'Allumez Toki';

  @override
  String get pairingDescOmi =>
      'Appuyez longuement sur l\'appareil jusqu\'à ce qu\'il vibre pour l\'allumer.';

  @override
  String get pairingTitleOmiDevkit => 'Mettez Toki DevKit en mode d\'appairage';

  @override
  String get pairingDescOmiDevkit =>
      'Appuyez une fois sur le bouton pour allumer. La LED clignotera en violet en mode d\'appairage.';

  @override
  String get pairingTitleOmiGlass => 'Allumez Toki Glass';

  @override
  String get pairingDescOmiGlass =>
      'Appuyez longuement sur le bouton latéral pendant 3 secondes pour allumer.';

  @override
  String get pairingTitlePlaudNote => 'Mettez Plaud Note en mode d\'appairage';

  @override
  String get pairingDescPlaudNote =>
      'Appuyez longuement sur le bouton latéral pendant 2 secondes. La LED rouge clignotera quand il sera prêt à s\'appairer.';

  @override
  String get pairingTitleBee => 'Mettez Bee en mode d\'appairage';

  @override
  String get pairingDescBee =>
      'Appuyez sur le bouton 5 fois de suite. La lumière commencera à clignoter en bleu et vert.';

  @override
  String get pairingTitleLimitless => 'Mettez Limitless en mode d\'appairage';

  @override
  String get pairingDescLimitless =>
      'Quand une lumière est visible, appuyez une fois puis appuyez longuement jusqu\'à ce que l\'appareil affiche une lumière rose, puis relâchez.';

  @override
  String get pairingTitleFriendPendant =>
      'Mettez Friend Pendant en mode d\'appairage';

  @override
  String get pairingDescFriendPendant =>
      'Appuyez sur le bouton du pendentif pour l\'allumer. Il passera automatiquement en mode d\'appairage.';

  @override
  String get pairingTitleFieldy => 'Mettez Fieldy en mode d\'appairage';

  @override
  String get pairingDescFieldy =>
      'Appuyez longuement sur l\'appareil jusqu\'à ce que la lumière apparaisse pour l\'allumer.';

  @override
  String get pairingTitleAppleWatch => 'Connecter Apple Watch';

  @override
  String get pairingDescAppleWatch =>
      'Installez et ouvrez l\'application Toki sur votre Apple Watch, puis appuyez sur Connecter dans l\'application.';

  @override
  String get pairingTitleNeoOne => 'Mettez Neo One en mode d\'appairage';

  @override
  String get pairingDescNeoOne =>
      'Appuyez longuement sur le bouton d\'alimentation jusqu\'à ce que la LED clignote. L\'appareil sera détectable.';

  @override
  String get downloadingFromDevice => 'Téléchargement depuis l\'appareil';

  @override
  String get reconnectingToInternet => 'Reconnexion à internet...';

  @override
  String uploadingToCloud(int current, int total) {
    return 'Envoi de $current sur $total';
  }

  @override
  String get corruptedStatus => 'Corrompu';

  @override
  String get synced => 'Synchronisé';

  @override
  String get noPendingRecordings => 'Aucun enregistrement en attente';

  @override
  String get noProcessedRecordings =>
      'Aucun enregistrement traité pour le moment';

  @override
  String get pending => 'En attente';

  @override
  String get addToYourTaskList => 'Ajouter à votre liste de tâches ?';

  @override
  String get failedToCreateShareLink =>
      'Échec de la création du lien de partage';

  @override
  String get deleteGoal => 'Supprimer l\'objectif';

  @override
  String get deviceUpToDate => 'Votre appareil est à jour';

  @override
  String get wifiConfiguration => 'Configuration WiFi';

  @override
  String get wifiConfigurationSubtitle =>
      'Entrez vos identifiants WiFi pour permettre à l\'appareil de télécharger le micrologiciel.';

  @override
  String get networkNameSsid => 'Nom du réseau (SSID)';

  @override
  String get enterWifiNetworkName => 'Entrez le nom du réseau WiFi';

  @override
  String get enterWifiPassword => 'Entrez le mot de passe WiFi';

  @override
  String get onboardingWhatIKnowAboutYouTitle => 'Ce que je sais de vous';

  @override
  String get onboardingWhatIKnowAboutYouDescription =>
      'Voici un résumé de ce que je sais de vous d\'après nos conversations. Vous pouvez modifier tout ce qui n\'est pas correct.';

  @override
  String get apiEnvironment => 'Environnement API';

  @override
  String get apiEnvironmentDescription =>
      'Basculer entre les environnements de production et de staging';

  @override
  String get production => 'Production';

  @override
  String get staging => 'Staging';

  @override
  String get switchRequiresRestart =>
      'Le changement d\'environnement nécessite un redémarrage de l\'application';

  @override
  String get switchApiConfirmTitle => 'Changer d\'environnement API ?';

  @override
  String switchApiConfirmBody(String environment) {
    return 'Passer à $environment ? Vous devrez fermer et rouvrir l\'application pour que les changements prennent effet.';
  }

  @override
  String get switchAndRestart => 'Changer';

  @override
  String get stagingDisclaimer =>
      'L\'environnement staging peut être instable, avoir des performances incohérentes et les données peuvent être perdues. Utilisez-le uniquement pour les tests.';

  @override
  String get apiEnvSavedRestartRequired =>
      'Enregistré. Fermez et rouvrez l\'application pour appliquer.';

  @override
  String get shared => 'Partagé';

  @override
  String get onlyYouCanSeeConversation =>
      'Vous seul pouvez voir cette conversation';

  @override
  String get anyoneWithLinkCanView =>
      'Toute personne disposant du lien peut voir';

  @override
  String get tasksCleanTodayTitle => 'Nettoyer les tâches d’aujourd’hui ?';

  @override
  String get tasksCleanTodayMessage =>
      'Cela supprimera uniquement les échéances';

  @override
  String get tasksOverdue => 'En retard';

  @override
  String get showDailyScoreOnHomepage =>
      'Afficher le score quotidien sur la page d\'accueil';

  @override
  String get showTasksOnHomepage =>
      'Afficher les tâches sur la page d\'accueil';

  @override
  String get deleteSynced => 'Supprimer les synchronisés';

  @override
  String get deleteSyncedFiles => 'Supprimer les enregistrements synchronisés';

  @override
  String get deleteSyncedFilesMessage =>
      'Ces enregistrements ont déjà été synchronisés avec votre téléphone. Cette action est irréversible.';

  @override
  String get syncedFilesDeleted => 'Enregistrements synchronisés supprimés';

  @override
  String get deletePending => 'Supprimer les en attente';

  @override
  String get deletePendingFiles => 'Supprimer les enregistrements en attente';

  @override
  String get deletePendingFilesWarning =>
      'Ces enregistrements ne sont PAS synchronisés avec votre téléphone et seront définitivement perdus. Cette action est irréversible.';

  @override
  String get pendingFilesDeleted => 'Enregistrements en attente supprimés';

  @override
  String get deleteAllFiles => 'Supprimer tous les enregistrements';

  @override
  String get deleteAll => 'Tout supprimer';

  @override
  String get deleteAllFilesWarning =>
      'Cela supprimera les enregistrements synchronisés et en attente. Les enregistrements en attente ne sont PAS synchronisés et seront définitivement perdus.';

  @override
  String get allFilesDeleted => 'Tous les enregistrements supprimés';

  @override
  String get manageStorage => 'Gérer le stockage';

  @override
  String get safelyBackedUp => 'Sauvegardé sur votre téléphone';

  @override
  String get notYetSynced => 'Pas encore synchronisé avec votre téléphone';

  @override
  String get clearAll => 'Tout effacer';

  @override
  String get fairUsePolicy => 'Utilisation raisonnable';

  @override
  String get fairUseLoadError =>
      'Impossible de charger le statut d\'utilisation raisonnable. Veuillez réessayer.';

  @override
  String get fairUseStageWarning => 'Avertissement';

  @override
  String get fairUseStageThrottle => 'Limité';

  @override
  String get fairUseStageRestrict => 'Restreint';

  @override
  String get fairUseSpeechUsage => 'Utilisation de la parole';

  @override
  String get fairUseToday => 'Aujourd\'hui';

  @override
  String get fairUse3Day => '3 jours glissants';

  @override
  String get fairUseWeekly => 'Hebdomadaire glissant';

  @override
  String get fairUseAboutTitle => 'À propos de l\'utilisation raisonnable';

  @override
  String get fairUseAboutBody =>
      'Toki est conçu pour les conversations personnelles, les réunions et les interactions en direct. L\'utilisation est mesurée par le temps de parole réel détecté, et non par le temps de connexion. Si l\'utilisation dépasse significativement les schémas normaux pour du contenu non personnel, des ajustements peuvent s\'appliquer.';

  @override
  String fairUseCaseRefCopied(String caseRef) {
    return '$caseRef copié';
  }

  @override
  String get fairUseDailyTranscription => 'Transcription quotidienne';

  @override
  String fairUseBudgetUsed(String used, String limit) {
    return '${used}m / ${limit}m';
  }

  @override
  String get fairUseBudgetExhausted =>
      'Limite quotidienne de transcription atteinte';

  @override
  String fairUseBudgetResetsAt(String time) {
    return 'Réinitialisation $time';
  }

  @override
  String get transcriptionPaused => 'Enregistrement, reconnexion';

  @override
  String get transcriptionPausedReconnecting =>
      'Enregistrement en cours — reconnexion à la transcription...';

  @override
  String get improveConnectionTitle => 'Améliorer la connexion';

  @override
  String get improveConnectionContent =>
      'Nous avons amélioré la façon dont Toki reste connecté à votre appareil. Pour activer cela, allez sur la page Infos de l\'appareil, appuyez sur \"Déconnecter l\'appareil\", puis reconnectez votre appareil.';

  @override
  String get improveConnectionAction => 'Compris';

  @override
  String clockSkewWarning(int minutes) {
    return 'L\'horloge de votre appareil est décalée de ~$minutes min. Vérifiez vos paramètres de date et heure.';
  }

  @override
  String get cloudTranscriptionPoweredByDeepgram =>
      'Transcription cloud propulsée par Deepgram.';

  @override
  String get appStore => 'App Store';

  @override
  String get createApp => 'Create App';

  @override
  String get createYourOwnApp => 'Create App';

  @override
  String get enableApps => 'Enable Apps';

  @override
  String get externalAppAccess => 'External Access';

  @override
  String get externalAppAccessDescription => 'External access description';

  @override
  String get failedToCreateApp => 'Failed';

  @override
  String get rateOnAppStore => 'Rate';

  @override
  String get usageStatistics => 'Statistiques d\'utilisation';

  @override
  String get transcriptionTime => 'Temps de transcription';

  @override
  String get wordsTranscribed => 'Mots transcrits';

  @override
  String get insightsGained => 'Idées générées';

  @override
  String get memoriesCreated => 'Souvenirs créés';

  @override
  String get noDataYet => 'Pas encore de données';

  @override
  String get deleteNodeConfirmation =>
      'Supprimer ce nœud et toutes ses connexions ? Les nœuds orphelins seront aussi supprimés.';
}
