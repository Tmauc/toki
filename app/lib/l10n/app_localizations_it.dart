// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get conversationTab => 'Conversazione';

  @override
  String get transcriptTab => 'Trascrizione';

  @override
  String get actionItemsTab => 'Azioni';

  @override
  String get deleteConversationTitle => 'Eliminare Conversazione?';

  @override
  String get deleteConversationMessage =>
      'Questo eliminerà anche i ricordi, le attività e i file audio associati. Questa azione non può essere annullata.';

  @override
  String get confirm => 'Conferma';

  @override
  String get cancel => 'Annulla';

  @override
  String get ok => 'OK';

  @override
  String get delete => 'Elimina';

  @override
  String get add => 'Aggiungi';

  @override
  String get update => 'Aggiorna';

  @override
  String get save => 'Salva';

  @override
  String get edit => 'Modifica';

  @override
  String get close => 'Chiudi';

  @override
  String get clear => 'Cancella';

  @override
  String get copyTranscript => 'Copia trascrizione';

  @override
  String get copySummary => 'Copia riepilogo';

  @override
  String get testPrompt => 'Prova Prompt';

  @override
  String get reprocessConversation => 'Rielabora Conversazione';

  @override
  String get deleteConversation => 'Elimina conversazione';

  @override
  String get contentCopied => 'Contenuto copiato negli appunti';

  @override
  String get failedToUpdateStarred =>
      'Impossibile aggiornare lo stato preferito.';

  @override
  String get conversationUrlNotShared =>
      'L\'URL della conversazione non può essere condiviso.';

  @override
  String get errorProcessingConversation =>
      'Errore durante l\'elaborazione della conversazione. Riprova più tardi.';

  @override
  String get noInternetConnection => 'Nessuna connessione Internet';

  @override
  String get unableToDeleteConversation =>
      'Impossibile Eliminare Conversazione';

  @override
  String get somethingWentWrong =>
      'Qualcosa è andato storto! Riprova più tardi.';

  @override
  String get copyErrorMessage => 'Copia messaggio di errore';

  @override
  String get errorCopied => 'Messaggio di errore copiato negli appunti';

  @override
  String get remaining => 'Rimanente';

  @override
  String get loading => 'Caricamento...';

  @override
  String get loadingDuration => 'Caricamento durata...';

  @override
  String get people => 'Persone';

  @override
  String get addNewPerson => 'Aggiungi Nuova Persona';

  @override
  String get editPerson => 'Modifica Persona';

  @override
  String get createPersonHint =>
      'Crea una nuova persona e allena Toki a riconoscere anche il suo modo di parlare!';

  @override
  String get speechProfile => 'Profilo Vocale';

  @override
  String sampleNumber(int number) {
    return 'Campione $number';
  }

  @override
  String get settings => 'Impostazioni';

  @override
  String get language => 'Lingua';

  @override
  String get selectLanguage => 'Seleziona Lingua';

  @override
  String get deleting => 'Eliminazione...';

  @override
  String get importStarted =>
      'Importazione avviata! Riceverai una notifica quando sarà completata.';

  @override
  String get failedToStartImport =>
      'Impossibile avviare l\'importazione. Riprova.';

  @override
  String get couldNotAccessFile => 'Impossibile accedere al file selezionato';

  @override
  String get askOmi => 'Chiedi a Toki';

  @override
  String get done => 'Fatto';

  @override
  String get disconnected => 'Disconnesso';

  @override
  String get searching => 'Ricerca in corso...';

  @override
  String get connectDevice => 'Connetti Dispositivo';

  @override
  String get allCaughtUp => 'Tutto aggiornato';

  @override
  String get sync => 'Sincronizza';

  @override
  String get noConversationsYet => 'Ancora nessuna conversazione';

  @override
  String get noStarredConversations => 'Nessuna conversazione con stella';

  @override
  String get starConversationHint =>
      'Per aggiungere una conversazione ai preferiti, aprila e tocca l\'icona stella nell\'intestazione.';

  @override
  String get searchConversations => 'Cerca conversazioni...';

  @override
  String selectedCount(int count, Object s) {
    return '$count selezionat$s';
  }

  @override
  String get merge => 'Unisci';

  @override
  String get mergeConversations => 'Unisci Conversazioni';

  @override
  String mergeConversationsMessage(int count) {
    return 'Questo combinerà $count conversazioni in una. Tutti i contenuti saranno uniti e rigenerati.';
  }

  @override
  String get mergingInBackground =>
      'Unione in background. Potrebbe richiedere un momento.';

  @override
  String get failedToStartMerge => 'Impossibile avviare l\'unione';

  @override
  String get askAnything => 'Chiedi qualsiasi cosa';

  @override
  String get noMessagesYet =>
      'Nessun messaggio ancora!\nPerché non inizi una conversazione?';

  @override
  String get deletingMessages =>
      'Eliminazione dei tuoi messaggi dalla memoria di Toki...';

  @override
  String get messageCopied => '✨ Messaggio copiato negli appunti';

  @override
  String get clearChat => 'Cancella chat';

  @override
  String get clearChatConfirm =>
      'Sei sicuro di voler cancellare la chat? Questa azione non può essere annullata.';

  @override
  String get maxFilesLimit => 'Puoi caricare solo 4 file alla volta';

  @override
  String get apps => 'App';

  @override
  String get aboutOmi => 'Informazioni su Toki';

  @override
  String get privacyPolicy => 'Politica sulla Privacy';

  @override
  String get visitWebsite => 'Visita il sito web';

  @override
  String get helpOrInquiries => 'Aiuto o domande?';

  @override
  String get joinCommunity => 'Unisciti alla community!';

  @override
  String get membersAndCounting => '8000+ membri e in crescita.';

  @override
  String get deleteAccountTitle => 'Elimina Account';

  @override
  String get deleteAccountConfirm =>
      'Sei sicuro di voler eliminare il tuo account?';

  @override
  String get cannotBeUndone => 'Questa operazione non può essere annullata.';

  @override
  String get allDataErased =>
      'Tutti i tuoi ricordi e conversazioni saranno cancellati permanentemente.';

  @override
  String get appsDisconnected =>
      'Le tue App e Integrazioni saranno disconnesse immediatamente.';

  @override
  String get exportBeforeDelete =>
      'Puoi esportare i tuoi dati prima di eliminare il tuo account, ma una volta eliminato, non può essere recuperato.';

  @override
  String get deleteAccountCheckbox =>
      'Comprendo che l\'eliminazione del mio account è permanente e tutti i dati, inclusi ricordi e conversazioni, saranno persi e non potranno essere recuperati.';

  @override
  String get areYouSure => 'Sei sicuro?';

  @override
  String get deleteAccountFinal =>
      'Questa azione è irreversibile e eliminerà permanentemente il tuo account e tutti i dati associati. Sei sicuro di voler procedere?';

  @override
  String get deleteNow => 'Elimina Ora';

  @override
  String get goBack => 'Indietro';

  @override
  String get checkBoxToConfirm =>
      'Seleziona la casella per confermare di aver compreso che l\'eliminazione del tuo account è permanente e irreversibile.';

  @override
  String get profile => 'Profilo';

  @override
  String get name => 'Nome';

  @override
  String get email => 'Email';

  @override
  String get customVocabulary => 'Vocabolario Personalizzato';

  @override
  String get identifyingOthers => 'Identificazione di Altri';

  @override
  String get conversationDisplay => 'Visualizzazione Conversazioni';

  @override
  String get dataPrivacy => 'Privacy dei Dati';

  @override
  String get userId => 'ID Utente';

  @override
  String get notSet => 'Non impostato';

  @override
  String get userIdCopied => 'ID utente copiato negli appunti';

  @override
  String get systemDefault => 'Predefinito del Sistema';

  @override
  String get offlineSync => 'Sincronizzazione offline';

  @override
  String get deviceSettings => 'Impostazioni Dispositivo';

  @override
  String get integrations => 'Integrazioni';

  @override
  String get developerSettings => 'Impostazioni sviluppatore';

  @override
  String get signOut => 'Disconnetti';

  @override
  String get appAndDeviceCopied => 'Dettagli app e dispositivo copiati';

  @override
  String get wrapped2025 => 'Resoconto 2025';

  @override
  String get yourPrivacyYourControl => 'La Tua Privacy, Il Tuo Controllo';

  @override
  String get privacyIntro =>
      'In Toki ci impegniamo a proteggere la tua privacy. Questa pagina ti permette di controllare come vengono archiviati e utilizzati i tuoi dati.';

  @override
  String get dataProtectionLevel => 'Livello di Protezione Dati';

  @override
  String get dataProtectionDesc =>
      'I tuoi dati sono protetti di default con crittografia avanzata. Rivedi le tue impostazioni e le future opzioni di privacy qui sotto.';

  @override
  String get deviceName => 'Nome Dispositivo';

  @override
  String get deviceId => 'ID dispositivo';

  @override
  String get firmware => 'Firmware';

  @override
  String get sdCardSync => 'Sincronizzazione scheda SD';

  @override
  String get hardwareRevision => 'Revisione Hardware';

  @override
  String get modelNumber => 'Numero modello';

  @override
  String get manufacturer => 'Produttore';

  @override
  String get doubleTap => 'Doppio Tocco';

  @override
  String get ledBrightness => 'Luminosità LED';

  @override
  String get micGain => 'Guadagno Microfono';

  @override
  String get disconnect => 'Disconnetti';

  @override
  String get chargingIssues => 'Problemi di ricarica';

  @override
  String get disconnectDevice => 'Disconnetti dispositivo';

  @override
  String get unpairDevice => 'Disaccoppia dispositivo';

  @override
  String get unpairAndForget => 'Disaccoppia e Dimentica Dispositivo';

  @override
  String get deviceDisconnectedMessage => 'Il tuo Toki è stato disconnesso 😔';

  @override
  String get deviceUnpairedMessage =>
      'Dispositivo disaccoppiato. Vai in Impostazioni > Bluetooth e dimentica il dispositivo per completare il disaccoppiamento.';

  @override
  String get unpairDialogTitle => 'Disaccoppia Dispositivo';

  @override
  String get unpairDialogMessage =>
      'Questo disaccoppierà il dispositivo in modo che possa essere connesso a un altro telefono. Dovrai andare su Impostazioni > Bluetooth e dimenticare il dispositivo per completare il processo.';

  @override
  String get deviceNotConnected => 'Dispositivo Non Connesso';

  @override
  String get connectDeviceMessage =>
      'Connetti il tuo dispositivo Toki per accedere\nalle impostazioni e alla personalizzazione del dispositivo';

  @override
  String get deviceInfoSection => 'Informazioni Dispositivo';

  @override
  String get customizationSection => 'Personalizzazione';

  @override
  String get hardwareSection => 'Hardware';

  @override
  String get v2Undetected => 'V2 non rilevato';

  @override
  String get v2UndetectedMessage =>
      'Vediamo che hai un dispositivo V1 o il tuo dispositivo non è connesso. La funzionalità della scheda SD è disponibile solo per i dispositivi V2.';

  @override
  String get endConversation => 'Termina Conversazione';

  @override
  String get pauseResume => 'Pausa/Riprendi';

  @override
  String get starConversation => 'Aggiungi ai Preferiti';

  @override
  String get doubleTapAction => 'Azione Doppio Tocco';

  @override
  String get endAndProcess => 'Termina ed Elabora Conversazione';

  @override
  String get pauseResumeRecording => 'Pausa/Riprendi Registrazione';

  @override
  String get starOngoing => 'Aggiungi Conversazione in Corso ai Preferiti';

  @override
  String get off => 'Disattivato';

  @override
  String get max => 'Massimo';

  @override
  String get mute => 'Muto';

  @override
  String get quiet => 'Silenzioso';

  @override
  String get normal => 'Normale';

  @override
  String get high => 'Alto';

  @override
  String get micGainDescMuted => 'Microfono disattivato';

  @override
  String get micGainDescLow => 'Molto silenzioso - per ambienti rumorosi';

  @override
  String get micGainDescModerate => 'Silenzioso - per rumore moderato';

  @override
  String get micGainDescNeutral => 'Neutrale - registrazione bilanciata';

  @override
  String get micGainDescSlightlyBoosted =>
      'Leggermente amplificato - uso normale';

  @override
  String get micGainDescBoosted => 'Amplificato - per ambienti silenziosi';

  @override
  String get micGainDescHigh => 'Alto - per voci distanti o basse';

  @override
  String get micGainDescVeryHigh =>
      'Molto alto - per sorgenti molto silenziose';

  @override
  String get micGainDescMax => 'Massimo - usare con cautela';

  @override
  String get saving => 'Salvataggio...';

  @override
  String get beta => 'BETA';

  @override
  String get transcription => 'Trascrizione';

  @override
  String get conversationTimeout => 'Timeout Conversazione';

  @override
  String get importData => 'Importa Dati';

  @override
  String get endpointUrl => 'URL endpoint';

  @override
  String get noApiKeys => 'Nessuna chiave API ancora';

  @override
  String get createKey => 'Crea Chiave';

  @override
  String get docs => 'Documentazione';

  @override
  String get today => 'Oggi';

  @override
  String get thisMonth => 'Questo Mese';

  @override
  String get thisYear => 'Quest\'Anno';

  @override
  String get allTime => 'Sempre';

  @override
  String get startConversationToSeeInsights =>
      'Inizia una conversazione con Toki\nper vedere le tue statistiche di utilizzo qui.';

  @override
  String get listening => 'Ascolto';

  @override
  String get listeningSubtitle =>
      'Tempo totale in cui Toki ha ascoltato attivamente.';

  @override
  String get understanding => 'Comprensione';

  @override
  String get understandingSubtitle =>
      'Parole comprese dalle tue conversazioni.';

  @override
  String get providing => 'Fornire';

  @override
  String get providingSubtitle => 'Azioni e note automaticamente catturate.';

  @override
  String get remembering => 'Ricordare';

  @override
  String get rememberingSubtitle => 'Fatti e dettagli ricordati per te.';

  @override
  String get debugLogs => 'Log di debug';

  @override
  String get noLogFilesFound => 'Nessun file di log trovato.';

  @override
  String get selectLogFile => 'Seleziona File di Log';

  @override
  String get shareLogs => 'Condividi log';

  @override
  String get debugLogCleared => 'Log di debug cancellato';

  @override
  String get exportStarted =>
      'Esportazione avviata. Potrebbe richiedere alcuni secondi...';

  @override
  String get exportAllData => 'Esporta Tutti i Dati';

  @override
  String get knowledgeGraphDeleted => 'Grafico della conoscenza eliminato';

  @override
  String get deleteKnowledgeGraph => 'Elimina Grafo di Conoscenza';

  @override
  String get mcp => 'MCP';

  @override
  String get mcpServer => 'Server MCP';

  @override
  String get serverUrl => 'URL Server';

  @override
  String get urlCopied => 'URL copiato';

  @override
  String get apiKeyAuth => 'Autenticazione Chiave API';

  @override
  String get header => 'Intestazione';

  @override
  String get clientId => 'ID Cliente';

  @override
  String get clientSecret => 'Segreto Cliente';

  @override
  String get webhooks => 'Webhook';

  @override
  String get conversationEvents => 'Eventi conversazione';

  @override
  String get newConversationCreated => 'Nuova conversazione creata';

  @override
  String get transcriptReceived => 'Trascrizione ricevuta';

  @override
  String get audioBytes => 'Byte Audio';

  @override
  String get audioDataReceived => 'Dati audio ricevuti';

  @override
  String get intervalSeconds => 'Intervallo (secondi)';

  @override
  String get daySummary => 'Riepilogo giornaliero';

  @override
  String get summaryGenerated => 'Riepilogo generato';

  @override
  String get claudeDesktop => 'Claude Desktop';

  @override
  String get copyConfig => 'Copia Configurazione';

  @override
  String get configCopied => 'Configurazione copiata negli appunti';

  @override
  String get listeningMins => 'Ascolto (min)';

  @override
  String get understandingWords => 'Comprensione (parole)';

  @override
  String get insights => 'Approfondimenti';

  @override
  String get memories => 'Ricordi';

  @override
  String get visibility => 'Visibilità';

  @override
  String get visibilitySubtitle =>
      'Controlla quali conversazioni appaiono nella tua lista';

  @override
  String get showShortConversations => 'Mostra Conversazioni Brevi';

  @override
  String get showShortConversationsDesc =>
      'Visualizza conversazioni più brevi della soglia';

  @override
  String get showDiscardedConversations => 'Mostra Conversazioni Scartate';

  @override
  String get showDiscardedConversationsDesc =>
      'Includi conversazioni contrassegnate come scartate';

  @override
  String get shortConversationThreshold => 'Soglia Conversazione Breve';

  @override
  String get shortConversationThresholdSubtitle =>
      'Le conversazioni più brevi di questa soglia saranno nascoste se non abilitate sopra';

  @override
  String get durationThreshold => 'Soglia Durata';

  @override
  String get durationThresholdDesc =>
      'Nascondi conversazioni più brevi di questa soglia';

  @override
  String minLabel(int count) {
    return '$count min';
  }

  @override
  String get customVocabularyTitle => 'Vocabolario Personalizzato';

  @override
  String get addWords => 'Aggiungi Parole';

  @override
  String get addWordsDesc => 'Nomi, termini o parole non comuni';

  @override
  String get vocabularyHint => 'Toki, Callie, OpenAI';

  @override
  String get connect => 'Connetti';

  @override
  String get comingSoon => 'Prossimamente';

  @override
  String get integrationsFooter =>
      'Connetti le tue app per visualizzare dati e metriche nella chat.';

  @override
  String get completeAuthInBrowser =>
      'Completa l\'autenticazione nel tuo browser. Una volta fatto, torna all\'app.';

  @override
  String failedToStartAuth(String appName) {
    return 'Impossibile avviare l\'autenticazione $appName';
  }

  @override
  String disconnectAppTitle(String appName) {
    return 'Disconnettere $appName?';
  }

  @override
  String disconnectAppMessage(String appName) {
    return 'Sei sicuro di volerti disconnettere da $appName? Puoi riconnetterti in qualsiasi momento.';
  }

  @override
  String disconnectedFrom(String appName) {
    return 'Disconnesso da $appName';
  }

  @override
  String get failedToDisconnect => 'Impossibile disconnettere';

  @override
  String connectTo(String appName) {
    return 'Connetti a $appName';
  }

  @override
  String authAccessMessage(String appName) {
    return 'Dovrai autorizzare Toki ad accedere ai tuoi dati $appName. Questo aprirà il tuo browser per l\'autenticazione.';
  }

  @override
  String get continueAction => 'Continua';

  @override
  String get languageTitle => 'Lingua';

  @override
  String get primaryLanguage => 'Lingua principale';

  @override
  String get automaticTranslation => 'Traduzione Automatica';

  @override
  String get detectLanguages => 'Rileva oltre 10 lingue';

  @override
  String get authorizeSavingRecordings => 'Autorizza Salvataggio Registrazioni';

  @override
  String get thanksForAuthorizing => 'Grazie per aver autorizzato!';

  @override
  String get needYourPermission => 'Abbiamo bisogno del tuo permesso';

  @override
  String get alreadyGavePermission =>
      'Ci hai già dato il permesso di salvare le tue registrazioni. Ecco un promemoria del perché ne abbiamo bisogno:';

  @override
  String get wouldLikePermission =>
      'Vorremmo il tuo permesso per salvare le tue registrazioni vocali. Ecco perché:';

  @override
  String get improveSpeechProfile => 'Migliora il Tuo Profilo Vocale';

  @override
  String get improveSpeechProfileDesc =>
      'Utilizziamo le registrazioni per addestrare e migliorare ulteriormente il tuo profilo vocale personale.';

  @override
  String get trainFamilyProfiles => 'Addestra Profili per Amici e Famiglia';

  @override
  String get trainFamilyProfilesDesc =>
      'Le tue registrazioni ci aiutano a riconoscere e creare profili per i tuoi amici e familiari.';

  @override
  String get enhanceTranscriptAccuracy => 'Migliora Precisione Trascrizione';

  @override
  String get enhanceTranscriptAccuracyDesc =>
      'Man mano che il nostro modello migliora, possiamo fornire risultati di trascrizione migliori per le tue registrazioni.';

  @override
  String get legalNotice =>
      'Avviso Legale: La legalità della registrazione e dell\'archiviazione dei dati vocali può variare a seconda della tua posizione e di come utilizzi questa funzione. È tua responsabilità garantire la conformità con le leggi e i regolamenti locali.';

  @override
  String get alreadyAuthorized => 'Già Autorizzato';

  @override
  String get authorize => 'Autorizza';

  @override
  String get revokeAuthorization => 'Revoca Autorizzazione';

  @override
  String get authorizationSuccessful => 'Autorizzazione riuscita!';

  @override
  String get failedToAuthorize => 'Impossibile autorizzare. Riprova.';

  @override
  String get authorizationRevoked => 'Autorizzazione revocata.';

  @override
  String get recordingsDeleted => 'Registrazioni eliminate.';

  @override
  String get failedToRevoke =>
      'Impossibile revocare l\'autorizzazione. Riprova.';

  @override
  String get permissionRevokedTitle => 'Permesso Revocato';

  @override
  String get permissionRevokedMessage =>
      'Vuoi che rimuoviamo anche tutte le tue registrazioni esistenti?';

  @override
  String get yes => 'Sì';

  @override
  String get editName => 'Modifica nome';

  @override
  String get howShouldOmiCallYou => 'Come dovrebbe chiamarti Toki?';

  @override
  String get enterYourName => 'Inserisci il tuo nome';

  @override
  String get nameCannotBeEmpty => 'Il nome non può essere vuoto';

  @override
  String get nameUpdatedSuccessfully => 'Nome aggiornato con successo!';

  @override
  String get calendarSettings => 'Impostazioni calendario';

  @override
  String get calendarProviders => 'Provider Calendario';

  @override
  String get macOsCalendar => 'Calendario macOS';

  @override
  String get connectMacOsCalendar => 'Connetti il tuo calendario macOS locale';

  @override
  String get googleCalendar => 'Google Calendar';

  @override
  String get syncGoogleAccount => 'Sincronizza con il tuo account Google';

  @override
  String get showMeetingsMenuBar =>
      'Mostra riunioni imminenti nella barra dei menu';

  @override
  String get showMeetingsMenuBarDesc =>
      'Visualizza la tua prossima riunione e il tempo rimanente nella barra dei menu di macOS';

  @override
  String get showEventsNoParticipants => 'Mostra eventi senza partecipanti';

  @override
  String get showEventsNoParticipantsDesc =>
      'Quando abilitato, Prossimi Eventi mostra eventi senza partecipanti o link video.';

  @override
  String get yourMeetings => 'Le Tue Riunioni';

  @override
  String get refresh => 'Aggiorna';

  @override
  String get noUpcomingMeetings => 'Nessuna riunione imminente';

  @override
  String get checkingNextDays => 'Controllo dei prossimi 30 giorni';

  @override
  String get tomorrow => 'Domani';

  @override
  String get googleCalendarComingSoon =>
      'Integrazione Google Calendar in arrivo!';

  @override
  String connectedAsUser(String userId) {
    return 'Connesso come utente: $userId';
  }

  @override
  String get defaultWorkspace => 'Area di Lavoro Predefinita';

  @override
  String get tasksCreatedInWorkspace =>
      'Le attività saranno create in quest\'area di lavoro';

  @override
  String get defaultProjectOptional => 'Progetto Predefinito (Facoltativo)';

  @override
  String get leaveUnselectedTasks =>
      'Lascia non selezionato per creare attività senza un progetto';

  @override
  String get noProjectsInWorkspace =>
      'Nessun progetto trovato in quest\'area di lavoro';

  @override
  String get conversationTimeoutDesc =>
      'Scegli quanto tempo attendere in silenzio prima di terminare automaticamente una conversazione:';

  @override
  String get timeout2Minutes => '2 minuti';

  @override
  String get timeout2MinutesDesc =>
      'Termina conversazione dopo 2 minuti di silenzio';

  @override
  String get timeout5Minutes => '5 minuti';

  @override
  String get timeout5MinutesDesc =>
      'Termina conversazione dopo 5 minuti di silenzio';

  @override
  String get timeout10Minutes => '10 minuti';

  @override
  String get timeout10MinutesDesc =>
      'Termina conversazione dopo 10 minuti di silenzio';

  @override
  String get timeout30Minutes => '30 minuti';

  @override
  String get timeout30MinutesDesc =>
      'Termina conversazione dopo 30 minuti di silenzio';

  @override
  String get timeout4Hours => '4 ore';

  @override
  String get timeout4HoursDesc =>
      'Termina conversazione dopo 4 ore di silenzio';

  @override
  String get conversationEndAfterHours =>
      'Le conversazioni termineranno ora dopo 4 ore di silenzio';

  @override
  String conversationEndAfterMinutes(int minutes) {
    return 'Le conversazioni termineranno ora dopo $minutes minuto/i di silenzio';
  }

  @override
  String get tellUsPrimaryLanguage => 'Dicci la tua lingua principale';

  @override
  String get languageForTranscription =>
      'Imposta la tua lingua per trascrizioni più accurate e un\'esperienza personalizzata.';

  @override
  String get singleLanguageModeInfo =>
      'Modalità Lingua Singola attivata. La traduzione è disabilitata per una maggiore precisione.';

  @override
  String get searchLanguageHint => 'Cerca lingua per nome o codice';

  @override
  String get noLanguagesFound => 'Nessuna lingua trovata';

  @override
  String get skip => 'Salta';

  @override
  String languageSetTo(String language) {
    return 'Lingua impostata su $language';
  }

  @override
  String get failedToSetLanguage => 'Impossibile impostare la lingua';

  @override
  String appSettings(String appName) {
    return 'Impostazioni $appName';
  }

  @override
  String disconnectFromApp(String appName) {
    return 'Disconnettere da $appName?';
  }

  @override
  String disconnectFromAppDesc(String appName) {
    return 'Questo rimuoverà la tua autenticazione $appName. Dovrai riconnetterti per usarlo di nuovo.';
  }

  @override
  String connectedToApp(String appName) {
    return 'Connesso a $appName';
  }

  @override
  String get account => 'Account';

  @override
  String actionItemsSyncedTo(String appName) {
    return 'Le tue azioni saranno sincronizzate con il tuo account $appName';
  }

  @override
  String get defaultSpace => 'Spazio Predefinito';

  @override
  String get selectSpaceInWorkspace =>
      'Seleziona uno spazio nella tua area di lavoro';

  @override
  String get noSpacesInWorkspace =>
      'Nessuno spazio trovato in quest\'area di lavoro';

  @override
  String get defaultList => 'Lista Predefinita';

  @override
  String get tasksAddedToList => 'Le attività saranno aggiunte a questa lista';

  @override
  String get noListsInSpace => 'Nessuna lista trovata in questo spazio';

  @override
  String get private => 'Privato';

  @override
  String get yesterday => 'Ieri';

  @override
  String get taskIntegrations => 'Integrazioni Attività';

  @override
  String get configureSettings => 'Configura Impostazioni';

  @override
  String get completeAuthBrowser =>
      'Completa l\'autenticazione nel tuo browser. Una volta fatto, torna all\'app.';

  @override
  String failedToStartAppAuth(String appName) {
    return 'Impossibile avviare l\'autenticazione $appName';
  }

  @override
  String connectToAppTitle(String appName) {
    return 'Connetti a $appName';
  }

  @override
  String authorizeOmiForTasks(String appName) {
    return 'Dovrai autorizzare Toki a creare attività nel tuo account $appName. Questo aprirà il tuo browser per l\'autenticazione.';
  }

  @override
  String get continueButton => 'Continua';

  @override
  String appIntegration(String appName) {
    return 'Integrazione $appName';
  }

  @override
  String integrationComingSoon(String appName) {
    return 'L\'integrazione con $appName è in arrivo! Stiamo lavorando sodo per offrirti più opzioni di gestione delle attività.';
  }

  @override
  String get gotIt => 'Capito';

  @override
  String get tasksExportedOneApp =>
      'Le attività possono essere esportate in un\'app alla volta.';

  @override
  String get importConfiguration => 'Importa Configurazione';

  @override
  String get exportConfiguration => 'Esporta configurazione';

  @override
  String get payYourSttProvider =>
      'Usa Toki liberamente. Paghi solo il tuo provider STT direttamente.';

  @override
  String get hostRequired => 'L\'host è richiesto';

  @override
  String get validPortRequired => 'È richiesta una porta valida';

  @override
  String get validWebsocketUrlRequired =>
      'È richiesto un URL WebSocket valido (wss://)';

  @override
  String get apiUrlRequired => 'L\'URL API è richiesto';

  @override
  String get apiKeyRequired => 'La chiave API è richiesta';

  @override
  String get invalidJsonConfig => 'Configurazione JSON non valida';

  @override
  String errorSaving(String error) {
    return 'Errore durante il salvataggio: $error';
  }

  @override
  String get configCopiedToClipboard => 'Configurazione copiata negli appunti';

  @override
  String get pasteJsonConfig => 'Incolla la tua configurazione JSON qui sotto:';

  @override
  String get addApiKeyAfterImport =>
      'Dovrai aggiungere la tua chiave API dopo l\'importazione';

  @override
  String get paste => 'Incolla';

  @override
  String get import => 'Importa';

  @override
  String get invalidProviderInConfig =>
      'Provider non valido nella configurazione';

  @override
  String importedConfig(String providerName) {
    return 'Configurazione $providerName importata';
  }

  @override
  String invalidJson(String error) {
    return 'JSON non valido: $error';
  }

  @override
  String get provider => 'Provider';

  @override
  String get live => 'Dal vivo';

  @override
  String get onDevice => 'Sul Dispositivo';

  @override
  String get apiUrl => 'URL API';

  @override
  String get enterSttHttpEndpoint => 'Inserisci il tuo endpoint HTTP STT';

  @override
  String get websocketUrl => 'URL WebSocket';

  @override
  String get enterLiveSttWebsocket =>
      'Inserisci il tuo endpoint WebSocket STT live';

  @override
  String get apiKey => 'Chiave API';

  @override
  String get enterApiKey => 'Inserisci la tua chiave API';

  @override
  String get storedLocallyNeverShared => 'Archiviato localmente, mai condiviso';

  @override
  String get host => 'Host';

  @override
  String get port => 'Porta';

  @override
  String get advanced => 'Avanzate';

  @override
  String get configuration => 'Configurazione';

  @override
  String get requestConfiguration => 'Configurazione Richiesta';

  @override
  String get responseSchema => 'Schema Risposta';

  @override
  String get modified => 'Modificato';

  @override
  String get resetRequestConfig =>
      'Ripristina configurazione richiesta predefinita';

  @override
  String get logs => 'Log';

  @override
  String get logsCopied => 'Log copiati';

  @override
  String get noLogsYet =>
      'Nessun log ancora. Inizia a registrare per vedere l\'attività STT personalizzata.';

  @override
  String deviceUsesCodec(String device, String reason) {
    return '$device usa $reason. Verrà usato Toki.';
  }

  @override
  String get omiTranscription => 'Trascrizione Toki';

  @override
  String get processing => 'Elaborazione...';

  @override
  String get creatingYourApp => 'Creazione della tua app...';

  @override
  String get appName => 'App Name';

  @override
  String get description => 'Descrizione';

  @override
  String get free => 'Gratuito';

  @override
  String get makePublic => 'Rendi pubblico';

  @override
  String get anyoneCanDiscover => 'Chiunque può scoprire la tua app';

  @override
  String get onlyYouCanUse => 'Solo tu puoi usare questa app';

  @override
  String get creating => 'Creazione...';

  @override
  String get searchingForDevices => 'Ricerca dispositivi...';

  @override
  String devicesFoundNearby(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'DISPOSITIVI',
      one: 'DISPOSITIVO',
    );
    return '$count $_temp0 TROVATO/I NELLE VICINANZE';
  }

  @override
  String get pairingSuccessful => 'ACCOPPIAMENTO RIUSCITO';

  @override
  String errorConnectingAppleWatch(String error) {
    return 'Errore durante la connessione all\'Apple Watch: $error';
  }

  @override
  String get dontShowAgain => 'Non mostrare più';

  @override
  String get iUnderstand => 'Ho capito';

  @override
  String get enableBluetooth => 'Abilita Bluetooth';

  @override
  String get bluetoothNeeded =>
      'Toki ha bisogno del Bluetooth per connettersi al tuo dispositivo indossabile. Abilita il Bluetooth e riprova.';

  @override
  String get contactSupport => 'Contatta Supporto?';

  @override
  String get connectLater => 'Connetti Più Tardi';

  @override
  String get grantPermissions => 'Concedi autorizzazioni';

  @override
  String get backgroundActivity => 'Attività in background';

  @override
  String get backgroundActivityDesc =>
      'Consenti a Toki di funzionare in background per una migliore stabilità';

  @override
  String get locationAccess => 'Accesso posizione';

  @override
  String get locationAccessDesc =>
      'Abilita posizione in background per l\'esperienza completa';

  @override
  String get notifications => 'Notifiche';

  @override
  String get notificationsDesc => 'Abilita le notifiche per rimanere informato';

  @override
  String get locationServiceDisabled =>
      'Servizio di Localizzazione Disabilitato';

  @override
  String get locationServiceDisabledDesc =>
      'Il Servizio di Localizzazione è disabilitato. Vai su Impostazioni > Privacy e Sicurezza > Servizi di Localizzazione e abilitalo';

  @override
  String get leaveReviewIos =>
      'Aiutaci a raggiungere più persone lasciando una recensione sull\'App Store. Il tuo feedback è prezioso per noi!';

  @override
  String get leaveReviewAndroid =>
      'Aiutaci a raggiungere più persone lasciando una recensione sul Google Play Store. Il tuo feedback è prezioso per noi!';

  @override
  String get rateOnGooglePlay => 'Valuta su Google Play';

  @override
  String get maybeLater => 'Forse Più Tardi';

  @override
  String get speechProfileIntro =>
      'Toki deve imparare i tuoi obiettivi e la tua voce. Potrai modificarlo in seguito.';

  @override
  String get getStarted => 'Inizia';

  @override
  String get allDone => 'Tutto fatto!';

  @override
  String get keepGoing => 'Continua così, stai andando alla grande';

  @override
  String get skipThisQuestion => 'Salta questa domanda';

  @override
  String get skipForNow => 'Salta per ora';

  @override
  String get connectionError => 'Errore di Connessione';

  @override
  String get connectionErrorDesc =>
      'Impossibile connettersi al server. Controlla la tua connessione internet e riprova.';

  @override
  String get invalidRecordingMultipleSpeakers =>
      'Registrazione non valida rilevata';

  @override
  String get multipleSpeakersDesc =>
      'Sembra che ci siano più persone che parlano nella registrazione. Assicurati di essere in un luogo silenzioso e riprova.';

  @override
  String get tooShortDesc =>
      'Non è stato rilevato abbastanza parlato. Parla di più e riprova.';

  @override
  String get invalidRecordingDesc =>
      'Assicurati di parlare per almeno 5 secondi e non più di 90.';

  @override
  String get areYouThere => 'Ci sei?';

  @override
  String get noSpeechDesc =>
      'Non abbiamo rilevato nessun parlato. Assicurati di parlare per almeno 10 secondi e non più di 3 minuti.';

  @override
  String get connectionLost => 'Connessione Persa';

  @override
  String get connectionLostDesc =>
      'La connessione è stata interrotta. Controlla la tua connessione internet e riprova.';

  @override
  String get tryAgain => 'Riprova';

  @override
  String get connectOmiOmiGlass => 'Connetti Toki / TokiGlass';

  @override
  String get continueWithoutDevice => 'Continua Senza Dispositivo';

  @override
  String get permissionsRequired => 'Permessi Richiesti';

  @override
  String get permissionsRequiredDesc =>
      'Questa app ha bisogno dei permessi Bluetooth e Posizione per funzionare correttamente. Abilitali nelle impostazioni.';

  @override
  String get openSettings => 'Apri Impostazioni';

  @override
  String get wantDifferentName => 'Vuoi farti chiamare diversamente?';

  @override
  String get whatsYourName => 'Come ti chiami?';

  @override
  String get speakTranscribeSummarize => 'Parla. Trascrivi. Riassumi.';

  @override
  String get signInWithApple => 'Accedi con Apple';

  @override
  String get signInWithGoogle => 'Accedi con Google';

  @override
  String get byContinuingAgree => 'Continuando, accetti la nostra ';

  @override
  String get termsOfUse => 'Condizioni d\'Uso';

  @override
  String get omiYourAiCompanion => 'Toki – Il Tuo Compagno AI';

  @override
  String get captureEveryMoment =>
      'Cattura ogni momento. Ottieni riepiloghi\nbasati sull\'AI. Non prendere mai più appunti.';

  @override
  String get appleWatchSetup => 'Configurazione Apple Watch';

  @override
  String get permissionRequestedExclaim => 'Permesso Richiesto!';

  @override
  String get microphonePermission => 'Permesso Microfono';

  @override
  String get permissionGrantedNow =>
      'Permesso concesso! Ora:\n\nApri l\'app Toki sul tuo watch e tocca \"Continua\" qui sotto';

  @override
  String get needMicrophonePermission =>
      'Abbiamo bisogno del permesso microfono.\n\n1. Tocca \"Concedi Permesso\"\n2. Consenti sul tuo iPhone\n3. L\'app Watch si chiuderà\n4. Riaprila e tocca \"Continua\"';

  @override
  String get grantPermissionButton => 'Concedi Permesso';

  @override
  String get needHelp => 'Serve Aiuto?';

  @override
  String get troubleshootingSteps =>
      'Risoluzione problemi:\n\n1. Assicurati che Toki sia installato sul tuo watch\n2. Apri l\'app Toki sul tuo watch\n3. Cerca il popup di permesso\n4. Tocca \"Consenti\" quando richiesto\n5. L\'app sul watch si chiuderà - riaprila\n6. Torna e tocca \"Continua\" sul tuo iPhone';

  @override
  String get recordingStartedSuccessfully =>
      'Registrazione avviata con successo!';

  @override
  String get permissionNotGrantedYet =>
      'Permesso non ancora concesso. Assicurati di aver consentito l\'accesso al microfono e di aver riaperto l\'app sul tuo watch.';

  @override
  String errorRequestingPermission(String error) {
    return 'Errore durante la richiesta del permesso: $error';
  }

  @override
  String errorStartingRecording(String error) {
    return 'Errore durante l\'avvio della registrazione: $error';
  }

  @override
  String get selectPrimaryLanguage => 'Seleziona la tua lingua principale';

  @override
  String get languageBenefits =>
      'Imposta la tua lingua per trascrizioni più accurate e un\'esperienza personalizzata';

  @override
  String get whatsYourPrimaryLanguage => 'Qual è la tua lingua principale?';

  @override
  String get selectYourLanguage => 'Seleziona la tua lingua';

  @override
  String get personalGrowthJourney =>
      'Il tuo viaggio di crescita personale con l\'IA che ascolta ogni tua parola.';

  @override
  String get selectAll => 'Seleziona tutto';

  @override
  String get searchMemories => 'Cerca ricordi...';

  @override
  String get memoryDeleted => 'Ricordo Eliminato.';

  @override
  String get undo => 'Annulla';

  @override
  String get noMemoriesYet => '🧠 Nessun ricordo ancora';

  @override
  String get noManualMemories => 'Nessun ricordo manuale ancora';

  @override
  String get noMemoriesInCategories => 'Nessun ricordo in queste categorie';

  @override
  String get noMemoriesFound => '🔍 Nessun ricordo trovato';

  @override
  String get addFirstMemory => 'Aggiungi il tuo primo ricordo';

  @override
  String get clearMemoryTitle => 'Cancella Memoria di Toki';

  @override
  String get clearMemoryMessage =>
      'Sei sicuro di voler cancellare la memoria di Toki? Questa azione non può essere annullata.';

  @override
  String get clearMemoryButton => 'Cancella memoria';

  @override
  String get memoryClearedSuccess =>
      'La memoria di Toki su di te è stata cancellata';

  @override
  String get noMemoriesToDelete => 'Nessun ricordo da eliminare';

  @override
  String get createMemoryTooltip => 'Crea nuovo ricordo';

  @override
  String get memoryManagement => 'Gestione memoria';

  @override
  String get filterMemories => 'Filtra Ricordi';

  @override
  String totalMemoriesCount(int count) {
    return 'Hai $count ricordi totali';
  }

  @override
  String get publicMemories => 'Ricordi pubblici';

  @override
  String get privateMemories => 'Ricordi privati';

  @override
  String get makeAllPrivate => 'Rendi Tutti i Ricordi Privati';

  @override
  String get makeAllPublic => 'Rendi Tutti i Ricordi Pubblici';

  @override
  String get deleteAllMemories => 'Elimina tutti i ricordi';

  @override
  String get allMemoriesPrivateResult => 'Tutti i ricordi sono ora privati';

  @override
  String get allMemoriesPublicResult => 'Tutti i ricordi sono ora pubblici';

  @override
  String get newMemory => '✨ Nuova memoria';

  @override
  String get editMemory => '✏️ Modifica memoria';

  @override
  String get memoryContentHint => 'Mi piace mangiare il gelato...';

  @override
  String get failedToSaveMemory =>
      'Impossibile salvare. Controlla la tua connessione.';

  @override
  String get saveMemory => 'Salva Ricordo';

  @override
  String get retry => 'Riprova';

  @override
  String get createActionItem => 'Crea attività';

  @override
  String get actionItemDescriptionHint => 'Cosa bisogna fare?';

  @override
  String get actionItemDescriptionEmpty =>
      'La descrizione dell\'azione non può essere vuota.';

  @override
  String get actionItemUpdated => 'Azione aggiornata';

  @override
  String get failedToUpdateActionItem => 'Aggiornamento attività non riuscito';

  @override
  String get actionItemCreated => 'Azione creata';

  @override
  String get failedToCreateActionItem => 'Creazione attività non riuscita';

  @override
  String get time => 'Ora';

  @override
  String get addDueDate => 'Aggiungi data di scadenza';

  @override
  String get pressDoneToSave => 'Premi fatto per salvare';

  @override
  String get pressDoneToCreate => 'Premi fatto per creare';

  @override
  String get filterAll => 'Tutti';

  @override
  String get filterSystem => 'Su di Te';

  @override
  String get filterInteresting => 'Insight';

  @override
  String get filterManual => 'Manuale';

  @override
  String get completed => 'Completato';

  @override
  String get markComplete => 'Segna come completato';

  @override
  String get actionItemDeleted => 'Elemento di azione eliminato';

  @override
  String get failedToDeleteActionItem => 'Eliminazione attività non riuscita';

  @override
  String get deleteActionItemConfirmTitle => 'Elimina Azione';

  @override
  String get deleteActionItemConfirmMessage =>
      'Sei sicuro di voler eliminare questa azione?';

  @override
  String get appLanguage => 'Lingua App';

  @override
  String get appInterfaceSectionTitle => 'INTERFACCIA APP';

  @override
  String get speechTranscriptionSectionTitle => 'VOCE E TRASCRIZIONE';

  @override
  String get languageSettingsHelperText =>
      'La lingua dell\'app modifica menu e pulsanti. La lingua vocale influisce su come vengono trascritte le tue registrazioni.';

  @override
  String get translationNotice => 'Avviso di traduzione';

  @override
  String get translationNoticeMessage =>
      'Toki traduce le conversazioni nella tua lingua principale. Aggiornala in qualsiasi momento in Impostazioni → Profili.';

  @override
  String get pleaseCheckInternetConnection =>
      'Controlla la tua connessione Internet e riprova';

  @override
  String get pleaseSelectReason => 'Seleziona un motivo';

  @override
  String get tellUsMoreWhatWentWrong =>
      'Raccontaci di più su cosa è andato storto...';

  @override
  String get selectText => 'Seleziona testo';

  @override
  String maximumGoalsAllowed(int count) {
    return 'Massimo $count obiettivi consentiti';
  }

  @override
  String get conversationCannotBeMerged =>
      'Questa conversazione non può essere unita (bloccata o già in fase di unione)';

  @override
  String get pleaseEnterFolderName => 'Inserisci un nome per la cartella';

  @override
  String get failedToCreateFolder => 'Impossibile creare la cartella';

  @override
  String get failedToUpdateFolder => 'Impossibile aggiornare la cartella';

  @override
  String get folderName => 'Nome cartella';

  @override
  String get descriptionOptional => 'Descrizione (facoltativo)';

  @override
  String get failedToDeleteFolder => 'Impossibile eliminare la cartella';

  @override
  String get editFolder => 'Modifica cartella';

  @override
  String get deleteFolder => 'Elimina cartella';

  @override
  String get transcriptCopiedToClipboard =>
      'Trascrizione copiata negli appunti';

  @override
  String get actionItemsCopiedToClipboard =>
      'Elementi d\'azione copiati negli appunti';

  @override
  String get summarize => 'Riassumi';

  @override
  String get generateSummary => 'Genera riepilogo';

  @override
  String get conversationNotFoundOrDeleted =>
      'Conversazione non trovata o è stata eliminata';

  @override
  String get deleteMemory => 'Elimina memoria';

  @override
  String get thisActionCannotBeUndone =>
      'Questa azione non può essere annullata.';

  @override
  String memoriesCount(int count) {
    return '$count memorie';
  }

  @override
  String get noMemoriesInCategory =>
      'Nessuna memoria in questa categoria ancora';

  @override
  String get addYourFirstMemory => 'Aggiungi il tuo primo ricordo';

  @override
  String get firmwareDisconnectUsb => 'Disconnetti USB';

  @override
  String get firmwareUsbWarning =>
      'La connessione USB durante gli aggiornamenti può danneggiare il dispositivo.';

  @override
  String get firmwareBatteryAbove15 => 'Batteria sopra il 15%';

  @override
  String get firmwareEnsureBattery =>
      'Assicurati che il tuo dispositivo abbia il 15% di batteria.';

  @override
  String get firmwareStableConnection => 'Connessione stabile';

  @override
  String get firmwareConnectWifi => 'Connettiti a WiFi o rete cellulare.';

  @override
  String failedToStartUpdate(String error) {
    return 'Impossibile avviare l\'aggiornamento: $error';
  }

  @override
  String get beforeUpdateMakeSure => 'Prima dell\'aggiornamento, assicurati:';

  @override
  String get confirmed => 'Confermato!';

  @override
  String get release => 'Rilascia';

  @override
  String get slideToUpdate => 'Scorri per aggiornare';

  @override
  String copiedToClipboard(String title) {
    return '$title copiato negli appunti';
  }

  @override
  String get batteryLevel => 'Livello batteria';

  @override
  String get productUpdate => 'Aggiornamento prodotto';

  @override
  String get offline => 'Non in linea';

  @override
  String get available => 'Disponibile';

  @override
  String get unpairDeviceDialogTitle => 'Disaccoppia dispositivo';

  @override
  String get unpairDeviceDialogMessage =>
      'Questo disaccoppierà il dispositivo in modo che possa essere connesso a un altro telefono. Dovrai andare in Impostazioni > Bluetooth e dimenticare il dispositivo per completare il processo.';

  @override
  String get unpair => 'Disaccoppia';

  @override
  String get unpairAndForgetDevice => 'Disaccoppia e dimentica dispositivo';

  @override
  String get unknownDevice => 'Sconosciuto';

  @override
  String get unknown => 'Sconosciuto';

  @override
  String get productName => 'Nome prodotto';

  @override
  String get serialNumber => 'Numero di serie';

  @override
  String get connected => 'Connesso';

  @override
  String get privacyPolicyTitle => 'Informativa sulla privacy';

  @override
  String labelCopied(String label) {
    return '$label copiato';
  }

  @override
  String get noApiKeysYet =>
      'Nessuna chiave API ancora. Creane una per integrare con la tua app.';

  @override
  String get createKeyToGetStarted => 'Crea una chiave per iniziare';

  @override
  String get persona => 'Persona';

  @override
  String get configureSttProvider => 'Configura il provider STT';

  @override
  String get setWhenConversationsAutoEnd =>
      'Imposta quando le conversazioni terminano automaticamente';

  @override
  String get importDataFromOtherSources => 'Importa dati da altre fonti';

  @override
  String get debugAndDiagnostics => 'Debug e Diagnostica';

  @override
  String get helpsDiagnoseIssues => 'Aiuta a diagnosticare i problemi';

  @override
  String get exportConversationsToJson =>
      'Esporta le conversazioni in un file JSON';

  @override
  String get knowledgeGraphDeletedSuccess =>
      'Grafo della conoscenza eliminato con successo';

  @override
  String failedToDeleteGraph(String error) {
    return 'Impossibile eliminare il grafo: $error';
  }

  @override
  String get clearAllNodesAndConnections =>
      'Cancella tutti i nodi e le connessioni';

  @override
  String get addToClaudeDesktopConfig =>
      'Aggiungi a claude_desktop_config.json';

  @override
  String get useYourMcpApiKey => 'Usa la tua chiave API MCP';

  @override
  String get realTimeTranscript => 'Trascrizione in Tempo Reale';

  @override
  String get experimental => 'Sperimentale';

  @override
  String get transcriptionDiagnostics => 'Diagnostica Trascrizione';

  @override
  String get detailedDiagnosticMessages => 'Messaggi diagnostici dettagliati';

  @override
  String get autoCreateSpeakers => 'Crea Automaticamente Relatori';

  @override
  String get autoCreateWhenNameDetected =>
      'Crea automaticamente quando viene rilevato un nome';

  @override
  String get followUpQuestions => 'Domande di Follow-up';

  @override
  String get suggestQuestionsAfterConversations =>
      'Suggerisci domande dopo le conversazioni';

  @override
  String get goalTracker => 'Tracker degli Obiettivi';

  @override
  String get dailyReflection => 'Riflessione giornaliera';

  @override
  String get overdue => 'In ritardo';

  @override
  String get howDoesItWork => 'Come funziona?';

  @override
  String get sdCardSyncDescription =>
      'La sincronizzazione della scheda SD importerà i tuoi ricordi dalla scheda SD all\'app';

  @override
  String get checksForAudioFiles => 'Controlla i file audio sulla scheda SD';

  @override
  String get omiSyncsAudioFiles =>
      'Toki sincronizza quindi i file audio con il server';

  @override
  String get serverProcessesAudio =>
      'Il server elabora i file audio e crea ricordi';

  @override
  String get youreAllSet => 'Sei pronto!';

  @override
  String get back => 'Indietro';

  @override
  String get space => 'Spazio';

  @override
  String get search => 'Cerca';

  @override
  String get addGoal => 'Aggiungi obiettivo';

  @override
  String get editGoal => 'Modifica obiettivo';

  @override
  String get icon => 'Icona';

  @override
  String get goalTitle => 'Titolo obiettivo';

  @override
  String get current => 'Attuale';

  @override
  String get target => 'Obiettivo';

  @override
  String get goals => 'Obiettivi';

  @override
  String get noTasksForToday =>
      'Nessuna attività per oggi.\nChiedi a Toki più attività o creale manualmente.';

  @override
  String get dailyScore => 'PUNTEGGIO GIORNALIERO';

  @override
  String get dailyScoreDescription =>
      'Un punteggio per aiutarti a\nconcentrarti meglio sull\'esecuzione.';

  @override
  String get actionItems => 'Azioni da fare';

  @override
  String get tasksNoDeadline => 'Nessuna scadenza';

  @override
  String get tasksLater => 'Più tardi';

  @override
  String get tasks => 'Attività';

  @override
  String get create => 'Crea';

  @override
  String get noTasksYet => 'Nessuna attività ancora';

  @override
  String get monthJan => 'Gen';

  @override
  String get monthFeb => 'Feb';

  @override
  String get monthMar => 'Mar';

  @override
  String get monthApr => 'Apr';

  @override
  String get monthMay => 'Mag';

  @override
  String get monthJun => 'Giu';

  @override
  String get monthJul => 'Lug';

  @override
  String get monthAug => 'Ago';

  @override
  String get monthSep => 'Set';

  @override
  String get monthOct => 'Ott';

  @override
  String get monthNov => 'Nov';

  @override
  String get monthDec => 'Dic';

  @override
  String get timePM => 'PM';

  @override
  String get timeAM => 'AM';

  @override
  String get deleteActionItem => 'Elimina attività';

  @override
  String get all => 'All';

  @override
  String get open => 'Apri';

  @override
  String get install => 'Installa';

  @override
  String get pleaseCheckInternetConnectionAndTryAgain =>
      'Controlla la tua connessione Internet e riprova';

  @override
  String get chatPrompt => 'Prompt Chat';

  @override
  String get conversationPrompt => 'Prompt di conversazione';

  @override
  String get notificationScopes => 'Ambiti di Notifica';

  @override
  String get connectNow => 'Collega Ora';

  @override
  String get subscribe => 'Abbonati';

  @override
  String get setupInstructions => 'Istruzioni di configurazione';

  @override
  String get errorActivatingApp => 'Errore nell\'attivazione dell\'app';

  @override
  String get pleaseEnterAppName => 'Inserisci il nome dell\'app';

  @override
  String get startConversation =>
      'Inizia una conversazione e lascia che la magia inizi';

  @override
  String get takePhoto => 'Scatta foto';

  @override
  String get selectFile => 'Seleziona un file';

  @override
  String get clearChatTitle => 'Cancellare la chat?';

  @override
  String get confirmClearChat =>
      'Sei sicuro di voler cancellare la chat? Questa azione non può essere annullata.';

  @override
  String get copy => 'Copia';

  @override
  String get share => 'Condividi';

  @override
  String get report => 'Segnala';

  @override
  String get transcribing => 'Trascrizione...';

  @override
  String get discardedConversation => 'Conversazione scartata';

  @override
  String get at => 'alle';

  @override
  String get from => 'dalle';

  @override
  String get copied => 'Copiato!';

  @override
  String get transcript => 'Trascrizione';

  @override
  String get user => 'Utente';

  @override
  String get starred => 'Preferiti';

  @override
  String get date => 'Data';

  @override
  String get conversations => 'Conversazioni';

  @override
  String get chat => 'Chat';

  @override
  String get actions => 'Azioni';

  @override
  String get help => 'Aiuto';

  @override
  String get pro => 'Pro';

  @override
  String get allMemories => 'Tutti i ricordi';

  @override
  String get manual => 'Manuale';

  @override
  String get category => 'Categoria';

  @override
  String get public => 'Pubblico';

  @override
  String get createMemory => 'Crea memoria';

  @override
  String get total => 'Totale';

  @override
  String get continueWithApple => 'Continua con Apple';

  @override
  String get continueWithGoogle => 'Continua con Google';

  @override
  String get termsOfService => 'Termini di servizio';

  @override
  String get and => ' e ';

  @override
  String get dataAndPrivacy => 'Dati e privacy';

  @override
  String get dataProtection => 'Protezione dei dati';

  @override
  String get yourDataIsProtected =>
      'I tuoi dati sono protetti e regolati dalla nostra ';

  @override
  String get pleaseWait => 'Attendere prego...';

  @override
  String get teachOmiYourVoice => 'Insegna a Toki la tua voce';

  @override
  String get payment => 'Pagamento';

  @override
  String get deleteAccount => 'Elimina Account';

  @override
  String get exportConversations => 'Esporta conversazioni';

  @override
  String get saveSettings => 'Salva Impostazioni';

  @override
  String get summary => 'Riepilogo';

  @override
  String get auto => 'Automatico';

  @override
  String get noSummaryForApp =>
      'Nessun riepilogo disponibile per questa app. Prova un\'altra app per risultati migliori.';

  @override
  String get overview => 'Panoramica';

  @override
  String get unknownApp => 'App sconosciuta';

  @override
  String get reconnecting => 'Riconnessione...';

  @override
  String get startRecording => 'Avvia registrazione';

  @override
  String get paused => 'In pausa';

  @override
  String get recording => 'Registrazione';

  @override
  String get you => 'Tu';

  @override
  String speakerWithId(String speakerId) {
    return 'Relatore $speakerId';
  }

  @override
  String get systemAudio => 'Sistema';

  @override
  String get mic => 'Microfono';

  @override
  String get calendarIntegration => 'Integrazione Calendario';

  @override
  String get dailySummary => 'Riepilogo giornaliero';

  @override
  String get developer => 'Sviluppatore';

  @override
  String get about => 'Informazioni';

  @override
  String get selectTime => 'Seleziona orario';

  @override
  String get signOutQuestion => 'Disconnettersi?';

  @override
  String get signOutConfirmation => 'Sei sicuro di voler disconnetterti?';

  @override
  String get dailySummaryDescription =>
      'Ricevi un riepilogo personalizzato delle conversazioni della giornata come notifica.';

  @override
  String get deliveryTime => 'Orario di consegna';

  @override
  String get displayOptions => 'Opzioni di Visualizzazione';

  @override
  String get showMeetingsInMenuBar => 'Mostra Riunioni nella Barra dei Menu';

  @override
  String get upcomingMeetings => 'Riunioni imminenti';

  @override
  String get deleteKnowledgeGraphQuestion =>
      'Eliminare Grafico della Conoscenza?';

  @override
  String get dailyReflectionDescription =>
      'Ricevi un promemoria alle 21:00 per riflettere sulla tua giornata e catturare i tuoi pensieri.';

  @override
  String get capabilities => 'Capacità';

  @override
  String get updateApp => 'Aggiorna app';

  @override
  String get newVersionAvailable => 'Nuova versione disponibile  🎉';

  @override
  String get no => 'No';

  @override
  String get installs => 'INSTALLAZIONI';

  @override
  String get updateReview => 'Aggiorna recensione';

  @override
  String get weekdayMon => 'Lun';

  @override
  String get weekdayTue => 'Mar';

  @override
  String get weekdayWed => 'Mer';

  @override
  String get weekdayThu => 'Gio';

  @override
  String get weekdayFri => 'Ven';

  @override
  String get weekdaySat => 'Sab';

  @override
  String get weekdaySun => 'Dom';

  @override
  String serviceIntegrationComingSoon(String serviceName) {
    return 'Integrazione $serviceName in arrivo';
  }

  @override
  String alreadyExportedTo(String platform) {
    return 'Già esportato in $platform';
  }

  @override
  String get anotherPlatform => 'un\'altra piattaforma';

  @override
  String pleaseAuthenticateWithService(String serviceName) {
    return 'Per favore autenticati con $serviceName in Impostazioni > Integrazioni attività';
  }

  @override
  String addingToService(String serviceName) {
    return 'Aggiunta a $serviceName...';
  }

  @override
  String addedToService(String serviceName) {
    return 'Aggiunto a $serviceName';
  }

  @override
  String failedToAddToService(String serviceName) {
    return 'Impossibile aggiungere a $serviceName';
  }

  @override
  String get permissionDeniedForAppleReminders =>
      'Permesso negato per Apple Reminders';

  @override
  String get createAKey => 'Crea una chiave';

  @override
  String get revokeKey => 'Revoca chiave';

  @override
  String get revoke => 'Revoca';

  @override
  String get revokeKeyQuestion => 'Revocare la chiave?';

  @override
  String revokeKeyConfirmation(String keyName) {
    return 'Sei sicuro di voler revocare la chiave \"$keyName\"? Questa azione non può essere annullata.';
  }

  @override
  String get createNewKey => 'Crea nuova chiave';

  @override
  String get keyNameHint => 'es. Claude Desktop';

  @override
  String get pleaseEnterAName => 'Inserisci un nome.';

  @override
  String failedToCreateKeyWithError(String error) {
    return 'Impossibile creare la chiave: $error';
  }

  @override
  String get failedToCreateKeyTryAgain =>
      'Impossibile creare la chiave. Riprova.';

  @override
  String get keyCreated => 'Chiave creata';

  @override
  String get keyCreatedMessage =>
      'La tua nuova chiave è stata creata. Copiala ora. Non potrai vederla di nuovo.';

  @override
  String get keyWord => 'Chiave';

  @override
  String get noExternalAppsHaveAccess =>
      'Nessuna app esterna ha accesso ai tuoi dati.';

  @override
  String get maximumSecurityE2ee => 'Sicurezza massima (E2EE)';

  @override
  String get e2eeDescription =>
      'La crittografia end-to-end è lo standard d\'oro per la privacy. Quando abilitata, i tuoi dati vengono crittografati sul tuo dispositivo prima di essere inviati ai nostri server. Ciò significa che nessuno, nemmeno Toki, può accedere ai tuoi contenuti.';

  @override
  String get importantTradeoffs => 'Compromessi importanti:';

  @override
  String get e2eeTradeoff1 =>
      '• Alcune funzionalità come le integrazioni di app esterne potrebbero essere disabilitate.';

  @override
  String get e2eeTradeoff2 =>
      '• Se perdi la password, i tuoi dati non possono essere recuperati.';

  @override
  String get featureComingSoon =>
      'Questa funzionalità sarà disponibile presto!';

  @override
  String get migrationInProgressMessage =>
      'Migrazione in corso. Non puoi cambiare il livello di protezione finché non è completata.';

  @override
  String get migrationFailed => 'Migrazione fallita';

  @override
  String migratingFromTo(String source, String target) {
    return 'Migrazione da $source a $target';
  }

  @override
  String objectsCount(String processed, String total) {
    return '$processed / $total oggetti';
  }

  @override
  String get secureEncryption => 'Crittografia sicura';

  @override
  String get secureEncryptionDescription =>
      'I tuoi dati sono crittografati con una chiave unica per te sui nostri server, ospitati su Google Cloud. Ciò significa che i tuoi contenuti grezzi sono inaccessibili a chiunque, incluso il personale di Toki o Google, direttamente dal database.';

  @override
  String get endToEndEncryption => 'Crittografia end-to-end';

  @override
  String get e2eeCardDescription =>
      'Abilita per la massima sicurezza dove solo tu puoi accedere ai tuoi dati. Tocca per saperne di più.';

  @override
  String get dataAlwaysEncrypted =>
      'Indipendentemente dal livello, i tuoi dati sono sempre crittografati a riposo e in transito.';

  @override
  String get readOnlyScope => 'Solo lettura';

  @override
  String get fullAccessScope => 'Accesso completo';

  @override
  String get readScope => 'Lettura';

  @override
  String get writeScope => 'Scrittura';

  @override
  String get apiKeyCreated => 'Chiave API creata!';

  @override
  String get saveKeyWarning =>
      'Salva questa chiave ora! Non potrai vederla di nuovo.';

  @override
  String get yourApiKey => 'LA TUA CHIAVE API';

  @override
  String get tapToCopy => 'Tocca per copiare';

  @override
  String get copyKey => 'Copia chiave';

  @override
  String get createApiKey => 'Crea chiave API';

  @override
  String get accessDataProgrammatically =>
      'Accedi ai tuoi dati in modo programmatico';

  @override
  String get keyNameLabel => 'NOME CHIAVE';

  @override
  String get keyNamePlaceholder => 'es., La mia integrazione';

  @override
  String get permissionsLabel => 'PERMESSI';

  @override
  String get permissionsInfoNote =>
      'R = Lettura, W = Scrittura. Solo lettura di default se non viene selezionato nulla.';

  @override
  String get developerApi => 'API sviluppatore';

  @override
  String get createAKeyToGetStarted => 'Crea una chiave per iniziare';

  @override
  String errorWithMessage(String error) {
    return 'Errore: $error';
  }

  @override
  String get active => 'Attivo';

  @override
  String get configure => 'Configura';

  @override
  String get privacyInformation => 'Informazioni sulla privacy';

  @override
  String get yourPrivacyMattersToUs => 'La tua privacy è importante per noi';

  @override
  String get privacyIntroText =>
      'In Toki, prendiamo molto sul serio la tua privacy. Vogliamo essere trasparenti sui dati che raccogliamo e come li utilizziamo per migliorare il prodotto. Ecco cosa devi sapere:';

  @override
  String get whatWeTrack => 'Cosa monitoriamo';

  @override
  String get anonymityAndPrivacy => 'Anonimato e privacy';

  @override
  String get optInAndOptOutOptions => 'Opzioni di adesione e rinuncia';

  @override
  String get ourCommitment => 'Il nostro impegno';

  @override
  String get commitmentText =>
      'Ci impegniamo a utilizzare i dati raccolti solo per rendere Toki un prodotto migliore per te. La tua privacy e la tua fiducia sono fondamentali per noi.';

  @override
  String get thankYouText =>
      'Grazie per essere un utente prezioso di Toki. Se hai domande o dubbi, non esitare a contattarci a team@basedhardware.com.';

  @override
  String get password => 'Password';

  @override
  String summaryGeneratedForDate(String date) {
    return 'Riepilogo generato per $date';
  }

  @override
  String get failedToGenerateSummaryCheckConversations =>
      'Impossibile generare il riepilogo. Assicurati di avere conversazioni per quel giorno.';

  @override
  String get summaryNotFound => 'Riepilogo non trovato';

  @override
  String get yourDaysJourney => 'Il viaggio della tua giornata';

  @override
  String get highlights => 'In evidenza';

  @override
  String get unresolvedQuestions => 'Domande irrisolte';

  @override
  String get decisions => 'Decisioni';

  @override
  String get learnings => 'Apprendimenti';

  @override
  String get autoDeletesAfterThreeDays =>
      'Eliminato automaticamente dopo 3 giorni.';

  @override
  String get knowledgeGraphDeletedSuccessfully =>
      'Grafo della conoscenza eliminato con successo';

  @override
  String get exportStartedMayTakeFewSeconds =>
      'Esportazione avviata. Potrebbe richiedere qualche secondo...';

  @override
  String get knowledgeGraphDeleteDescription =>
      'Questo eliminerà tutti i dati derivati del grafo della conoscenza (nodi e connessioni). I tuoi ricordi originali rimarranno al sicuro. Il grafo verrà ricostruito nel tempo o alla prossima richiesta.';

  @override
  String accessesDataTypes(String dataTypes) {
    return 'Accede a $dataTypes';
  }

  @override
  String triggeredByType(String triggerType) {
    return 'attivato da $triggerType';
  }

  @override
  String accessesAndTriggeredBy(
    String accessDescription,
    String triggerDescription,
  ) {
    return '$accessDescription ed è $triggerDescription.';
  }

  @override
  String isTriggeredBy(String triggerDescription) {
    return 'È $triggerDescription.';
  }

  @override
  String get noSpecificDataAccessConfigured =>
      'Nessun accesso ai dati specifico configurato.';

  @override
  String get minutes => 'minuti';

  @override
  String get setupOnDevice => 'Configura sul dispositivo';

  @override
  String get importHistory => 'Cronologia importazione';

  @override
  String get noImportsYet => 'Nessuna importazione ancora';

  @override
  String get selectZipFileToImport => 'Seleziona il file .zip da importare!';

  @override
  String get otherDevicesComingSoon => 'Altri dispositivi prossimamente';

  @override
  String get deleteAllLimitlessConversations =>
      'Eliminare tutte le conversazioni Limitless?';

  @override
  String get deleteAllLimitlessWarning =>
      'Questo eliminerà permanentemente tutte le conversazioni importate da Limitless. Questa azione non può essere annullata.';

  @override
  String deletedLimitlessConversations(int count) {
    return 'Eliminate $count conversazioni Limitless';
  }

  @override
  String get failedToDeleteConversations =>
      'Impossibile eliminare le conversazioni';

  @override
  String get deleteImportedData => 'Elimina dati importati';

  @override
  String get statusPending => 'In attesa';

  @override
  String get statusProcessing => 'Elaborazione';

  @override
  String get statusCompleted => 'Completato';

  @override
  String get statusFailed => 'Fallito';

  @override
  String nConversations(int count) {
    return '$count conversazioni';
  }

  @override
  String get pleaseEnterName => 'Inserisci un nome';

  @override
  String get nameMustBeBetweenCharacters =>
      'Il nome deve essere compreso tra 2 e 40 caratteri';

  @override
  String get deleteSampleQuestion => 'Eliminare campione?';

  @override
  String deleteSampleConfirmation(String name) {
    return 'Sei sicuro di voler eliminare il campione di $name?';
  }

  @override
  String get confirmDeletion => 'Conferma eliminazione';

  @override
  String deletePersonConfirmation(String name) {
    return 'Sei sicuro di voler eliminare $name? Questo rimuoverà anche tutti i campioni vocali associati.';
  }

  @override
  String get howItWorksTitle => 'Come funziona?';

  @override
  String get howPeopleWorks =>
      'Una volta creata una persona, puoi andare alla trascrizione di una conversazione e assegnare i segmenti corrispondenti, in questo modo Toki sarà in grado di riconoscere anche la loro voce!';

  @override
  String get tapToDelete => 'Tocca per eliminare';

  @override
  String get newTag => 'NUOVO';

  @override
  String get localStorageEnabled => 'Archiviazione locale abilitata';

  @override
  String get localStorageDisabled => 'Archiviazione locale disabilitata';

  @override
  String failedToUpdateSettings(String error) {
    return 'Impossibile aggiornare le impostazioni: $error';
  }

  @override
  String get privacyNotice => 'Avviso sulla privacy';

  @override
  String get recordingsMayCaptureOthers =>
      'Le registrazioni potrebbero catturare le voci di altri. Assicurati di avere il consenso di tutti i partecipanti prima di abilitare.';

  @override
  String get enable => 'Attiva';

  @override
  String get storeAudioOnPhone => 'Archivia audio sul telefono';

  @override
  String get on => 'On';

  @override
  String get storeAudioDescription =>
      'Mantieni tutte le registrazioni audio memorizzate localmente sul tuo telefono. Quando disabilitato, vengono conservati solo i caricamenti non riusciti per risparmiare spazio.';

  @override
  String get enableLocalStorage => 'Abilita archiviazione locale';

  @override
  String get cloudStorageEnabled => 'Archiviazione cloud abilitata';

  @override
  String get cloudStorageDisabled => 'Archiviazione cloud disabilitata';

  @override
  String get enableCloudStorage => 'Abilita archiviazione cloud';

  @override
  String get storeAudioOnCloud => 'Archivia audio nel cloud';

  @override
  String get cloudStorageDialogMessage =>
      'Le tue registrazioni in tempo reale saranno archiviate in uno spazio di archiviazione cloud privato mentre parli.';

  @override
  String get storeAudioCloudDescription =>
      'Archivia le tue registrazioni in tempo reale nello spazio di archiviazione cloud privato mentre parli. L\'audio viene catturato e salvato in modo sicuro in tempo reale.';

  @override
  String get downloadingFirmware => 'Download del firmware';

  @override
  String get installingFirmware => 'Installazione del firmware';

  @override
  String get firmwareUpdateWarning =>
      'Non chiudere l\'app o spegnere il dispositivo. Questo potrebbe danneggiare il dispositivo.';

  @override
  String get firmwareUpdated => 'Firmware aggiornato';

  @override
  String restartDeviceToComplete(Object deviceName) {
    return 'Riavvia il tuo $deviceName per completare l\'aggiornamento.';
  }

  @override
  String get yourDeviceIsUpToDate => 'Il tuo dispositivo è aggiornato';

  @override
  String get currentVersion => 'Versione attuale';

  @override
  String get latestVersion => 'Ultima versione';

  @override
  String get whatsNew => 'Novità';

  @override
  String get installUpdate => 'Installa aggiornamento';

  @override
  String get updateNow => 'Aggiorna ora';

  @override
  String get updateGuide => 'Guida all\'aggiornamento';

  @override
  String get checkingForUpdates => 'Controllo aggiornamenti';

  @override
  String get checkingFirmwareVersion => 'Controllo versione firmware...';

  @override
  String get firmwareUpdate => 'Aggiornamento firmware';

  @override
  String get payments => 'Pagamenti';

  @override
  String get connectPaymentMethodInfo =>
      'Collega un metodo di pagamento qui sotto per iniziare a ricevere pagamenti per le tue app.';

  @override
  String get selectedPaymentMethod => 'Metodo di pagamento selezionato';

  @override
  String get availablePaymentMethods => 'Metodi di pagamento disponibili';

  @override
  String get setActive => 'Imposta come attivo';

  @override
  String get getPaidThroughStripe =>
      'Ricevi pagamenti per le vendite delle tue app tramite Stripe';

  @override
  String get monthlyPayouts => 'Pagamenti mensili';

  @override
  String get monthlyPayoutsDescription =>
      'Ricevi pagamenti mensili direttamente sul tuo conto quando raggiungi \$10 di guadagni';

  @override
  String get secureAndReliable => 'Sicuro e affidabile';

  @override
  String get stripeSecureDescription =>
      'Stripe garantisce trasferimenti sicuri e puntuali dei ricavi della tua app';

  @override
  String get selectYourCountry => 'Seleziona il tuo paese';

  @override
  String get countrySelectionPermanent =>
      'La selezione del paese è permanente e non può essere modificata in seguito.';

  @override
  String get byClickingConnectNow => 'Cliccando su \"Connetti ora\" accetti il';

  @override
  String get stripeConnectedAccountAgreement =>
      'Accordo Account Connesso Stripe';

  @override
  String get errorConnectingToStripe =>
      'Errore di connessione a Stripe! Riprova più tardi.';

  @override
  String get connectingYourStripeAccount =>
      'Connessione del tuo account Stripe';

  @override
  String get stripeOnboardingInstructions =>
      'Completa il processo di onboarding Stripe nel tuo browser. Questa pagina si aggiornerà automaticamente una volta completato.';

  @override
  String get failedTryAgain => 'Fallito? Riprova';

  @override
  String get illDoItLater => 'Lo farò più tardi';

  @override
  String get successfullyConnected => 'Connesso con successo!';

  @override
  String get stripeReadyForPayments =>
      'Il tuo account Stripe è ora pronto a ricevere pagamenti. Puoi iniziare a guadagnare dalle vendite delle tue app subito.';

  @override
  String get updateStripeDetails => 'Aggiorna dettagli Stripe';

  @override
  String get errorUpdatingStripeDetails =>
      'Errore nell\'aggiornamento dei dettagli Stripe! Riprova più tardi.';

  @override
  String get updatePayPal => 'Aggiorna PayPal';

  @override
  String get setUpPayPal => 'Configura PayPal';

  @override
  String get updatePayPalAccountDetails =>
      'Aggiorna i dettagli del tuo account PayPal';

  @override
  String get connectPayPalToReceivePayments =>
      'Collega il tuo account PayPal per iniziare a ricevere pagamenti per le tue app';

  @override
  String get paypalEmail => 'Email PayPal';

  @override
  String get paypalMeLink => 'Link PayPal.me';

  @override
  String get stripeRecommendation =>
      'Se Stripe è disponibile nel tuo paese, ti consigliamo vivamente di usarlo per pagamenti più veloci e facili.';

  @override
  String get updatePayPalDetails => 'Aggiorna dettagli PayPal';

  @override
  String get savePayPalDetails => 'Salva dettagli PayPal';

  @override
  String get pleaseEnterPayPalEmail =>
      'Inserisci il tuo indirizzo email PayPal';

  @override
  String get pleaseEnterPayPalMeLink => 'Inserisci il tuo link PayPal.me';

  @override
  String get doNotIncludeHttpInLink =>
      'Non includere http o https o www nel link';

  @override
  String get pleaseEnterValidPayPalMeLink =>
      'Inserisci un link PayPal.me valido';

  @override
  String get pleaseEnterValidEmail => 'Inserisci un indirizzo email valido';

  @override
  String get syncingYourRecordings =>
      'Sincronizzazione delle tue registrazioni';

  @override
  String get syncYourRecordings => 'Sincronizza le tue registrazioni';

  @override
  String get syncNow => 'Sincronizza ora';

  @override
  String get error => 'Errore';

  @override
  String get speechSamples => 'Campioni vocali';

  @override
  String additionalSampleIndex(String index) {
    return 'Campione aggiuntivo $index';
  }

  @override
  String durationSeconds(String seconds) {
    return 'Durata: $seconds secondi';
  }

  @override
  String get additionalSpeechSampleRemoved =>
      'Campione vocale aggiuntivo rimosso';

  @override
  String get consentDataMessage =>
      'Continuando, tutti i dati che condividi con questa app (incluse le tue conversazioni, registrazioni e informazioni personali) verranno archiviati in modo sicuro sui nostri server per fornirti approfondimenti basati sull\'IA e abilitare tutte le funzionalità dell\'app.';

  @override
  String get tasksEmptyStateMessage =>
      'Le attività dalle tue conversazioni appariranno qui.\nTocca + per crearne una manualmente.';

  @override
  String get clearChatAction => 'Cancella chat';

  @override
  String get omiAppName => 'Toki';

  @override
  String get showMore => 'mostra di più ↓';

  @override
  String get showLess => 'mostra meno ↑';

  @override
  String get loadingYourRecording => 'Caricamento della registrazione...';

  @override
  String get photoDiscardedMessage =>
      'Questa foto è stata scartata perché non era significativa.';

  @override
  String get analyzing => 'Analisi in corso...';

  @override
  String get searchCountries => 'Cerca paesi...';

  @override
  String get checkingAppleWatch => 'Controllo Apple Watch...';

  @override
  String get installOmiOnAppleWatch => 'Installa Toki sul tuo\nApple Watch';

  @override
  String get installOmiOnAppleWatchDescription =>
      'Per utilizzare il tuo Apple Watch con Toki, devi prima installare l\'app Toki sul tuo orologio.';

  @override
  String get openOmiOnAppleWatch => 'Apri Toki sul tuo\nApple Watch';

  @override
  String get openOmiOnAppleWatchDescription =>
      'L\'app Toki è installata sul tuo Apple Watch. Aprila e tocca Avvia per iniziare.';

  @override
  String get openWatchApp => 'Apri app Watch';

  @override
  String get iveInstalledAndOpenedTheApp => 'Ho installato e aperto l\'app';

  @override
  String get unableToOpenWatchApp =>
      'Impossibile aprire l\'app Apple Watch. Apri manualmente l\'app Watch sul tuo Apple Watch e installa Toki dalla sezione \"App disponibili\".';

  @override
  String get appleWatchConnectedSuccessfully =>
      'Apple Watch connesso con successo!';

  @override
  String get appleWatchNotReachable =>
      'Apple Watch ancora non raggiungibile. Assicurati che l\'app Toki sia aperta sul tuo orologio.';

  @override
  String errorCheckingConnection(String error) {
    return 'Errore durante il controllo della connessione: $error';
  }

  @override
  String get muted => 'Disattivato';

  @override
  String get processNow => 'Elabora ora';

  @override
  String get finishedConversation => 'Conversazione terminata?';

  @override
  String get stopRecordingConfirmation =>
      'Sei sicuro di voler interrompere la registrazione e riassumere la conversazione ora?';

  @override
  String get conversationEndsManually =>
      'La conversazione terminerà solo manualmente.';

  @override
  String conversationSummarizedAfterMinutes(int minutes, String suffix) {
    return 'La conversazione viene riassunta dopo $minutes minut$suffix di silenzio.';
  }

  @override
  String get dontAskAgain => 'Non chiedermelo più';

  @override
  String get waitingForTranscriptOrPhotos =>
      'In attesa di trascrizione o foto...';

  @override
  String get noSummaryYet => 'Nessun riepilogo ancora';

  @override
  String hints(String text) {
    return 'Suggerimenti: $text';
  }

  @override
  String get testConversationPrompt => 'Testa un prompt di conversazione';

  @override
  String get prompt => 'Prompt';

  @override
  String get result => 'Risultato:';

  @override
  String get compareTranscripts => 'Confronta trascrizioni';

  @override
  String get notHelpful => 'Non utile';

  @override
  String get exportTasksWithOneTap => 'Esporta le attività con un tocco!';

  @override
  String get inProgress => 'In corso';

  @override
  String get photos => 'Foto';

  @override
  String get rawData => 'Dati grezzi';

  @override
  String get content => 'Contenuto';

  @override
  String get noContentToDisplay => 'Nessun contenuto da visualizzare';

  @override
  String get noSummary => 'Nessun riepilogo';

  @override
  String get updateOmiFirmware => 'Aggiorna firmware omi';

  @override
  String loadMoreRemaining(String count) {
    return 'Carica altro ($count rimanenti)';
  }

  @override
  String wrappedTopPercentUser(String percentile) {
    return 'Top $percentile% Utente';
  }

  @override
  String get wrappedMinutes => 'minuti';

  @override
  String get wrappedConversations => 'conversazioni';

  @override
  String get wrappedDaysActive => 'giorni attivi';

  @override
  String get wrappedYouTalkedAbout => 'Hai parlato di';

  @override
  String get wrappedActionItems => 'Attività';

  @override
  String get wrappedTasksCreated => 'attività create';

  @override
  String get wrappedCompleted => 'completate';

  @override
  String wrappedCompletionRate(String rate) {
    return '$rate% tasso di completamento';
  }

  @override
  String get wrappedBestMoments => 'Momenti migliori';

  @override
  String get wrappedMyBuddies => 'I miei amici';

  @override
  String get wrappedCouldntStopTalkingAbout =>
      'Non riuscivo a smettere di parlare di';

  @override
  String get wrappedShow => 'SERIE';

  @override
  String get wrappedMovie => 'FILM';

  @override
  String get wrappedBook => 'LIBRO';

  @override
  String get wrappedCelebrity => 'CELEBRITÀ';

  @override
  String get wrappedFood => 'CIBO';

  @override
  String get wrappedMovieRecs => 'Consigli di film per amici';

  @override
  String get wrappedBiggest => 'La più grande';

  @override
  String get wrappedStruggle => 'Sfida';

  @override
  String get wrappedButYouPushedThrough => 'Ma ce l\'hai fatta 💪';

  @override
  String get wrappedWin => 'Vittoria';

  @override
  String get wrappedYouDidIt => 'Ce l\'hai fatta! 🎉';

  @override
  String get wrappedTopPhrases => 'Top 5 frasi';

  @override
  String get wrappedMins => 'min';

  @override
  String get wrappedConvos => 'conversazioni';

  @override
  String get wrappedDays => 'giorni';

  @override
  String get wrappedMyBuddiesLabel => 'I MIEI AMICI';

  @override
  String get wrappedObsessionsLabel => 'OSSESSIONI';

  @override
  String get wrappedStruggleLabel => 'SFIDA';

  @override
  String get wrappedWinLabel => 'VITTORIA';

  @override
  String get wrappedTopPhrasesLabel => 'TOP FRASI';

  @override
  String get wrappedLetsHitRewind => 'Riavvolgiamo il tuo';

  @override
  String get wrappedGenerateMyWrapped => 'Genera il mio Wrapped';

  @override
  String get wrappedProcessingDefault => 'Elaborazione...';

  @override
  String get wrappedCreatingYourStory =>
      'Creazione della tua\nstoria del 2025...';

  @override
  String get wrappedSomethingWentWrong => 'Qualcosa è\nandato storto';

  @override
  String get wrappedAnErrorOccurred => 'Si è verificato un errore';

  @override
  String get wrappedTryAgain => 'Riprova';

  @override
  String get wrappedNoDataAvailable => 'Nessun dato disponibile';

  @override
  String get wrappedOmiLifeRecap => 'Riepilogo vita Toki';

  @override
  String get wrappedSwipeUpToBegin => 'Scorri verso l\'alto per iniziare';

  @override
  String get wrappedShareText =>
      'Il mio 2025, ricordato da Toki ✨ omi.me/wrapped';

  @override
  String get wrappedFailedToShare => 'Condivisione fallita. Riprova.';

  @override
  String get wrappedFailedToStartGeneration =>
      'Avvio generazione fallito. Riprova.';

  @override
  String get wrappedStarting => 'Avvio...';

  @override
  String get wrappedShare => 'Condividi';

  @override
  String get wrappedMy2025 => 'Il mio 2025';

  @override
  String get wrappedRememberedByOmi => 'ricordato da Toki';

  @override
  String get wrappedMostFunDay => 'Più divertente';

  @override
  String get wrappedMostProductiveDay => 'Più produttivo';

  @override
  String get wrappedMostIntenseDay => 'Più intenso';

  @override
  String get wrappedFunniestMoment => 'Più divertente';

  @override
  String get wrappedMostCringeMoment => 'Più imbarazzante';

  @override
  String get wrappedTasksGenerated => 'attività generate';

  @override
  String get wrappedTasksCompleted => 'attività completate';

  @override
  String get wrappedTopFivePhrases => 'Top 5 frasi';

  @override
  String get wrappedAGreatDay => 'Una giornata fantastica';

  @override
  String get wrappedGettingItDone => 'Portare a termine';

  @override
  String get wrappedAChallenge => 'Una sfida';

  @override
  String get wrappedAHilariousMoment => 'Un momento esilarante';

  @override
  String get wrappedThatAwkwardMoment => 'Quel momento imbarazzante';

  @override
  String get wrappedYouHadFunnyMoments =>
      'Hai avuto momenti divertenti quest\'anno!';

  @override
  String get wrappedWeveAllBeenThere => 'Ci siamo passati tutti!';

  @override
  String get wrappedFriend => 'Amico';

  @override
  String get wrappedYourBuddy => 'Il tuo amico!';

  @override
  String get wrappedNotMentioned => 'Non menzionato';

  @override
  String get wrappedTheHardPart => 'La parte difficile';

  @override
  String get wrappedPersonalGrowth => 'Crescita personale';

  @override
  String get wrappedFunDay => 'Divertente';

  @override
  String get wrappedProductiveDay => 'Produttivo';

  @override
  String get wrappedIntenseDay => 'Intenso';

  @override
  String get wrappedFunnyMomentTitle => 'Momento divertente';

  @override
  String get wrappedCringeMomentTitle => 'Momento imbarazzante';

  @override
  String get wrappedCompletedLabel => 'Completato';

  @override
  String get wrappedMyBuddiesCard => 'I miei amici';

  @override
  String get wrappedBuddiesLabel => 'AMICI';

  @override
  String get wrappedObsessionsLabelUpper => 'OSSESSIONI';

  @override
  String get wrappedStruggleLabelUpper => 'SFIDA';

  @override
  String get wrappedWinLabelUpper => 'VITTORIA';

  @override
  String get wrappedTopPhrasesLabelUpper => 'TOP FRASI';

  @override
  String get wrappedBestHeader => 'Migliori';

  @override
  String get wrappedMomentsHeader => 'Momenti';

  @override
  String get wrappedBestMomentsBadge => 'Momenti migliori';

  @override
  String get wrappedBiggestHeader => 'Più grande';

  @override
  String get wrappedStruggleHeader => 'Sfida';

  @override
  String get wrappedWinHeader => 'Vittoria';

  @override
  String get wrappedButYouPushedThroughEmoji => 'Ma ce l\'hai fatta 💪';

  @override
  String get wrappedYouDidItEmoji => 'Ce l\'hai fatta! 🎉';

  @override
  String get wrappedHours => 'ore';

  @override
  String get wrappedActions => 'azioni';

  @override
  String get multipleSpeakersDetected => 'Rilevati più interlocutori';

  @override
  String get multipleSpeakersDescription =>
      'Sembra che ci siano più interlocutori nella registrazione. Assicurati di essere in un luogo tranquillo e riprova.';

  @override
  String get invalidRecordingDetected => 'Rilevata registrazione non valida';

  @override
  String get notEnoughSpeechDescription =>
      'Non è stato rilevato abbastanza parlato. Per favore parla di più e riprova.';

  @override
  String get speechDurationDescription =>
      'Assicurati di parlare almeno 5 secondi e non più di 90.';

  @override
  String get connectionLostDescription =>
      'La connessione è stata interrotta. Controlla la tua connessione internet e riprova.';

  @override
  String get howToTakeGoodSample => 'Come fare un buon campione?';

  @override
  String get goodSampleInstructions =>
      '1. Assicurati di essere in un luogo tranquillo.\n2. Parla chiaramente e naturalmente.\n3. Assicurati che il tuo dispositivo sia nella sua posizione naturale sul collo.\n\nUna volta creato, puoi sempre migliorarlo o rifarlo.';

  @override
  String get noDeviceConnectedUseMic =>
      'Nessun dispositivo connesso. Verrà utilizzato il microfono del telefono.';

  @override
  String get doItAgain => 'Rifai';

  @override
  String get listenToSpeechProfile => 'Ascolta il mio profilo vocale ➡️';

  @override
  String get recognizingOthers => 'Riconoscere gli altri 👀';

  @override
  String get keepGoingGreat => 'Continua così, stai andando benissimo';

  @override
  String get somethingWentWrongTryAgain =>
      'Qualcosa è andato storto! Riprova più tardi.';

  @override
  String get uploadingVoiceProfile => 'Caricamento del tuo profilo vocale....';

  @override
  String get memorizingYourVoice => 'Memorizzazione della tua voce...';

  @override
  String get personalizingExperience =>
      'Personalizzazione della tua esperienza...';

  @override
  String get notificationFrequency => 'Frequenza notifiche';

  @override
  String get dailyScoreBreakdown => 'Dettaglio punteggio giornaliero';

  @override
  String get todaysScore => 'Punteggio di oggi';

  @override
  String get tasksCompleted => 'Attività completate';

  @override
  String get completionRate => 'Tasso di completamento';

  @override
  String get howItWorks => 'Come funziona';

  @override
  String get dailyScoreExplanation =>
      'Il tuo punteggio giornaliero si basa sul completamento delle attività. Completa le tue attività per migliorare il punteggio!';

  @override
  String get notificationFrequencyDescription =>
      'Controlla quanto spesso Toki ti invia notifiche proattive e promemoria.';

  @override
  String get sliderOff => 'Off';

  @override
  String get sliderMax => 'Max.';

  @override
  String summaryGeneratedFor(String date) {
    return 'Riepilogo generato per $date';
  }

  @override
  String get failedToGenerateSummary =>
      'Impossibile generare il riepilogo. Assicurati di avere conversazioni per quel giorno.';

  @override
  String deleteQuoted(String name) {
    return 'Elimina \"$name\"';
  }

  @override
  String moveConversationsTo(int count) {
    return 'Sposta $count conversazioni in:';
  }

  @override
  String get noFolder => 'Nessuna cartella';

  @override
  String get removeFromAllFolders => 'Rimuovi da tutte le cartelle';

  @override
  String get frequencyOff => 'Disattivato';

  @override
  String get frequencyMinimal => 'Minimo';

  @override
  String get frequencyLow => 'Basso';

  @override
  String get frequencyBalanced => 'Bilanciato';

  @override
  String get frequencyHigh => 'Alto';

  @override
  String get frequencyMaximum => 'Massimo';

  @override
  String get frequencyDescOff => 'Nessuna notifica proattiva';

  @override
  String get frequencyDescMinimal => 'Solo promemoria critici';

  @override
  String get frequencyDescLow => 'Solo aggiornamenti importanti';

  @override
  String get frequencyDescBalanced => 'Promemoria utili regolari';

  @override
  String get frequencyDescHigh => 'Controlli frequenti';

  @override
  String get frequencyDescMaximum => 'Rimani costantemente coinvolto';

  @override
  String get clearChatQuestion => 'Cancellare la chat?';

  @override
  String get syncingMessages => 'Sincronizzazione messaggi con il server...';

  @override
  String get disable => 'Disabilita';

  @override
  String get photoLibrary => 'Libreria foto';

  @override
  String get chooseFile => 'Scegli file';

  @override
  String get configureAiPersona => 'Configura la tua persona AI';

  @override
  String get connectAiAssistantsToYourData =>
      'Collega assistenti AI ai tuoi dati';

  @override
  String get oAuth => 'OAuth';

  @override
  String get trackYourGoalsOnHomepage =>
      'Monitora i tuoi obiettivi personali nella homepage';

  @override
  String get deleteRecording => 'Elimina Registrazione';

  @override
  String get thisCannotBeUndone => 'Questa azione non può essere annullata.';

  @override
  String get sdCard => 'SD Card';

  @override
  String get fromSd => 'Da SD';

  @override
  String get limitless => 'Limitless';

  @override
  String get fastTransfer => 'Trasferimento rapido';

  @override
  String get syncingStatus => 'Sincronizzazione';

  @override
  String get failedStatus => 'Non riuscito';

  @override
  String etaLabel(String time) {
    return 'ETA: $time';
  }

  @override
  String get transferMethod => 'Metodo di trasferimento';

  @override
  String get fast => 'Veloce';

  @override
  String get ble => 'BLE';

  @override
  String get phone => 'Telefono';

  @override
  String get cancelSync => 'Annulla Sincronizzazione';

  @override
  String get cancelSyncMessage =>
      'I dati già scaricati saranno salvati. Potrai riprendere in seguito.';

  @override
  String get syncCancelled => 'Sincronizzazione annullata';

  @override
  String get wifiEnableFailed =>
      'Impossibile abilitare il WiFi sul dispositivo. Riprova.';

  @override
  String get deviceNoFastTransfer =>
      'Il tuo dispositivo non supporta il Trasferimento Rapido. Usa il Bluetooth invece.';

  @override
  String get enableHotspotMessage =>
      'Abilita l\'hotspot del telefono e riprova.';

  @override
  String get transferStartFailed =>
      'Impossibile avviare il trasferimento. Riprova.';

  @override
  String get deviceNotResponding => 'Il dispositivo non risponde. Riprova.';

  @override
  String get invalidWifiCredentials =>
      'Credenziali WiFi non valide. Controlla le impostazioni dell\'hotspot.';

  @override
  String get wifiConnectionFailed => 'Connessione WiFi fallita. Riprova.';

  @override
  String get sdCardProcessing => 'Elaborazione Scheda SD';

  @override
  String sdCardProcessingMessage(int count) {
    return 'Elaborazione di $count registrazione/i. I file saranno rimossi dalla scheda SD al termine.';
  }

  @override
  String get process => 'Elabora';

  @override
  String get wifiSyncFailed => 'Sincronizzazione WiFi Fallita';

  @override
  String get processingFailed => 'Elaborazione Fallita';

  @override
  String processingProgress(int current, int total) {
    return 'Elaborazione $current/$total';
  }

  @override
  String conversationsCreated(int count) {
    return '$count conversazioni create';
  }

  @override
  String get internetRequired => 'Connessione internet richiesta';

  @override
  String get processAudio => 'Elabora audio';

  @override
  String get start => 'Avvia';

  @override
  String get noRecordings => 'Nessuna registrazione';

  @override
  String get audioFromOmiWillAppearHere =>
      'L\'audio dal tuo dispositivo Toki apparirà qui';

  @override
  String get recordings => 'Registrazioni';

  @override
  String get enableRemindersAccess =>
      'Abilita l\'accesso ai Promemoria nelle Impostazioni per utilizzare Promemoria Apple';

  @override
  String todayAtTime(String time) {
    return 'Oggi alle $time';
  }

  @override
  String yesterdayAtTime(String time) {
    return 'Ieri alle $time';
  }

  @override
  String get lessThanAMinute => 'Meno di un minuto';

  @override
  String estimatedMinutes(int count) {
    return '~$count minuto/i';
  }

  @override
  String estimatedHours(int count) {
    return '~$count ora/e';
  }

  @override
  String estimatedTimeRemaining(String time) {
    return 'Stimato: $time rimanenti';
  }

  @override
  String get summarizingConversation =>
      'Riepilogo della conversazione...\nPotrebbe richiedere alcuni secondi';

  @override
  String get resummarizingConversation =>
      'Nuovo riepilogo della conversazione...\nPotrebbe richiedere alcuni secondi';

  @override
  String get nothingInterestingRetry =>
      'Niente di interessante trovato,\nvuoi riprovare?';

  @override
  String get noSummaryForConversation =>
      'Nessun riepilogo disponibile\nper questa conversazione.';

  @override
  String get unknownLocation => 'Posizione sconosciuta';

  @override
  String get couldNotLoadMap => 'Impossibile caricare la mappa';

  @override
  String get triggerConversationIntegration =>
      'Attiva integrazione creazione conversazione';

  @override
  String get webhookUrlNotSet => 'URL webhook non impostato';

  @override
  String get setWebhookUrlInSettings =>
      'Imposta l\'URL del webhook nelle impostazioni sviluppatore per usare questa funzione.';

  @override
  String get debugModeDetected => 'Modalità debug rilevata';

  @override
  String get performanceReduced => 'Le prestazioni potrebbero essere ridotte';

  @override
  String autoClosingInSeconds(int seconds) {
    return 'Chiusura automatica tra $seconds secondi';
  }

  @override
  String get modelRequired => 'Modello richiesto';

  @override
  String get downloadWhisperModel =>
      'Scarica un modello whisper per utilizzare la trascrizione sul dispositivo';

  @override
  String get deviceNotCompatible =>
      'Il tuo dispositivo non è compatibile con la trascrizione sul dispositivo';

  @override
  String get willLikelyCrash =>
      'Abilitare questo probabilmente causerà il crash o il blocco dellapp.';

  @override
  String get transcriptionSlowerLessAccurate =>
      'La trascrizione sarà significativamente più lenta e meno accurata.';

  @override
  String get proceedAnyway => 'Procedi comunque';

  @override
  String get olderDeviceDetected => 'Rilevato dispositivo più vecchio';

  @override
  String get batteryUsageHigher =>
      'Il consumo della batteria sarà maggiore rispetto alla trascrizione cloud.';

  @override
  String get considerOmiCloud =>
      'Considera di usare Toki Cloud per prestazioni migliori.';

  @override
  String get highResourceUsage => 'Alto utilizzo delle risorse';

  @override
  String get deviceMayWarmUp =>
      'Il dispositivo potrebbe surriscaldarsi durante un uso prolungato.';

  @override
  String get speedAccuracyLower =>
      'Velocità e precisione potrebbero essere inferiori rispetto ai modelli Cloud.';

  @override
  String get cloudProvider => 'Provider cloud';

  @override
  String get model => 'Modello';

  @override
  String get performanceWarning => 'Avviso sulle prestazioni';

  @override
  String get usingNativeIosSpeech =>
      'Utilizzo del riconoscimento vocale nativo iOS';

  @override
  String get modelReady => 'Modello pronto';

  @override
  String get doNotCloseApp => 'Non chiudere lapp.';

  @override
  String get downloading => 'Download in corso...';

  @override
  String get downloadModel => 'Scarica modello';

  @override
  String estimatedSize(String size) {
    return 'Dimensione stimata: ~$size MB';
  }

  @override
  String availableSpace(String space) {
    return 'Spazio disponibile: $space';
  }

  @override
  String get notEnoughSpace => 'Attenzione: Spazio insufficiente!';

  @override
  String get download => 'Scarica';

  @override
  String downloadError(String error) {
    return 'Errore di download: $error';
  }

  @override
  String get cancelled => 'Annullato';

  @override
  String get deviceNotCompatibleTitle => 'Dispositivo non compatibile';

  @override
  String get deviceNotMeetRequirements =>
      'Il tuo dispositivo non soddisfa i requisiti per la trascrizione sul dispositivo.';

  @override
  String get transcriptionSlowerOnDevice =>
      'La trascrizione sul dispositivo potrebbe essere più lenta su questo dispositivo.';

  @override
  String get computationallyIntensive =>
      'La trascrizione sul dispositivo è computazionalmente intensiva.';

  @override
  String get batteryDrainSignificantly =>
      'Il consumo della batteria aumenterà significativamente.';

  @override
  String get audioProcessedLocally =>
      'Laudio viene elaborato localmente. Funziona offline, più privato, ma consuma più batteria.';

  @override
  String get languageLabel => 'Lingua';

  @override
  String get modelLabel => 'Modello';

  @override
  String get modelTooLargeWarning =>
      'Questo modello è grande e potrebbe causare il crash dellapp o un funzionamento molto lento sui dispositivi mobili.\n\nSi consiglia small o base.';

  @override
  String get nativeEngineNoDownload =>
      'Verrà utilizzato il motore vocale nativo del tuo dispositivo. Non è necessario scaricare un modello.';

  @override
  String modelReadyWithName(String model) {
    return 'Modello pronto ($model)';
  }

  @override
  String get reDownload => 'Scarica di nuovo';

  @override
  String downloadingModelProgress(String model, String received, String total) {
    return 'Download di $model: $received / $total MB';
  }

  @override
  String preparingModel(String model) {
    return 'Preparazione di $model...';
  }

  @override
  String downloadErrorWithMessage(String error) {
    return 'Errore di download: $error';
  }

  @override
  String estimatedSizeWithValue(String size) {
    return 'Dimensione stimata: ~$size MB';
  }

  @override
  String availableSpaceWithValue(String space) {
    return 'Spazio disponibile: $space';
  }

  @override
  String get omiTranscriptionOptimized =>
      'La trascrizione live integrata di Toki è ottimizzata per conversazioni in tempo reale con rilevamento automatico dei parlanti e diarizzazione.';

  @override
  String get reset => 'Reimposta';

  @override
  String get useTemplateFrom => 'Usa modello da';

  @override
  String get selectProviderTemplate => 'Seleziona un modello provider...';

  @override
  String get quicklyPopulateResponse =>
      'Compila rapidamente con un formato di risposta provider noto';

  @override
  String get quicklyPopulateRequest =>
      'Compila rapidamente con un formato di richiesta provider noto';

  @override
  String get invalidJsonError => 'JSON non valido';

  @override
  String downloadModelWithName(String model) {
    return 'Scarica modello ($model)';
  }

  @override
  String modelNameWithFile(String model) {
    return 'Modello: $model';
  }

  @override
  String get device => 'Dispositivo';

  @override
  String get setupCompleted => 'Completato';

  @override
  String get setupQuestionsIntro =>
      'Rispondi ad alcune domande per personalizzare la tua esperienza';

  @override
  String get setupQuestionProfession => '1. Qual è la tua professione?';

  @override
  String get setupQuestionUsage => '2. Dove prevedi di usare il tuo Toki?';

  @override
  String get setupQuestionAge => '3. Quanti anni hai?';

  @override
  String get setupAnswerAllQuestions =>
      'Non hai ancora risposto a tutte le domande! 🥺';

  @override
  String get setupSkipHelp => 'Salta, non voglio aiutare :C';

  @override
  String get professionEntrepreneur => 'Imprenditore';

  @override
  String get professionSoftwareEngineer => 'Ingegnere del software';

  @override
  String get professionProductManager => 'Product Manager';

  @override
  String get professionExecutive => 'Dirigente';

  @override
  String get professionSales => 'Vendite';

  @override
  String get professionStudent => 'Studente';

  @override
  String get usageAtWork => 'Al lavoro';

  @override
  String get usageIrlEvents => 'Eventi dal vivo';

  @override
  String get usageOnline => 'Online';

  @override
  String get usageSocialSettings => 'In contesti sociali';

  @override
  String get usageEverywhere => 'Ovunque';

  @override
  String get customBackendUrlTitle => 'URL del server personalizzato';

  @override
  String get backendUrlLabel => 'URL del server';

  @override
  String get saveUrlButton => 'Salva URL';

  @override
  String get enterBackendUrlError => 'Inserisci l\'URL del server';

  @override
  String get urlMustEndWithSlashError => 'L\'URL deve terminare con \"/\"';

  @override
  String get invalidUrlError => 'Inserisci un URL valido';

  @override
  String get backendUrlSavedSuccess => 'URL del server salvato con successo!';

  @override
  String get signInTitle => 'Accedi';

  @override
  String get signInButton => 'Accedi';

  @override
  String get enterEmailError => 'Inserisci la tua email';

  @override
  String get invalidEmailError => 'Inserisci un\'email valida';

  @override
  String get enterPasswordError => 'Inserisci la tua password';

  @override
  String get passwordMinLengthError =>
      'La password deve essere di almeno 8 caratteri';

  @override
  String get signInSuccess => 'Accesso riuscito!';

  @override
  String get alreadyHaveAccountLogin => 'Hai già un account? Accedi';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get createAccountTitle => 'Crea account';

  @override
  String get nameLabel => 'Nome';

  @override
  String get repeatPasswordLabel => 'Ripeti password';

  @override
  String get signUpButton => 'Registrati';

  @override
  String get enterNameError => 'Inserisci il tuo nome';

  @override
  String get passwordsDoNotMatch => 'Le password non corrispondono';

  @override
  String get signUpSuccess => 'Registrazione riuscita!';

  @override
  String get loadingKnowledgeGraph =>
      'Caricamento del grafo della conoscenza...';

  @override
  String get noKnowledgeGraphYet => 'Nessun grafo della conoscenza ancora';

  @override
  String get buildingKnowledgeGraphFromMemories =>
      'Costruzione del grafo della conoscenza dai ricordi...';

  @override
  String get knowledgeGraphWillBuildAutomatically =>
      'Il tuo grafo della conoscenza verrà costruito automaticamente quando creerai nuovi ricordi.';

  @override
  String get buildGraphButton => 'Costruisci grafo';

  @override
  String get checkOutMyMemoryGraph => 'Guarda il mio grafo della memoria!';

  @override
  String get send => 'Invia';

  @override
  String get sharePublicLink => 'Condividi link pubblico';

  @override
  String get makePersonaPublic => 'Rendi pubblica la Persona';

  @override
  String get connectedKnowledgeData => 'Dati di conoscenza collegati';

  @override
  String get enterName => 'Inserisci il nome';

  @override
  String get disconnectTwitter => 'Disconnetti Twitter';

  @override
  String get disconnectTwitterConfirmation =>
      'Sei sicuro di voler disconnettere il tuo account Twitter? La tua persona non avrà più accesso ai tuoi dati Twitter.';

  @override
  String get iHaveOmiDevice => 'Ho un dispositivo Toki';

  @override
  String get goal => 'OBIETTIVO';

  @override
  String get tapToTrackThisGoal => 'Tocca per monitorare questo obiettivo';

  @override
  String get tapToSetAGoal => 'Tocca per impostare un obiettivo';

  @override
  String get processedConversations => 'Conversazioni elaborate';

  @override
  String get updatedConversations => 'Conversazioni aggiornate';

  @override
  String get newConversations => 'Nuove conversazioni';

  @override
  String get createCustomTemplate => 'Crea modello personalizzato';

  @override
  String tagSpeaker(int speakerId) {
    return 'Tagga Speaker $speakerId';
  }

  @override
  String get personNameAlreadyExists => 'Questo nome esiste già';

  @override
  String get selectYouFromList =>
      'Per taggare te stesso, seleziona \"Tu\" dalla lista.';

  @override
  String get enterPersonsName => 'Inserisci il nome della persona';

  @override
  String get addPerson => 'Aggiungi persona';

  @override
  String tagOtherSegmentsFromSpeaker(int selected, int total) {
    return 'Tagga altri segmenti di questo speaker ($selected/$total)';
  }

  @override
  String get tagOtherSegments => 'Tagga altri segmenti';

  @override
  String get managePeople => 'Gestisci persone';

  @override
  String get shareViaSms => 'Condividi via SMS';

  @override
  String get selectContactsToShareSummary =>
      'Seleziona i contatti per condividere il riepilogo della conversazione';

  @override
  String get searchContactsHint => 'Cerca contatti...';

  @override
  String contactsSelectedCount(int count) {
    return '$count selezionati';
  }

  @override
  String get clearAllSelection => 'Cancella tutto';

  @override
  String get selectContactsToShare => 'Seleziona i contatti da condividere';

  @override
  String shareWithContactCount(int count) {
    return 'Condividi con $count contatto';
  }

  @override
  String shareWithContactsCount(int count) {
    return 'Condividi con $count contatti';
  }

  @override
  String get contactsPermissionRequired => 'Autorizzazione contatti richiesta';

  @override
  String get contactsPermissionRequiredForSms =>
      'L\'autorizzazione ai contatti è necessaria per condividere via SMS';

  @override
  String get grantContactsPermissionForSms =>
      'Concedi l\'autorizzazione ai contatti per condividere via SMS';

  @override
  String get noContactsWithPhoneNumbers =>
      'Nessun contatto con numero di telefono trovato';

  @override
  String get noContactsMatchSearch =>
      'Nessun contatto corrisponde alla ricerca';

  @override
  String get failedToLoadContacts => 'Impossibile caricare i contatti';

  @override
  String get failedToPrepareConversationForSharing =>
      'Impossibile preparare la conversazione per la condivisione. Riprova.';

  @override
  String get couldNotOpenSmsApp => 'Impossibile aprire l\'app SMS. Riprova.';

  @override
  String heresWhatWeDiscussed(String link) {
    return 'Ecco di cosa abbiamo appena discusso: $link';
  }

  @override
  String get wifiSync => 'Sincronizzazione WiFi';

  @override
  String itemCopiedToClipboard(String item) {
    return '$item copiato negli appunti';
  }

  @override
  String get wifiConnectionFailedTitle => 'Connessione fallita';

  @override
  String connectingToDeviceName(String deviceName) {
    return 'Connessione a $deviceName...';
  }

  @override
  String enableDeviceWifi(String deviceName) {
    return 'Abilita il WiFi di $deviceName';
  }

  @override
  String connectToDeviceName(String deviceName) {
    return 'Connetti a $deviceName';
  }

  @override
  String get recordingDetails => 'Dettagli registrazione';

  @override
  String get storageLocationSdCard => 'Scheda SD';

  @override
  String get storageLocationLimitlessPendant => 'Limitless Pendant';

  @override
  String get storageLocationPhone => 'Telefono';

  @override
  String get storageLocationPhoneMemory => 'Telefono (memoria)';

  @override
  String storedOnDevice(String deviceName) {
    return 'Memorizzato su $deviceName';
  }

  @override
  String get transferring => 'Trasferimento in corso...';

  @override
  String get transferRequired => 'Trasferimento Richiesto';

  @override
  String get downloadingAudioFromSdCard =>
      'Scaricamento audio dalla scheda SD del dispositivo';

  @override
  String get transferRequiredDescription =>
      'Questa registrazione è memorizzata sulla scheda SD del tuo dispositivo. Trasferiscila sul telefono per riprodurla o condividerla.';

  @override
  String get cancelTransfer => 'Annulla Trasferimento';

  @override
  String get transferToPhone => 'Trasferisci sul Telefono';

  @override
  String get privateAndSecureOnDevice => 'Privato e sicuro sul tuo dispositivo';

  @override
  String get recordingInfo => 'Info registrazione';

  @override
  String get transferInProgress => 'Trasferimento in corso...';

  @override
  String get shareRecording => 'Condividi registrazione';

  @override
  String get deleteRecordingConfirmation =>
      'Sei sicuro di voler eliminare permanentemente questa registrazione? Questa azione non può essere annullata.';

  @override
  String get recordingIdLabel => 'ID registrazione';

  @override
  String get dateTimeLabel => 'Data e ora';

  @override
  String get durationLabel => 'Durata';

  @override
  String get audioFormatLabel => 'Formato audio';

  @override
  String get storageLocationLabel => 'Posizione di Archiviazione';

  @override
  String get estimatedSizeLabel => 'Dimensione stimata';

  @override
  String get deviceModelLabel => 'Modello dispositivo';

  @override
  String get deviceIdLabel => 'ID dispositivo';

  @override
  String get statusLabel => 'Stato';

  @override
  String get statusProcessed => 'Elaborato';

  @override
  String get statusUnprocessed => 'Non elaborato';

  @override
  String get switchedToFastTransfer => 'Passato al Trasferimento Rapido';

  @override
  String get transferCompleteMessage =>
      'Trasferimento completato! Ora puoi riprodurre questa registrazione.';

  @override
  String transferFailedMessage(String error) {
    return 'Trasferimento fallito: $error';
  }

  @override
  String get transferCancelled => 'Trasferimento annullato';

  @override
  String get fastTransferEnabled => 'Trasferimento rapido abilitato';

  @override
  String get bluetoothSyncEnabled => 'Sincronizzazione Bluetooth abilitata';

  @override
  String get enableFastTransfer => 'Abilita trasferimento rapido';

  @override
  String get fastTransferDescription =>
      'Il trasferimento rapido utilizza il WiFi per velocità ~5x più veloci. Il tuo telefono si connetterà temporaneamente alla rete WiFi del dispositivo Toki durante il trasferimento.';

  @override
  String get internetAccessPausedDuringTransfer =>
      'L\'accesso a Internet è sospeso durante il trasferimento';

  @override
  String get chooseTransferMethodDescription =>
      'Scegli come le registrazioni vengono trasferite dal dispositivo Toki al telefono.';

  @override
  String get wifiSpeed => '~150 KB/s via WiFi';

  @override
  String get fiveTimesFaster => '5X PIÙ VELOCE';

  @override
  String get fastTransferMethodDescription =>
      'Crea una connessione WiFi diretta al dispositivo Toki. Il telefono si disconnette temporaneamente dal WiFi normale durante il trasferimento.';

  @override
  String get bluetooth => 'Bluetooth';

  @override
  String get bleSpeed => '~30 KB/s via BLE';

  @override
  String get bluetoothMethodDescription =>
      'Utilizza la connessione Bluetooth Low Energy standard. Più lento ma non influisce sulla connessione WiFi.';

  @override
  String get selected => 'Selezionato';

  @override
  String get selectOption => 'Seleziona';

  @override
  String get lowBatteryAlertTitle => 'Avviso batteria scarica';

  @override
  String get lowBatteryAlertBody =>
      'La batteria del dispositivo è scarica. È ora di ricaricare! 🔋';

  @override
  String get deviceDisconnectedNotificationTitle =>
      'Il tuo dispositivo Toki si è disconnesso';

  @override
  String get deviceDisconnectedNotificationBody =>
      'Riconnettiti per continuare a usare Toki.';

  @override
  String get firmwareUpdateAvailable => 'Aggiornamento firmware disponibile';

  @override
  String firmwareUpdateAvailableDescription(String version) {
    return 'È disponibile un nuovo aggiornamento firmware ($version) per il tuo dispositivo Toki. Vuoi aggiornare ora?';
  }

  @override
  String get later => 'Più tardi';

  @override
  String get appDeletedSuccessfully => 'App eliminata con successo';

  @override
  String get appDeleteFailed =>
      'Impossibile eliminare l\'app. Riprova più tardi.';

  @override
  String get appVisibilityChangedSuccessfully =>
      'Visibilità dell\'app modificata con successo. Potrebbero essere necessari alcuni minuti.';

  @override
  String get errorActivatingAppIntegration =>
      'Errore nell\'attivazione dell\'app. Se è un\'app di integrazione, assicurati che la configurazione sia completata.';

  @override
  String get errorUpdatingAppStatus =>
      'Si è verificato un errore durante l\'aggiornamento dello stato dell\'app.';

  @override
  String get calculatingETA => 'Calcolo in corso...';

  @override
  String aboutMinutesRemaining(int minutes) {
    return 'Circa $minutes minuti rimanenti';
  }

  @override
  String get aboutAMinuteRemaining => 'Circa un minuto rimanente';

  @override
  String get almostDone => 'Quasi fatto...';

  @override
  String get omiSays => 'omi says';

  @override
  String get analyzingYourData => 'Analisi dei tuoi dati...';

  @override
  String migratingToProtection(String level) {
    return 'Migrazione alla protezione $level...';
  }

  @override
  String get noDataToMigrateFinalizing =>
      'Nessun dato da migrare. Finalizzazione...';

  @override
  String migratingItemsProgress(String itemType, int percentage) {
    return 'Migrazione di $itemType... $percentage%';
  }

  @override
  String get allObjectsMigratedFinalizing =>
      'Tutti gli oggetti migrati. Finalizzazione...';

  @override
  String get migrationErrorOccurred =>
      'Si è verificato un errore durante la migrazione. Riprova.';

  @override
  String get migrationComplete => 'Migrazione completata!';

  @override
  String dataProtectedWithSettings(String level) {
    return 'I tuoi dati sono ora protetti con le nuove impostazioni $level.';
  }

  @override
  String get chatsLowercase => 'chat';

  @override
  String get dataLowercase => 'dati';

  @override
  String get fallNotificationTitle => 'Ahi';

  @override
  String get fallNotificationBody => 'Sei caduto?';

  @override
  String get importantConversationTitle => 'Conversazione importante';

  @override
  String get importantConversationBody =>
      'Hai appena avuto una conversazione importante. Tocca per condividere il riepilogo.';

  @override
  String get templateName => 'Nome modello';

  @override
  String get templateNameHint => 'es. Estrattore azioni riunione';

  @override
  String get nameMustBeAtLeast3Characters =>
      'Il nome deve essere di almeno 3 caratteri';

  @override
  String get conversationPromptHint =>
      'es., Estrai azioni, decisioni prese e punti chiave dalla conversazione fornita.';

  @override
  String get pleaseEnterAppPrompt => 'Inserisci un prompt per la tua app';

  @override
  String get promptMustBeAtLeast10Characters =>
      'Il prompt deve essere di almeno 10 caratteri';

  @override
  String get anyoneCanDiscoverTemplate =>
      'Chiunque può scoprire il tuo modello';

  @override
  String get onlyYouCanUseTemplate => 'Solo tu puoi usare questo modello';

  @override
  String get generatingDescription => 'Generazione descrizione...';

  @override
  String get creatingAppIcon => 'Creazione icona app...';

  @override
  String get installingApp => 'Installazione app...';

  @override
  String get appCreatedAndInstalled => 'App creata e installata!';

  @override
  String get appCreatedSuccessfully => 'App creata con successo!';

  @override
  String get personaTwitterHandleNotFound => 'Handle Twitter non trovato';

  @override
  String get personaTwitterHandleSuspended => 'Handle Twitter sospeso';

  @override
  String get personaFailedToVerifyTwitter => 'Verifica handle Twitter fallita';

  @override
  String get personaFailedToFetch => 'Recupero persona fallito';

  @override
  String get personaFailedToCreate => 'Creazione persona fallita';

  @override
  String get personaConnectKnowledgeSource =>
      'Collega almeno una fonte dati (Toki o Twitter)';

  @override
  String get personaUpdatedSuccessfully => 'Persona aggiornata con successo';

  @override
  String get personaFailedToUpdate => 'Aggiornamento persona fallito';

  @override
  String get personaPleaseSelectImage => 'Seleziona un\'immagine';

  @override
  String get personaFailedToCreateTryLater =>
      'Creazione persona fallita. Riprova più tardi.';

  @override
  String personaFailedToCreateWithError(String error) {
    return 'Creazione persona fallita: $error';
  }

  @override
  String get personaFailedToEnable => 'Attivazione persona fallita';

  @override
  String personaErrorEnablingWithError(String error) {
    return 'Errore nell\'attivazione della persona: $error';
  }

  @override
  String get paymentFailedToFetchCountries =>
      'Recupero paesi supportati fallito. Riprova più tardi.';

  @override
  String get paymentFailedToSetDefault =>
      'Impostazione metodo di pagamento predefinito fallita. Riprova più tardi.';

  @override
  String get paymentFailedToSavePaypal =>
      'Salvataggio dettagli PayPal fallito. Riprova più tardi.';

  @override
  String get paypalEmailHint => 'nik@example.com';

  @override
  String get paypalMeLinkHint => 'paypal.me/nik';

  @override
  String get paymentMethodStripe => 'Stripe';

  @override
  String get paymentMethodPayPal => 'PayPal';

  @override
  String get paymentStatusActive => 'Attivo';

  @override
  String get paymentStatusConnected => 'Connesso';

  @override
  String get paymentStatusNotConnected => 'Non connesso';

  @override
  String get paymentPlan => 'Piano di pagamento';

  @override
  String get xHandleTitle => 'Qual è il tuo handle X?';

  @override
  String get xHandleDescription =>
      'Pre-addestreremo il tuo clone Toki\nbasandoci sull\'attività del tuo account';

  @override
  String get xHandleHint => '@nikshevchenko';

  @override
  String get xHandlePleaseEnter => 'Inserisci il tuo handle X';

  @override
  String get xHandlePleaseEnterValid => 'Inserisci un handle X valido';

  @override
  String get nextButton => 'Avanti';

  @override
  String get connectOmiDevice => 'Collega dispositivo Toki';

  @override
  String get transcriptionJsonPlaceholder =>
      'Incolla la tua configurazione JSON qui...';

  @override
  String get transcriptionSourceOmi => 'Toki';

  @override
  String importErrorOpeningFilePicker(String message) {
    return 'Errore nell\'apertura del selettore file: $message';
  }

  @override
  String importErrorGeneric(String error) {
    return 'Errore: $error';
  }

  @override
  String get mergeConversationsSuccessTitle =>
      'Conversazioni unite con successo';

  @override
  String mergeConversationsSuccessBody(int count) {
    return '$count conversazioni sono state unite con successo';
  }

  @override
  String get dailyReflectionNotificationTitle =>
      'È ora della riflessione quotidiana';

  @override
  String get dailyReflectionNotificationBody => 'Raccontami della tua giornata';

  @override
  String get actionItemReminderTitle => 'Promemoria Toki';

  @override
  String deviceDisconnectedTitle(String deviceName) {
    return '$deviceName disconnesso';
  }

  @override
  String deviceDisconnectedBody(String deviceName) {
    return 'Per favore riconnettiti per continuare a usare il tuo $deviceName.';
  }

  @override
  String get onboardingComplete => 'Completato';

  @override
  String get searchTranscriptOrSummary =>
      'Cerca nella trascrizione o nel riepilogo...';

  @override
  String get myGoal => 'Il mio obiettivo';

  @override
  String get appNotAvailable =>
      'Ops! Sembra che l\'app che stai cercando non sia disponibile.';

  @override
  String get failedToConnectTodoist => 'Connessione a Todoist non riuscita';

  @override
  String get failedToConnectAsana => 'Connessione ad Asana non riuscita';

  @override
  String get failedToConnectGoogleTasks =>
      'Connessione a Google Tasks non riuscita';

  @override
  String get failedToConnectClickUp => 'Connessione a ClickUp non riuscita';

  @override
  String failedToConnectServiceWithError(String serviceName, String error) {
    return 'Connessione a $serviceName non riuscita: $error';
  }

  @override
  String get successfullyConnectedTodoist => 'Connesso con successo a Todoist!';

  @override
  String get failedToConnectTodoistRetry =>
      'Connessione a Todoist non riuscita. Riprova.';

  @override
  String get successfullyConnectedAsana => 'Connesso con successo ad Asana!';

  @override
  String get failedToConnectAsanaRetry =>
      'Connessione ad Asana non riuscita. Riprova.';

  @override
  String get successfullyConnectedGoogleTasks =>
      'Connesso con successo a Google Tasks!';

  @override
  String get failedToConnectGoogleTasksRetry =>
      'Connessione a Google Tasks non riuscita. Riprova.';

  @override
  String get successfullyConnectedClickUp => 'Connesso con successo a ClickUp!';

  @override
  String get failedToConnectClickUpRetry =>
      'Connessione a ClickUp non riuscita. Riprova.';

  @override
  String get successfullyConnectedGoogle => 'Connesso con successo a Google!';

  @override
  String get failedToRefreshGoogleStatus =>
      'Impossibile aggiornare lo stato della connessione Google.';

  @override
  String get authFailedToSignInWithGoogle =>
      'Accesso con Google non riuscito, riprova.';

  @override
  String get authenticationFailed => 'Autenticazione fallita. Riprova.';

  @override
  String get authFailedToSignInWithApple =>
      'Accesso con Apple non riuscito, riprova.';

  @override
  String get authFailedToRetrieveToken =>
      'Impossibile recuperare il token Firebase, riprova.';

  @override
  String get authUnexpectedErrorFirebase =>
      'Errore imprevisto durante l\'accesso, errore Firebase, riprova.';

  @override
  String get authUnexpectedError =>
      'Errore imprevisto durante l\'accesso, riprova';

  @override
  String get authFailedToLinkGoogle =>
      'Collegamento con Google non riuscito, riprova.';

  @override
  String get authFailedToLinkApple =>
      'Collegamento con Apple non riuscito, riprova.';

  @override
  String get onboardingBluetoothRequired =>
      'È necessaria l\'autorizzazione Bluetooth per connettersi al dispositivo.';

  @override
  String get onboardingBluetoothDeniedSystemPrefs =>
      'Autorizzazione Bluetooth negata. Concedi l\'autorizzazione in Preferenze di Sistema.';

  @override
  String onboardingBluetoothStatusCheckPrefs(String status) {
    return 'Stato autorizzazione Bluetooth: $status. Controlla Preferenze di Sistema.';
  }

  @override
  String onboardingFailedCheckBluetooth(String error) {
    return 'Impossibile verificare l\'autorizzazione Bluetooth: $error';
  }

  @override
  String get onboardingNotificationDeniedSystemPrefs =>
      'Autorizzazione notifiche negata. Concedi l\'autorizzazione in Preferenze di Sistema.';

  @override
  String get onboardingNotificationDeniedNotifications =>
      'Autorizzazione notifiche negata. Concedi l\'autorizzazione in Preferenze di Sistema > Notifiche.';

  @override
  String onboardingNotificationStatusCheckPrefs(String status) {
    return 'Stato autorizzazione notifiche: $status. Controlla Preferenze di Sistema.';
  }

  @override
  String onboardingFailedCheckNotification(String error) {
    return 'Impossibile verificare l\'autorizzazione notifiche: $error';
  }

  @override
  String get onboardingLocationGrantInSettings =>
      'Concedi l\'autorizzazione alla posizione in Impostazioni > Privacy e sicurezza > Servizi di localizzazione';

  @override
  String get onboardingMicrophoneRequired =>
      'È necessaria l\'autorizzazione microfono per registrare.';

  @override
  String get onboardingMicrophoneDenied =>
      'Autorizzazione microfono negata. Concedi l\'autorizzazione in Preferenze di Sistema > Privacy e sicurezza > Microfono.';

  @override
  String onboardingMicrophoneStatusCheckPrefs(String status) {
    return 'Stato autorizzazione microfono: $status. Controlla Preferenze di Sistema.';
  }

  @override
  String onboardingFailedCheckMicrophone(String error) {
    return 'Impossibile verificare l\'autorizzazione microfono: $error';
  }

  @override
  String get onboardingScreenCaptureRequired =>
      'È necessaria l\'autorizzazione di cattura schermo per la registrazione audio di sistema.';

  @override
  String get onboardingScreenCaptureDenied =>
      'Autorizzazione cattura schermo negata. Concedi l\'autorizzazione in Preferenze di Sistema > Privacy e sicurezza > Registrazione schermo.';

  @override
  String onboardingScreenCaptureStatusCheckPrefs(String status) {
    return 'Stato autorizzazione cattura schermo: $status. Controlla Preferenze di Sistema.';
  }

  @override
  String onboardingFailedCheckScreenCapture(String error) {
    return 'Impossibile verificare l\'autorizzazione cattura schermo: $error';
  }

  @override
  String get onboardingAccessibilityRequired =>
      'È necessaria l\'autorizzazione accessibilità per rilevare riunioni del browser.';

  @override
  String onboardingAccessibilityStatusCheckPrefs(String status) {
    return 'Stato autorizzazione accessibilità: $status. Controlla Preferenze di Sistema.';
  }

  @override
  String onboardingFailedCheckAccessibility(String error) {
    return 'Impossibile verificare l\'autorizzazione accessibilità: $error';
  }

  @override
  String get msgCameraNotAvailable =>
      'La cattura della fotocamera non è disponibile su questa piattaforma';

  @override
  String get msgCameraPermissionDenied =>
      'Permesso fotocamera negato. Si prega di consentire l\'accesso alla fotocamera';

  @override
  String msgCameraAccessError(String error) {
    return 'Errore nell\'accesso alla fotocamera: $error';
  }

  @override
  String get msgPhotoError =>
      'Errore nello scattare la foto. Si prega di riprovare.';

  @override
  String get msgMaxImagesLimit => 'Puoi selezionare solo fino a 4 immagini';

  @override
  String msgFilePickerError(String error) {
    return 'Errore nell\'apertura del selettore file: $error';
  }

  @override
  String msgSelectImagesError(String error) {
    return 'Errore nella selezione delle immagini: $error';
  }

  @override
  String get msgPhotosPermissionDenied =>
      'Permesso foto negato. Si prega di consentire l\'accesso alle foto per selezionare le immagini';

  @override
  String get msgSelectImagesGenericError =>
      'Errore nella selezione delle immagini. Si prega di riprovare.';

  @override
  String get msgMaxFilesLimit => 'Puoi selezionare solo fino a 4 file';

  @override
  String msgSelectFilesError(String error) {
    return 'Errore nella selezione dei file: $error';
  }

  @override
  String get msgSelectFilesGenericError =>
      'Errore nella selezione dei file. Si prega di riprovare.';

  @override
  String get msgUploadFileFailed =>
      'Caricamento file fallito, si prega di riprovare più tardi';

  @override
  String get msgReadingMemories => 'Leggendo i tuoi ricordi...';

  @override
  String get msgLearningMemories => 'Imparando dai tuoi ricordi...';

  @override
  String get msgUploadAttachedFileFailed =>
      'Caricamento del file allegato fallito.';

  @override
  String captureRecordingError(String error) {
    return 'Si è verificato un errore durante la registrazione: $error';
  }

  @override
  String captureRecordingStoppedDisplayIssue(String reason) {
    return 'Registrazione interrotta: $reason. Potrebbe essere necessario ricollegare i display esterni o riavviare la registrazione.';
  }

  @override
  String get captureMicrophonePermissionRequired =>
      'Autorizzazione microfono richiesta';

  @override
  String get captureMicrophonePermissionInSystemPreferences =>
      'Concedi l\'autorizzazione al microfono nelle Preferenze di Sistema';

  @override
  String get captureScreenRecordingPermissionRequired =>
      'Autorizzazione registrazione schermo richiesta';

  @override
  String get captureDisplayDetectionFailed =>
      'Rilevamento schermo non riuscito. Registrazione interrotta.';

  @override
  String get devModeInvalidAudioBytesWebhookUrl =>
      'URL webhook byte audio non valido';

  @override
  String get devModeInvalidRealtimeTranscriptWebhookUrl =>
      'URL webhook trascrizione in tempo reale non valido';

  @override
  String get devModeInvalidConversationCreatedWebhookUrl =>
      'URL webhook conversazione creata non valido';

  @override
  String get devModeInvalidDaySummaryWebhookUrl =>
      'URL webhook riepilogo giornaliero non valido';

  @override
  String get devModeSettingsSaved => 'Impostazioni salvate!';

  @override
  String get voiceFailedToTranscribe => 'Trascrizione audio non riuscita';

  @override
  String get locationPermissionRequired => 'Autorizzazione posizione richiesta';

  @override
  String get locationPermissionContent =>
      'Il trasferimento rapido richiede l\'autorizzazione alla posizione per verificare la connessione WiFi. Concedi l\'autorizzazione alla posizione per continuare.';

  @override
  String get conversationNewIndicator => 'Nuovo 🚀';

  @override
  String conversationPhotosCount(int count) {
    return '$count foto';
  }

  @override
  String get mergingStatus => 'Unione in corso...';

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
    return '$count ora';
  }

  @override
  String timeHoursPlural(int count) {
    return '$count ore';
  }

  @override
  String timeHoursAndMins(int hours, int mins) {
    return '$hours ore $mins min';
  }

  @override
  String timeDaySingular(int count) {
    return '$count giorno';
  }

  @override
  String timeDaysPlural(int count) {
    return '$count giorni';
  }

  @override
  String timeDaysAndHours(int days, int hours) {
    return '$days giorni $hours ore';
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
  String get moveToFolder => 'Sposta nella cartella';

  @override
  String get noFoldersAvailable => 'Nessuna cartella disponibile';

  @override
  String get newFolder => 'Nuova cartella';

  @override
  String get color => 'Colore';

  @override
  String get waitingForDevice => 'In attesa del dispositivo...';

  @override
  String get saySomething => 'Di\' qualcosa...';

  @override
  String get initialisingSystemAudio => 'Inizializzazione audio di sistema';

  @override
  String get stopRecording => 'Interrompi registrazione';

  @override
  String get continueRecording => 'Continua registrazione';

  @override
  String get initialisingRecorder => 'Inizializzazione registratore';

  @override
  String get pauseRecording => 'Metti in pausa registrazione';

  @override
  String get resumeRecording => 'Riprendi registrazione';

  @override
  String get noDailyRecapsYet => 'Nessun riepilogo giornaliero ancora';

  @override
  String get dailyRecapsDescription =>
      'I tuoi riepiloghi giornalieri appariranno qui una volta generati';

  @override
  String get chooseTransferMethod => 'Scegli metodo di trasferimento';

  @override
  String get fastTransferSpeed => '~150 KB/s tramite WiFi';

  @override
  String largeTimeGapDetected(String gap) {
    return 'Rilevato un grande divario temporale ($gap)';
  }

  @override
  String largeTimeGapsDetected(String gaps) {
    return 'Rilevati grandi divari temporali ($gaps)';
  }

  @override
  String get deviceDoesNotSupportWifiSwitchingToBle =>
      'Il dispositivo non supporta la sincronizzazione WiFi, passaggio al Bluetooth';

  @override
  String get appleHealthNotAvailable =>
      'Apple Health non è disponibile su questo dispositivo';

  @override
  String get audioDownloadFailed => 'Download audio fallito';

  @override
  String get downloadingAudio => 'Download audio in corso...';

  @override
  String get shareAudio => 'Condividi audio';

  @override
  String get preparingAudio => 'Preparazione audio';

  @override
  String get downloadingAudioProgress => 'Download audio';

  @override
  String get processingAudio => 'Elaborazione audio';

  @override
  String get audioReady => 'Audio pronto';

  @override
  String get audioShareFailed => 'Condivisione fallita';

  @override
  String get dailyRecaps => 'Riepiloghi Giornalieri';

  @override
  String get removeFilter => 'Rimuovi Filtro';

  @override
  String get categoryConversationAnalysis => 'Analisi delle conversazioni';

  @override
  String get categoryPersonalityClone => 'Clone di personalità';

  @override
  String get categoryHealth => 'Salute';

  @override
  String get categoryEducation => 'Istruzione';

  @override
  String get categoryCommunication => 'Comunicazione';

  @override
  String get categoryEmotionalSupport => 'Supporto emotivo';

  @override
  String get categoryProductivity => 'Produttività';

  @override
  String get categoryEntertainment => 'Intrattenimento';

  @override
  String get categoryFinancial => 'Finanza';

  @override
  String get categoryTravel => 'Viaggi';

  @override
  String get categorySafety => 'Sicurezza';

  @override
  String get categoryShopping => 'Shopping';

  @override
  String get categorySocial => 'Sociale';

  @override
  String get categoryNews => 'Notizie';

  @override
  String get categoryUtilities => 'Utilità';

  @override
  String get categoryOther => 'Altro';

  @override
  String get capabilityChat => 'Chat';

  @override
  String get capabilityConversations => 'Conversazioni';

  @override
  String get capabilityExternalIntegration => 'Integrazione esterna';

  @override
  String get capabilityNotification => 'Notifica';

  @override
  String get triggerAudioBytes => 'Byte audio';

  @override
  String get triggerConversationCreation => 'Creazione conversazione';

  @override
  String get triggerTranscriptProcessed => 'Trascrizione elaborata';

  @override
  String get actionCreateConversations => 'Crea conversazioni';

  @override
  String get actionCreateMemories => 'Crea ricordi';

  @override
  String get actionReadConversations => 'Leggi conversazioni';

  @override
  String get actionReadMemories => 'Leggi ricordi';

  @override
  String get actionReadTasks => 'Leggi attività';

  @override
  String get scopeUserName => 'Nome utente';

  @override
  String get scopeUserFacts => 'Informazioni utente';

  @override
  String get scopeUserConversations => 'Conversazioni utente';

  @override
  String get scopeUserChat => 'Chat utente';

  @override
  String get capabilityFeatured => 'In evidenza';

  @override
  String get capabilityTasks => 'Attività';

  @override
  String get capabilityIntegrations => 'Integrazioni';

  @override
  String get categoryPersonalityClones => 'Cloni di personalità';

  @override
  String get categoryProductivityLifestyle => 'Produttività e stile di vita';

  @override
  String get categorySocialEntertainment => 'Sociale e intrattenimento';

  @override
  String get categoryProductivityTools => 'Strumenti di produttività';

  @override
  String get categoryPersonalWellness => 'Benessere personale';

  @override
  String get rating => 'Valutazione';

  @override
  String get categories => 'Categorie';

  @override
  String get newTask => 'Nuova attività';

  @override
  String get viewAll => 'Vedi tutto';

  @override
  String get addTask => 'Aggiungi attività';

  @override
  String get mcpServerUrl => 'MCP Server URL';

  @override
  String get whereDidYouHearAboutOmi => 'Come ci hai trovato?';

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
  String get friendWordOfMouth => 'Amico';

  @override
  String get otherSource => 'Altro';

  @override
  String get pleaseSpecify => 'Specifica';

  @override
  String get event => 'Evento';

  @override
  String get coworker => 'Collega';

  @override
  String get linkedIn => 'LinkedIn';

  @override
  String get googleSearch => 'Google Search';

  @override
  String get audioPlaybackUnavailable =>
      'Il file audio non è disponibile per la riproduzione';

  @override
  String get audioPlaybackFailed =>
      'Impossibile riprodurre l\'audio. Il file potrebbe essere danneggiato o mancante.';

  @override
  String get connectionGuide => 'Guida alla connessione';

  @override
  String get iveDoneThis => 'L\'ho fatto';

  @override
  String get reportAnIssue => 'Segnala un problema';

  @override
  String get pairingTitleOmi => 'Accendi Toki';

  @override
  String get pairingDescOmi =>
      'Tieni premuto il dispositivo finché non vibra per accenderlo.';

  @override
  String get pairingTitleOmiDevkit =>
      'Metti Toki DevKit in modalità di accoppiamento';

  @override
  String get pairingDescOmiDevkit =>
      'Premi il pulsante una volta per accendere. Il LED lampeggerà in viola in modalità di accoppiamento.';

  @override
  String get pairingTitleOmiGlass => 'Accendi Toki Glass';

  @override
  String get pairingDescOmiGlass =>
      'Tieni premuto il pulsante laterale per 3 secondi per accendere.';

  @override
  String get pairingTitlePlaudNote =>
      'Metti Plaud Note in modalità di accoppiamento';

  @override
  String get pairingDescPlaudNote =>
      'Tieni premuto il pulsante laterale per 2 secondi. Il LED rosso lampeggerà quando è pronto per l\'accoppiamento.';

  @override
  String get pairingTitleBee => 'Metti Bee in modalità di accoppiamento';

  @override
  String get pairingDescBee =>
      'Premi il pulsante 5 volte di seguito. La luce inizierà a lampeggiare in blu e verde.';

  @override
  String get pairingTitleLimitless =>
      'Metti Limitless in modalità di accoppiamento';

  @override
  String get pairingDescLimitless =>
      'Quando una luce è visibile, premi una volta poi tieni premuto finché il dispositivo non mostra una luce rosa, quindi rilascia.';

  @override
  String get pairingTitleFriendPendant =>
      'Metti Friend Pendant in modalità di accoppiamento';

  @override
  String get pairingDescFriendPendant =>
      'Premi il pulsante sul ciondolo per accenderlo. Entrerà automaticamente in modalità di accoppiamento.';

  @override
  String get pairingTitleFieldy => 'Metti Fieldy in modalità di accoppiamento';

  @override
  String get pairingDescFieldy =>
      'Tieni premuto il dispositivo finché non appare la luce per accenderlo.';

  @override
  String get pairingTitleAppleWatch => 'Collega Apple Watch';

  @override
  String get pairingDescAppleWatch =>
      'Installa e apri l\'app Toki sul tuo Apple Watch, poi tocca Connetti nell\'app.';

  @override
  String get pairingTitleNeoOne => 'Metti Neo One in modalità di accoppiamento';

  @override
  String get pairingDescNeoOne =>
      'Tieni premuto il pulsante di accensione finché il LED non lampeggia. Il dispositivo sarà rilevabile.';

  @override
  String get downloadingFromDevice => 'Download dal dispositivo';

  @override
  String get reconnectingToInternet => 'Riconnessione a internet...';

  @override
  String uploadingToCloud(int current, int total) {
    return 'Caricamento di $current di $total';
  }

  @override
  String get corruptedStatus => 'Corrotto';

  @override
  String get synced => 'Sincronizzato';

  @override
  String get noPendingRecordings => 'Nessuna registrazione in attesa';

  @override
  String get noProcessedRecordings => 'Nessuna registrazione elaborata ancora';

  @override
  String get pending => 'In attesa';

  @override
  String get addToYourTaskList => 'Aggiungere alla lista delle attività?';

  @override
  String get failedToCreateShareLink =>
      'Impossibile creare il link di condivisione';

  @override
  String get deleteGoal => 'Elimina obiettivo';

  @override
  String get deviceUpToDate => 'Il dispositivo è aggiornato';

  @override
  String get wifiConfiguration => 'Configurazione WiFi';

  @override
  String get wifiConfigurationSubtitle =>
      'Inserisci le credenziali WiFi per consentire al dispositivo di scaricare il firmware.';

  @override
  String get networkNameSsid => 'Nome rete (SSID)';

  @override
  String get enterWifiNetworkName => 'Inserisci il nome della rete WiFi';

  @override
  String get enterWifiPassword => 'Inserisci la password WiFi';

  @override
  String get onboardingWhatIKnowAboutYouTitle => 'Quello che so di te';

  @override
  String get onboardingWhatIKnowAboutYouDescription =>
      'Ecco un riepilogo di ciò che so di te dalle nostre conversazioni. Puoi modificare tutto ciò che non è corretto.';

  @override
  String get apiEnvironment => 'Ambiente API';

  @override
  String get apiEnvironmentDescription =>
      'Passa tra gli ambienti di produzione e staging dell\'API';

  @override
  String get production => 'Produzione';

  @override
  String get staging => 'Staging';

  @override
  String get switchRequiresRestart =>
      'Il cambio di ambiente richiede il riavvio dell\'app';

  @override
  String get switchApiConfirmTitle => 'Cambiare ambiente API?';

  @override
  String switchApiConfirmBody(String environment) {
    return 'Passare a $environment? Dovrai chiudere e riaprire l\'app perché le modifiche abbiano effetto.';
  }

  @override
  String get switchAndRestart => 'Cambia';

  @override
  String get stagingDisclaimer =>
      'L\'ambiente di staging potrebbe essere instabile, avere prestazioni inconsistenti e i dati potrebbero andare persi. Usalo solo per i test.';

  @override
  String get apiEnvSavedRestartRequired =>
      'Salvato. Chiudi e riapri l\'app per applicare.';

  @override
  String get shared => 'Condiviso';

  @override
  String get onlyYouCanSeeConversation =>
      'Solo tu puoi vedere questa conversazione';

  @override
  String get anyoneWithLinkCanView => 'Chiunque abbia il link può visualizzare';

  @override
  String get tasksCleanTodayTitle => 'Pulire le attività di oggi?';

  @override
  String get tasksCleanTodayMessage => 'Questo rimuoverà solo le scadenze';

  @override
  String get tasksOverdue => 'Scadute';

  @override
  String get showDailyScoreOnHomepage =>
      'Mostra punteggio giornaliero nella homepage';

  @override
  String get showTasksOnHomepage => 'Mostra attività nella homepage';

  @override
  String get deleteSynced => 'Elimina sincronizzati';

  @override
  String get deleteSyncedFiles => 'Elimina registrazioni sincronizzate';

  @override
  String get deleteSyncedFilesMessage =>
      'Queste registrazioni sono già state sincronizzate con il tuo telefono. Questa azione non può essere annullata.';

  @override
  String get syncedFilesDeleted => 'Registrazioni sincronizzate eliminate';

  @override
  String get deletePending => 'Elimina in sospeso';

  @override
  String get deletePendingFiles => 'Elimina registrazioni in sospeso';

  @override
  String get deletePendingFilesWarning =>
      'Queste registrazioni NON sono state sincronizzate con il tuo telefono e andranno perse permanentemente. Questa azione non può essere annullata.';

  @override
  String get pendingFilesDeleted => 'Registrazioni in sospeso eliminate';

  @override
  String get deleteAllFiles => 'Elimina tutte le registrazioni';

  @override
  String get deleteAll => 'Elimina tutto';

  @override
  String get deleteAllFilesWarning =>
      'Questo eliminerà le registrazioni sincronizzate e in sospeso. Le registrazioni in sospeso NON sono state sincronizzate e andranno perse permanentemente.';

  @override
  String get allFilesDeleted => 'Tutte le registrazioni eliminate';

  @override
  String get manageStorage => 'Gestisci archivio';

  @override
  String get safelyBackedUp => 'Salvato sul tuo telefono';

  @override
  String get notYetSynced => 'Non ancora sincronizzato con il tuo telefono';

  @override
  String get clearAll => 'Cancella tutto';

  @override
  String get fairUsePolicy => 'Uso corretto';

  @override
  String get fairUseLoadError =>
      'Impossibile caricare lo stato di uso corretto. Riprova.';

  @override
  String get fairUseStageWarning => 'Avviso';

  @override
  String get fairUseStageThrottle => 'Limitato';

  @override
  String get fairUseStageRestrict => 'Bloccato';

  @override
  String get fairUseSpeechUsage => 'Utilizzo vocale';

  @override
  String get fairUseToday => 'Oggi';

  @override
  String get fairUse3Day => '3 giorni consecutivi';

  @override
  String get fairUseWeekly => 'Settimanale';

  @override
  String get fairUseAboutTitle => 'Informazioni sull\'uso corretto';

  @override
  String get fairUseAboutBody =>
      'Toki è progettato per conversazioni personali, riunioni e interazioni dal vivo. L\'utilizzo è misurato dal tempo reale di parlato rilevato, non dal tempo di connessione. Se l\'utilizzo supera significativamente i modelli normali per contenuti non personali, potrebbero essere applicate modifiche.';

  @override
  String fairUseCaseRefCopied(String caseRef) {
    return '$caseRef copiato';
  }

  @override
  String get fairUseDailyTranscription => 'Trascrizione giornaliera';

  @override
  String fairUseBudgetUsed(String used, String limit) {
    return '${used}m / ${limit}m';
  }

  @override
  String get fairUseBudgetExhausted =>
      'Limite di trascrizione giornaliero raggiunto';

  @override
  String fairUseBudgetResetsAt(String time) {
    return 'Si reimposta $time';
  }

  @override
  String get transcriptionPaused => 'Registrazione, riconnessione';

  @override
  String get transcriptionPausedReconnecting =>
      'Registrazione in corso — riconnessione alla trascrizione...';

  @override
  String get improveConnectionTitle => 'Migliora connessione';

  @override
  String get improveConnectionContent =>
      'Abbiamo migliorato il modo in cui Toki rimane connesso al tuo dispositivo. Per attivarlo, vai alla pagina Info dispositivo, tocca \"Disconnetti dispositivo\" e associa nuovamente il tuo dispositivo.';

  @override
  String get improveConnectionAction => 'Capito';

  @override
  String clockSkewWarning(int minutes) {
    return 'L\'orologio del dispositivo è sfasato di ~$minutes min. Controlla le impostazioni di data e ora.';
  }

  @override
  String get cloudTranscriptionPoweredByDeepgram =>
      'Trascrizione cloud con Deepgram.';

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
  String get usageStatistics => 'Statistiche di utilizzo';

  @override
  String get transcriptionTime => 'Tempo di trascrizione';

  @override
  String get wordsTranscribed => 'Parole trascritte';

  @override
  String get insightsGained => 'Intuizioni generate';

  @override
  String get memoriesCreated => 'Ricordi creati';

  @override
  String get noDataYet => 'Nessun dato ancora';

  @override
  String get deleteNodeConfirmation =>
      'Eliminare questo nodo e tutte le sue connessioni? I nodi orfani verranno eliminati.';
}
