// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get conversationTab => 'Conversation';

  @override
  String get transcriptTab => 'Transcript';

  @override
  String get actionItemsTab => 'Action Items';

  @override
  String get deleteConversationTitle => 'Delete Conversation?';

  @override
  String get deleteConversationMessage =>
      'This will also delete associated memories, tasks, and audio files. This action cannot be undone.';

  @override
  String get confirm => 'Confirm';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'Ok';

  @override
  String get delete => 'Delete';

  @override
  String get add => 'Add';

  @override
  String get update => 'Update';

  @override
  String get save => 'Save';

  @override
  String get edit => 'Edit';

  @override
  String get close => 'Close';

  @override
  String get clear => 'Clear';

  @override
  String get copyTranscript => 'Copy Transcript';

  @override
  String get copySummary => 'Copy Summary';

  @override
  String get testPrompt => 'Test Prompt';

  @override
  String get reprocessConversation => 'Reprocess Conversation';

  @override
  String get deleteConversation => 'Delete Conversation';

  @override
  String get contentCopied => 'Content copied to clipboard';

  @override
  String get failedToUpdateStarred => 'Failed to update starred status.';

  @override
  String get conversationUrlNotShared => 'Conversation URL could not be shared.';

  @override
  String get errorProcessingConversation => 'Error while processing conversation. Please try again later.';

  @override
  String get noInternetConnection => 'No internet connection';

  @override
  String get unableToDeleteConversation => 'Unable to Delete Conversation';

  @override
  String get somethingWentWrong => 'Something went wrong! Please try again later.';

  @override
  String get copyErrorMessage => 'Copy error message';

  @override
  String get errorCopied => 'Error message copied to clipboard';

  @override
  String get remaining => 'Remaining';

  @override
  String get loading => 'Loading...';

  @override
  String get loadingDuration => 'Loading duration...';

  @override
  String get people => 'People';

  @override
  String get addNewPerson => 'Add New Person';

  @override
  String get editPerson => 'Edit Person';

  @override
  String get createPersonHint => 'Create a new person and train Toki to recognize their speech too!';

  @override
  String get speechProfile => 'Speech Profile';

  @override
  String sampleNumber(int number) {
    return 'Sample $number';
  }

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get deleting => 'Deleting...';

  @override
  String get importStarted => 'Import started! You\'ll be notified when it\'s complete.';

  @override
  String get failedToStartImport => 'Failed to start import. Please try again.';

  @override
  String get couldNotAccessFile => 'Could not access the selected file';

  @override
  String get askOmi => 'Ask Toki';

  @override
  String get done => 'Done';

  @override
  String get disconnected => 'Disconnected';

  @override
  String get searching => 'Searching...';

  @override
  String get connectDevice => 'Connect Device';

  @override
  String get allCaughtUp => 'All caught up';

  @override
  String get sync => 'Sync';

  @override
  String get noConversationsYet => 'No conversations yet';

  @override
  String get noStarredConversations => 'No starred conversations';

  @override
  String get starConversationHint => 'To star a conversation, open it and tap the star icon in the header.';

  @override
  String get searchConversations => 'Search conversations...';

  @override
  String selectedCount(int count, Object s) {
    return '$count selected';
  }

  @override
  String get merge => 'Merge';

  @override
  String get mergeConversations => 'Merge Conversations';

  @override
  String mergeConversationsMessage(int count) {
    return 'This will combine $count conversations into one. All content will be merged and regenerated.';
  }

  @override
  String get mergingInBackground => 'Merging in background. This may take a moment.';

  @override
  String get failedToStartMerge => 'Failed to start merge';

  @override
  String get askAnything => 'Ask anything';

  @override
  String get noMessagesYet => 'No messages yet!\nWhy don\'t you start a conversation?';

  @override
  String get deletingMessages => 'Deleting your messages from Toki\'s memory...';

  @override
  String get messageCopied => '✨ Message copied to clipboard';

  @override
  String get clearChat => 'Clear Chat';

  @override
  String get clearChatConfirm => 'Are you sure you want to clear the chat? This action cannot be undone.';

  @override
  String get maxFilesLimit => 'You can only upload 4 files at a time';

  @override
  String get apps => 'Apps';

  @override
  String get aboutOmi => 'About Toki';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get visitWebsite => 'Visit Website';

  @override
  String get helpOrInquiries => 'Help or Inquiries?';

  @override
  String get joinCommunity => 'Join the community!';

  @override
  String get membersAndCounting => '8000+ members and counting.';

  @override
  String get deleteAccountTitle => 'Delete Account';

  @override
  String get deleteAccountConfirm => 'Are you sure you want to delete your account?';

  @override
  String get cannotBeUndone => 'This cannot be undone.';

  @override
  String get allDataErased => 'All of your memories and conversations will be permanently erased.';

  @override
  String get appsDisconnected => 'Your Apps and Integrations will be disconnected effectively immediately.';

  @override
  String get exportBeforeDelete =>
      'You can export your data before deleting your account, but once deleted, it cannot be recovered.';

  @override
  String get deleteAccountCheckbox =>
      'I understand that deleting my account is permanent and all data, including memories and conversations, will be lost and cannot be recovered.';

  @override
  String get areYouSure => 'Are you sure?';

  @override
  String get deleteAccountFinal =>
      'This action is irreversible and will permanently delete your account and all associated data. Are you sure you want to proceed?';

  @override
  String get deleteNow => 'Delete Now';

  @override
  String get goBack => 'Go Back';

  @override
  String get checkBoxToConfirm =>
      'Check the box to confirm you understand that deleting your account is permanent and irreversible.';

  @override
  String get profile => 'Profile';

  @override
  String get name => 'Name';

  @override
  String get email => 'Email';

  @override
  String get customVocabulary => 'Custom Vocabulary';

  @override
  String get identifyingOthers => 'Identifying Others';

  @override
  String get conversationDisplay => 'Conversation Display';

  @override
  String get dataPrivacy => 'Data Privacy';

  @override
  String get userId => 'User ID';

  @override
  String get notSet => 'Not set';

  @override
  String get userIdCopied => 'User ID copied to clipboard';

  @override
  String get systemDefault => 'System Default';

  @override
  String get offlineSync => 'Offline Sync';

  @override
  String get deviceSettings => 'Device Settings';

  @override
  String get integrations => 'Integrations';

  @override
  String get developerSettings => 'Developer Settings';

  @override
  String get signOut => 'Sign Out';

  @override
  String get appAndDeviceCopied => 'App and device details copied';

  @override
  String get wrapped2025 => 'Wrapped 2025';

  @override
  String get yourPrivacyYourControl => 'Your Privacy, Your Control';

  @override
  String get privacyIntro =>
      'At Toki, we are committed to protecting your privacy. This page allows you to control how your data is stored and used.';

  @override
  String get dataProtectionLevel => 'Data Protection Level';

  @override
  String get dataProtectionDesc =>
      'Your data is secured by default with strong encryption. Review your settings and future privacy options below.';

  @override
  String get deviceName => 'Device Name';

  @override
  String get deviceId => 'Device ID';

  @override
  String get firmware => 'Firmware';

  @override
  String get sdCardSync => 'SD Card Sync';

  @override
  String get hardwareRevision => 'Hardware Revision';

  @override
  String get modelNumber => 'Model Number';

  @override
  String get manufacturer => 'Manufacturer';

  @override
  String get doubleTap => 'Double Tap';

  @override
  String get ledBrightness => 'LED Brightness';

  @override
  String get micGain => 'Mic Gain';

  @override
  String get disconnect => 'Disconnect';

  @override
  String get chargingIssues => 'Charging Issues';

  @override
  String get disconnectDevice => 'Disconnect Device';

  @override
  String get unpairDevice => 'Unpair Device';

  @override
  String get unpairAndForget => 'Unpair and Forget Device';

  @override
  String get deviceDisconnectedMessage => 'Your Toki has been disconnected 😔';

  @override
  String get deviceUnpairedMessage =>
      'Device unpaired. Go to Settings > Bluetooth and forget the device to complete unpairing.';

  @override
  String get unpairDialogTitle => 'Unpair Device';

  @override
  String get unpairDialogMessage =>
      'This will unpair the device so it can be connected to another phone. You will need to go to Settings > Bluetooth and forget the device to complete the process.';

  @override
  String get deviceNotConnected => 'Device Not Connected';

  @override
  String get connectDeviceMessage => 'Connect your Toki device to access\ndevice settings and customization';

  @override
  String get deviceInfoSection => 'Device Information';

  @override
  String get customizationSection => 'Customization';

  @override
  String get hardwareSection => 'Hardware';

  @override
  String get v2Undetected => 'V2 undetected';

  @override
  String get v2UndetectedMessage =>
      'We see that you either have a V1 device or your device is not connected. SD Card functionality is available only for V2 devices.';

  @override
  String get endConversation => 'End Conversation';

  @override
  String get pauseResume => 'Pause/Resume';

  @override
  String get starConversation => 'Star Conversation';

  @override
  String get doubleTapAction => 'Double Tap Action';

  @override
  String get endAndProcess => 'End & Process Conversation';

  @override
  String get pauseResumeRecording => 'Pause/Resume Recording';

  @override
  String get starOngoing => 'Star Ongoing Conversation';

  @override
  String get off => 'Off';

  @override
  String get max => 'Max';

  @override
  String get mute => 'Mute';

  @override
  String get quiet => 'Quiet';

  @override
  String get normal => 'Normal';

  @override
  String get high => 'High';

  @override
  String get micGainDescMuted => 'Microphone is muted';

  @override
  String get micGainDescLow => 'Very quiet - for loud environments';

  @override
  String get micGainDescModerate => 'Quiet - for moderate noise';

  @override
  String get micGainDescNeutral => 'Neutral - balanced recording';

  @override
  String get micGainDescSlightlyBoosted => 'Slightly boosted - normal use';

  @override
  String get micGainDescBoosted => 'Boosted - for quiet environments';

  @override
  String get micGainDescHigh => 'High - for distant or soft voices';

  @override
  String get micGainDescVeryHigh => 'Very high - for very quiet sources';

  @override
  String get micGainDescMax => 'Maximum - use with caution';

  @override
  String get saving => 'Saving...';

  @override
  String get beta => 'BETA';

  @override
  String get transcription => 'Transcription';

  @override
  String get conversationTimeout => 'Conversation Timeout';

  @override
  String get importData => 'Import Data';

  @override
  String get endpointUrl => 'Endpoint URL';

  @override
  String get noApiKeys => 'No API keys yet';

  @override
  String get createKey => 'Create Key';

  @override
  String get docs => 'Docs';

  @override
  String get today => 'Today';

  @override
  String get thisMonth => 'This Month';

  @override
  String get thisYear => 'This Year';

  @override
  String get allTime => 'All Time';

  @override
  String get startConversationToSeeInsights => 'Start a conversation with Toki\nto see your usage insights here.';

  @override
  String get listening => 'Listening';

  @override
  String get listeningSubtitle => 'Total time Toki has actively listened.';

  @override
  String get understanding => 'Understanding';

  @override
  String get understandingSubtitle => 'Words understood from your conversations.';

  @override
  String get providing => 'Providing';

  @override
  String get providingSubtitle => 'Action items, and notes automatically captured.';

  @override
  String get remembering => 'Remembering';

  @override
  String get rememberingSubtitle => 'Facts and details remembered for you.';

  @override
  String get debugLogs => 'Debug Logs';

  @override
  String get noLogFilesFound => 'No log files found.';

  @override
  String get selectLogFile => 'Select Log File';

  @override
  String get shareLogs => 'Share Logs';

  @override
  String get debugLogCleared => 'Debug log cleared';

  @override
  String get exportStarted => 'Export started. This may take a few seconds...';

  @override
  String get exportAllData => 'Export All Data';

  @override
  String get knowledgeGraphDeleted => 'Knowledge Graph deleted';

  @override
  String get deleteKnowledgeGraph => 'Delete Knowledge Graph';

  @override
  String get mcp => 'MCP';

  @override
  String get mcpServer => 'MCP Server';

  @override
  String get serverUrl => 'Server URL';

  @override
  String get urlCopied => 'URL copied';

  @override
  String get apiKeyAuth => 'API Key Auth';

  @override
  String get header => 'Header';

  @override
  String get clientId => 'Client ID';

  @override
  String get clientSecret => 'Client Secret';

  @override
  String get webhooks => 'Webhooks';

  @override
  String get conversationEvents => 'Conversation Events';

  @override
  String get newConversationCreated => 'New conversation created';

  @override
  String get transcriptReceived => 'Transcript received';

  @override
  String get audioBytes => 'Audio Bytes';

  @override
  String get audioDataReceived => 'Audio data received';

  @override
  String get intervalSeconds => 'Interval (seconds)';

  @override
  String get daySummary => 'Day Summary';

  @override
  String get summaryGenerated => 'Summary generated';

  @override
  String get claudeDesktop => 'Claude Desktop';

  @override
  String get copyConfig => 'Copy Config';

  @override
  String get configCopied => 'Config copied to clipboard';

  @override
  String get listeningMins => 'Listening (mins)';

  @override
  String get understandingWords => 'Understanding (words)';

  @override
  String get insights => 'Insights';

  @override
  String get memories => 'Memories';

  @override
  String get visibility => 'Visibility';

  @override
  String get visibilitySubtitle => 'Control which conversations appear in your list';

  @override
  String get showShortConversations => 'Show Short Conversations';

  @override
  String get showShortConversationsDesc => 'Display conversations shorter than the threshold';

  @override
  String get showDiscardedConversations => 'Show Discarded Conversations';

  @override
  String get showDiscardedConversationsDesc => 'Include conversations marked as discarded';

  @override
  String get shortConversationThreshold => 'Short Conversation Threshold';

  @override
  String get shortConversationThresholdSubtitle =>
      'Conversations shorter than this will be hidden unless enabled above';

  @override
  String get durationThreshold => 'Duration Threshold';

  @override
  String get durationThresholdDesc => 'Hide conversations shorter than this';

  @override
  String minLabel(int count) {
    return '$count min';
  }

  @override
  String get customVocabularyTitle => 'Custom Vocabulary';

  @override
  String get addWords => 'Add Words';

  @override
  String get addWordsDesc => 'Names, terms, or uncommon words';

  @override
  String get vocabularyHint => 'Toki, Callie, OpenAI';

  @override
  String get connect => 'Connect';

  @override
  String get comingSoon => 'Coming Soon';

  @override
  String get integrationsFooter => 'Connect your apps to view data and metrics in chat.';

  @override
  String get completeAuthInBrowser => 'Please complete authentication in your browser. Once done, return to the app.';

  @override
  String failedToStartAuth(String appName) {
    return 'Failed to start $appName authentication';
  }

  @override
  String disconnectAppTitle(String appName) {
    return 'Disconnect $appName?';
  }

  @override
  String disconnectAppMessage(String appName) {
    return 'Are you sure you want to disconnect from $appName? You can reconnect anytime.';
  }

  @override
  String disconnectedFrom(String appName) {
    return 'Disconnected from $appName';
  }

  @override
  String get failedToDisconnect => 'Failed to disconnect';

  @override
  String connectTo(String appName) {
    return 'Connect to $appName';
  }

  @override
  String authAccessMessage(String appName) {
    return 'You\'ll need to authorize Toki to access your $appName data. This will open your browser for authentication.';
  }

  @override
  String get continueAction => 'Continue';

  @override
  String get languageTitle => 'Language';

  @override
  String get primaryLanguage => 'Primary Language';

  @override
  String get automaticTranslation => 'Automatic Translation';

  @override
  String get detectLanguages => 'Detect 10+ languages';

  @override
  String get authorizeSavingRecordings => 'Authorize Saving Recordings';

  @override
  String get thanksForAuthorizing => 'Thanks for authorizing!';

  @override
  String get needYourPermission => 'We need your permission';

  @override
  String get alreadyGavePermission =>
      'You\'ve already given us permission to save your recordings. Here\'s a reminder of why we need it:';

  @override
  String get wouldLikePermission => 'We\'d like your permission to save your voice recordings. Here\'s why:';

  @override
  String get improveSpeechProfile => 'Improve Your Speech Profile';

  @override
  String get improveSpeechProfileDesc => 'We use recordings to further train and enhance your personal speech profile.';

  @override
  String get trainFamilyProfiles => 'Train Profiles for Friends and Family';

  @override
  String get trainFamilyProfilesDesc =>
      'Your recordings help us recognize and create profiles for your friends and family.';

  @override
  String get enhanceTranscriptAccuracy => 'Enhance Transcript Accuracy';

  @override
  String get enhanceTranscriptAccuracyDesc =>
      'As our model improves, we can provide better transcription results for your recordings.';

  @override
  String get legalNotice =>
      'Legal Notice: The legality of recording and storing voice data may vary depending on your location and how you use this feature. It\'s your responsibility to ensure compliance with local laws and regulations.';

  @override
  String get alreadyAuthorized => 'Already Authorized';

  @override
  String get authorize => 'Authorize';

  @override
  String get revokeAuthorization => 'Revoke Authorization';

  @override
  String get authorizationSuccessful => 'Authorization successful!';

  @override
  String get failedToAuthorize => 'Failed to authorize. Please try again.';

  @override
  String get authorizationRevoked => 'Authorization revoked.';

  @override
  String get recordingsDeleted => 'Recordings deleted.';

  @override
  String get failedToRevoke => 'Failed to revoke authorization. Please try again.';

  @override
  String get permissionRevokedTitle => 'Permission Revoked';

  @override
  String get permissionRevokedMessage => 'Do you want us to remove all your existing recordings too?';

  @override
  String get yes => 'Yes';

  @override
  String get editName => 'Edit Name';

  @override
  String get howShouldOmiCallYou => 'How should Toki call you?';

  @override
  String get enterYourName => 'Enter your name';

  @override
  String get nameCannotBeEmpty => 'Name cannot be empty';

  @override
  String get nameUpdatedSuccessfully => 'Name updated successfully!';

  @override
  String get calendarSettings => 'Calendar settings';

  @override
  String get calendarProviders => 'Calendar Providers';

  @override
  String get macOsCalendar => 'macOS Calendar';

  @override
  String get connectMacOsCalendar => 'Connect your local macOS calendar';

  @override
  String get googleCalendar => 'Google Calendar';

  @override
  String get syncGoogleAccount => 'Sync with your Google account';

  @override
  String get showMeetingsMenuBar => 'Show upcoming meetings in menu bar';

  @override
  String get showMeetingsMenuBarDesc => 'Display your next meeting and time until it starts in the macOS menu bar';

  @override
  String get showEventsNoParticipants => 'Show events with no participants';

  @override
  String get showEventsNoParticipantsDesc =>
      'When enabled, Coming Up shows events without participants or a video link.';

  @override
  String get yourMeetings => 'Your Meetings';

  @override
  String get refresh => 'Refresh';

  @override
  String get noUpcomingMeetings => 'No upcoming meetings';

  @override
  String get checkingNextDays => 'Checking next 30 days';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String get googleCalendarComingSoon => 'Google Calendar integration coming soon!';

  @override
  String connectedAsUser(String userId) {
    return 'Connected as user: $userId';
  }

  @override
  String get defaultWorkspace => 'Default Workspace';

  @override
  String get tasksCreatedInWorkspace => 'Tasks will be created in this workspace';

  @override
  String get defaultProjectOptional => 'Default Project (Optional)';

  @override
  String get leaveUnselectedTasks => 'Leave unselected to create tasks without a project';

  @override
  String get noProjectsInWorkspace => 'No projects found in this workspace';

  @override
  String get conversationTimeoutDesc =>
      'Choose how long to wait in silence before automatically ending a conversation:';

  @override
  String get timeout2Minutes => '2 minutes';

  @override
  String get timeout2MinutesDesc => 'End conversation after 2 minutes of silence';

  @override
  String get timeout5Minutes => '5 minutes';

  @override
  String get timeout5MinutesDesc => 'End conversation after 5 minutes of silence';

  @override
  String get timeout10Minutes => '10 minutes';

  @override
  String get timeout10MinutesDesc => 'End conversation after 10 minutes of silence';

  @override
  String get timeout30Minutes => '30 minutes';

  @override
  String get timeout30MinutesDesc => 'End conversation after 30 minutes of silence';

  @override
  String get timeout4Hours => '4 hours';

  @override
  String get timeout4HoursDesc => 'End conversation after 4 hours of silence';

  @override
  String get conversationEndAfterHours => 'Conversations will now end after 4 hours of silence';

  @override
  String conversationEndAfterMinutes(int minutes) {
    return 'Conversations will now end after $minutes minute(s) of silence';
  }

  @override
  String get tellUsPrimaryLanguage => 'Tell us your primary language';

  @override
  String get languageForTranscription => 'Set your language for sharper transcriptions and a personalized experience.';

  @override
  String get singleLanguageModeInfo => 'Single Language Mode is enabled. Translation is disabled for higher accuracy.';

  @override
  String get searchLanguageHint => 'Search language by name or code';

  @override
  String get noLanguagesFound => 'No languages found';

  @override
  String get skip => 'Skip';

  @override
  String languageSetTo(String language) {
    return 'Language set to $language';
  }

  @override
  String get failedToSetLanguage => 'Failed to set language';

  @override
  String appSettings(String appName) {
    return '$appName Settings';
  }

  @override
  String disconnectFromApp(String appName) {
    return 'Disconnect from $appName?';
  }

  @override
  String disconnectFromAppDesc(String appName) {
    return 'This will remove your $appName authentication. You\'ll need to reconnect to use it again.';
  }

  @override
  String connectedToApp(String appName) {
    return 'Connected to $appName';
  }

  @override
  String get account => 'Account';

  @override
  String actionItemsSyncedTo(String appName) {
    return 'Your action items will be synced to your $appName account';
  }

  @override
  String get defaultSpace => 'Default Space';

  @override
  String get selectSpaceInWorkspace => 'Select a space in your workspace';

  @override
  String get noSpacesInWorkspace => 'No spaces found in this workspace';

  @override
  String get defaultList => 'Default List';

  @override
  String get tasksAddedToList => 'Tasks will be added to this list';

  @override
  String get noListsInSpace => 'No lists found in this space';

  @override
  String get private => 'Private';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get taskIntegrations => 'Task Integrations';

  @override
  String get configureSettings => 'Configure Settings';

  @override
  String get completeAuthBrowser => 'Please complete authentication in your browser. Once done, return to the app.';

  @override
  String failedToStartAppAuth(String appName) {
    return 'Failed to start $appName authentication';
  }

  @override
  String connectToAppTitle(String appName) {
    return 'Connect to $appName';
  }

  @override
  String authorizeOmiForTasks(String appName) {
    return 'You\'ll need to authorize Toki to create tasks in your $appName account. This will open your browser for authentication.';
  }

  @override
  String get continueButton => 'Continue';

  @override
  String appIntegration(String appName) {
    return '$appName Integration';
  }

  @override
  String integrationComingSoon(String appName) {
    return 'Integration with $appName is coming soon! We\'re working hard to bring you more task management options.';
  }

  @override
  String get gotIt => 'Got it';

  @override
  String get tasksExportedOneApp => 'Tasks can be exported to one app at a time.';

  @override
  String get importConfiguration => 'Import Configuration';

  @override
  String get exportConfiguration => 'Export configuration';

  @override
  String get payYourSttProvider => 'Freely use omi. You only pay your STT provider directly.';

  @override
  String get hostRequired => 'Host is required';

  @override
  String get validPortRequired => 'Valid port is required';

  @override
  String get validWebsocketUrlRequired => 'Valid WebSocket URL is required (wss://)';

  @override
  String get apiUrlRequired => 'API URL is required';

  @override
  String get apiKeyRequired => 'API key is required';

  @override
  String get invalidJsonConfig => 'Invalid JSON configuration';

  @override
  String errorSaving(String error) {
    return 'Error saving: $error';
  }

  @override
  String get configCopiedToClipboard => 'Config copied to clipboard';

  @override
  String get pasteJsonConfig => 'Paste your JSON configuration below:';

  @override
  String get addApiKeyAfterImport => 'You\'ll need to add your own API key after importing';

  @override
  String get paste => 'Paste';

  @override
  String get import => 'Import';

  @override
  String get invalidProviderInConfig => 'Invalid provider in configuration';

  @override
  String importedConfig(String providerName) {
    return 'Imported $providerName configuration';
  }

  @override
  String invalidJson(String error) {
    return 'Invalid JSON: $error';
  }

  @override
  String get provider => 'Provider';

  @override
  String get live => 'Live';

  @override
  String get onDevice => 'On Device';

  @override
  String get apiUrl => 'API URL';

  @override
  String get enterSttHttpEndpoint => 'Enter your STT HTTP endpoint';

  @override
  String get websocketUrl => 'WebSocket URL';

  @override
  String get enterLiveSttWebsocket => 'Enter your live STT WebSocket endpoint';

  @override
  String get apiKey => 'API key';

  @override
  String get enterApiKey => 'Enter your API key';

  @override
  String get storedLocallyNeverShared => 'Stored locally, never shared';

  @override
  String get host => 'Host';

  @override
  String get port => 'Port';

  @override
  String get advanced => 'Advanced';

  @override
  String get configuration => 'Configuration';

  @override
  String get requestConfiguration => 'Request Configuration';

  @override
  String get responseSchema => 'Response Schema';

  @override
  String get modified => 'Modified';

  @override
  String get resetRequestConfig => 'Reset request config to default';

  @override
  String get logs => 'Logs';

  @override
  String get logsCopied => 'Logs copied';

  @override
  String get noLogsYet => 'No logs yet. Start recording to see custom STT activity.';

  @override
  String deviceUsesCodec(String device, String reason) {
    return '$device uses $reason. Toki will be used.';
  }

  @override
  String get omiTranscription => 'Toki Transcription';

  @override
  String get processing => 'Processing...';

  @override
  String get creatingYourApp => 'Creating your app...';

  @override
  String get appName => 'App Name';

  @override
  String get description => 'Description';

  @override
  String get free => 'Free';

  @override
  String get makePublic => 'Make Public';

  @override
  String get anyoneCanDiscover => 'Anyone can discover your app';

  @override
  String get onlyYouCanUse => 'Only you can use this app';

  @override
  String get creating => 'Creating...';

  @override
  String get searchingForDevices => 'Searching for devices...';

  @override
  String devicesFoundNearby(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'DEVICES',
      one: 'DEVICE',
    );
    return '$count $_temp0 FOUND NEARBY';
  }

  @override
  String get pairingSuccessful => 'PAIRING SUCCESSFUL';

  @override
  String errorConnectingAppleWatch(String error) {
    return 'Error connecting to Apple Watch: $error';
  }

  @override
  String get dontShowAgain => 'Don\'t show again';

  @override
  String get iUnderstand => 'I Understand';

  @override
  String get enableBluetooth => 'Enable Bluetooth';

  @override
  String get bluetoothNeeded =>
      'Toki needs Bluetooth to connect to your wearable. Please enable Bluetooth and try again.';

  @override
  String get contactSupport => 'Contact Support?';

  @override
  String get connectLater => 'Connect Later';

  @override
  String get grantPermissions => 'Grant permissions';

  @override
  String get backgroundActivity => 'Background activity';

  @override
  String get backgroundActivityDesc => 'Let Toki run in the background for better stability';

  @override
  String get locationAccess => 'Location access';

  @override
  String get locationAccessDesc => 'Enable background location for the full experience';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsDesc => 'Enable notifications to stay informed';

  @override
  String get locationServiceDisabled => 'Location Service Disabled';

  @override
  String get locationServiceDisabledDesc =>
      'Location Service is Disabled. Please go to Settings > Privacy & Security > Location Services and enable it';

  @override
  String get leaveReviewIos =>
      'Help us reach more people by leaving a review in the App Store. Your feedback means the world to us!';

  @override
  String get leaveReviewAndroid =>
      'Help us reach more people by leaving a review in the Google Play Store. Your feedback means the world to us!';

  @override
  String get rateOnGooglePlay => 'Rate on Google Play';

  @override
  String get maybeLater => 'Maybe Later';

  @override
  String get speechProfileIntro => 'Toki needs to learn your goals and your voice. You\'ll be able to modify it later.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get allDone => 'All done!';

  @override
  String get keepGoing => 'Keep going, you are doing great';

  @override
  String get skipThisQuestion => 'Skip this question';

  @override
  String get skipForNow => 'Skip for now';

  @override
  String get connectionError => 'Connection Error';

  @override
  String get connectionErrorDesc =>
      'Failed to connect to the server. Please check your internet connection and try again.';

  @override
  String get invalidRecordingMultipleSpeakers => 'Invalid recording detected';

  @override
  String get multipleSpeakersDesc =>
      'It seems like there are multiple speakers in the recording. Please make sure you are in a quiet location and try again.';

  @override
  String get tooShortDesc => 'There is not enough speech detected. Please speak more and try again.';

  @override
  String get invalidRecordingDesc => 'Please make sure you speak for at least 5 seconds and not more than 90.';

  @override
  String get areYouThere => 'Are you there?';

  @override
  String get noSpeechDesc =>
      'We could not detect any speech. Please make sure to speak for at least 10 seconds and not more than 3 minutes.';

  @override
  String get connectionLost => 'Connection Lost';

  @override
  String get connectionLostDesc =>
      'The connection was interrupted. Please check your internet connection and try again.';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get connectOmiOmiGlass => 'Connect Toki / TokiGlass';

  @override
  String get continueWithoutDevice => 'Continue Without Device';

  @override
  String get permissionsRequired => 'Permissions Required';

  @override
  String get permissionsRequiredDesc =>
      'This app needs Bluetooth and Location permissions to function properly. Please enable them in the settings.';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get wantDifferentName => 'Want to go by something else?';

  @override
  String get whatsYourName => 'What\'s your name?';

  @override
  String get speakTranscribeSummarize => 'Speak. Transcribe. Summarize.';

  @override
  String get signInWithApple => 'Sign in with Apple';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get byContinuingAgree => 'By continuing, you agree to our ';

  @override
  String get termsOfUse => 'Terms of Use';

  @override
  String get omiYourAiCompanion => 'Toki – Your AI Companion';

  @override
  String get captureEveryMoment => 'Capture every moment. Get AI-powered\nsummaries. Never take notes again.';

  @override
  String get appleWatchSetup => 'Apple Watch Setup';

  @override
  String get permissionRequestedExclaim => 'Permission Requested!';

  @override
  String get microphonePermission => 'Microphone Permission';

  @override
  String get permissionGrantedNow =>
      'Permission granted! Now:\n\nOpen the Toki app on your watch and tap \"Continue\" below';

  @override
  String get needMicrophonePermission =>
      'We need microphone permission.\n\n1. Tap \"Grant Permission\"\n2. Allow on your iPhone\n3. Watch app will close\n4. Reopen and tap \"Continue\"';

  @override
  String get grantPermissionButton => 'Grant Permission';

  @override
  String get needHelp => 'Need Help?';

  @override
  String get troubleshootingSteps =>
      'Troubleshooting:\n\n1. Ensure Toki is installed on your watch\n2. Open the Toki app on your watch\n3. Look for the permission popup\n4. Tap \"Allow\" when prompted\n5. App on your watch will close - reopen it\n6. Come back and tap \"Continue\" on your iPhone';

  @override
  String get recordingStartedSuccessfully => 'Recording started successfully!';

  @override
  String get permissionNotGrantedYet =>
      'Permission not granted yet. Please make sure you allowed microphone access and reopened the app on your watch.';

  @override
  String errorRequestingPermission(String error) {
    return 'Error requesting permission: $error';
  }

  @override
  String errorStartingRecording(String error) {
    return 'Error starting recording: $error';
  }

  @override
  String get selectPrimaryLanguage => 'Select your primary language';

  @override
  String get languageBenefits => 'Set your language for sharper transcriptions and a personalized experience';

  @override
  String get whatsYourPrimaryLanguage => 'What\'s your primary language?';

  @override
  String get selectYourLanguage => 'Select your language';

  @override
  String get personalGrowthJourney => 'Your personal growth journey with AI that listens to your every word.';

  @override
  String get selectAll => 'Select all';

  @override
  String get searchMemories => 'Search memories...';

  @override
  String get memoryDeleted => 'Memory Deleted.';

  @override
  String get undo => 'Undo';

  @override
  String get noMemoriesYet => '🧠 No memories yet';

  @override
  String get noManualMemories => 'No manual memories yet';

  @override
  String get noMemoriesInCategories => 'No memories in these categories';

  @override
  String get noMemoriesFound => '🔍 No memories found';

  @override
  String get addFirstMemory => 'Add your first memory';

  @override
  String get clearMemoryTitle => 'Clear Toki\'s Memory';

  @override
  String get clearMemoryMessage => 'Are you sure you want to clear Toki\'s memory? This action cannot be undone.';

  @override
  String get clearMemoryButton => 'Clear Memory';

  @override
  String get memoryClearedSuccess => 'Toki\'s memory about you has been cleared';

  @override
  String get noMemoriesToDelete => 'No memories to delete';

  @override
  String get createMemoryTooltip => 'Create new memory';

  @override
  String get memoryManagement => 'Memory Management';

  @override
  String get filterMemories => 'Filter Memories';

  @override
  String totalMemoriesCount(int count) {
    return 'You have $count total memories';
  }

  @override
  String get publicMemories => 'Public memories';

  @override
  String get privateMemories => 'Private memories';

  @override
  String get makeAllPrivate => 'Make All Memories Private';

  @override
  String get makeAllPublic => 'Make All Memories Public';

  @override
  String get deleteAllMemories => 'Delete All Memories';

  @override
  String get allMemoriesPrivateResult => 'All memories are now private';

  @override
  String get allMemoriesPublicResult => 'All memories are now public';

  @override
  String get newMemory => '✨ New Memory';

  @override
  String get editMemory => '✏️ Edit Memory';

  @override
  String get memoryContentHint => 'I like to eat ice cream...';

  @override
  String get failedToSaveMemory => 'Failed to save. Please check your connection.';

  @override
  String get saveMemory => 'Save Memory';

  @override
  String get retry => 'Retry';

  @override
  String get createActionItem => 'Create Action Item';

  @override
  String get actionItemDescriptionHint => 'What needs to be done?';

  @override
  String get actionItemDescriptionEmpty => 'Action item description cannot be empty.';

  @override
  String get actionItemUpdated => 'Action item updated';

  @override
  String get failedToUpdateActionItem => 'Failed to update action item';

  @override
  String get actionItemCreated => 'Action item created';

  @override
  String get failedToCreateActionItem => 'Failed to create action item';

  @override
  String get time => 'Time';

  @override
  String get addDueDate => 'Add due date';

  @override
  String get pressDoneToSave => 'Press done to save';

  @override
  String get pressDoneToCreate => 'Press done to create';

  @override
  String get filterAll => 'All';

  @override
  String get filterSystem => 'About You';

  @override
  String get filterInteresting => 'Insights';

  @override
  String get filterManual => 'Manual';

  @override
  String get completed => 'Completed';

  @override
  String get markComplete => 'Mark Complete';

  @override
  String get actionItemDeleted => 'Action item deleted';

  @override
  String get failedToDeleteActionItem => 'Failed to delete action item';

  @override
  String get deleteActionItemConfirmTitle => 'Delete Action Item';

  @override
  String get deleteActionItemConfirmMessage => 'Are you sure you want to delete this action item?';

  @override
  String get appLanguage => 'App Language';

  @override
  String get appInterfaceSectionTitle => 'APP INTERFACE';

  @override
  String get speechTranscriptionSectionTitle => 'SPEECH & TRANSCRIPTION';

  @override
  String get languageSettingsHelperText =>
      'App Language changes menus and buttons. Speech Language affects how your recordings are transcribed.';

  @override
  String get translationNotice => 'Translation Notice';

  @override
  String get translationNoticeMessage =>
      'Toki translates conversations into your primary language. Update it anytime in Settings → Profiles.';

  @override
  String get pleaseCheckInternetConnection => 'Please check your internet connection and try again';

  @override
  String get pleaseSelectReason => 'Please select a reason';

  @override
  String get tellUsMoreWhatWentWrong => 'Tell us more about what went wrong...';

  @override
  String get selectText => 'Select Text';

  @override
  String maximumGoalsAllowed(int count) {
    return 'Maximum $count goals allowed';
  }

  @override
  String get conversationCannotBeMerged => 'This conversation cannot be merged (locked or already merging)';

  @override
  String get pleaseEnterFolderName => 'Please enter a folder name';

  @override
  String get failedToCreateFolder => 'Failed to create folder';

  @override
  String get failedToUpdateFolder => 'Failed to update folder';

  @override
  String get folderName => 'Folder name';

  @override
  String get descriptionOptional => 'Description (optional)';

  @override
  String get failedToDeleteFolder => 'Failed to delete folder';

  @override
  String get editFolder => 'Edit Folder';

  @override
  String get deleteFolder => 'Delete Folder';

  @override
  String get transcriptCopiedToClipboard => 'Transcript copied to clipboard';

  @override
  String get actionItemsCopiedToClipboard => 'Action items copied to clipboard';

  @override
  String get summarize => 'Summarize';

  @override
  String get generateSummary => 'Generate Summary';

  @override
  String get conversationNotFoundOrDeleted => 'Conversation not found or has been deleted';

  @override
  String get deleteMemory => 'Delete Memory';

  @override
  String get thisActionCannotBeUndone => 'This action cannot be undone.';

  @override
  String memoriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count memories',
      one: '1 memory',
      zero: '0 memories',
    );
    return '$_temp0';
  }

  @override
  String get noMemoriesInCategory => 'No memories in this category yet';

  @override
  String get addYourFirstMemory => 'Add your first memory';

  @override
  String get firmwareDisconnectUsb => 'Disconnect USB';

  @override
  String get firmwareUsbWarning => 'USB connection during updates may damage your device.';

  @override
  String get firmwareBatteryAbove15 => 'Battery Above 15%';

  @override
  String get firmwareEnsureBattery => 'Ensure your device has 15% battery.';

  @override
  String get firmwareStableConnection => 'Stable Connection';

  @override
  String get firmwareConnectWifi => 'Connect to WiFi or cellular.';

  @override
  String failedToStartUpdate(String error) {
    return 'Failed to start update: $error';
  }

  @override
  String get beforeUpdateMakeSure => 'Before Update, Make Sure:';

  @override
  String get confirmed => 'Confirmed!';

  @override
  String get release => 'Release';

  @override
  String get slideToUpdate => 'Slide to Update';

  @override
  String copiedToClipboard(String title) {
    return '$title copied to clipboard';
  }

  @override
  String get batteryLevel => 'Battery Level';

  @override
  String get productUpdate => 'Product Update';

  @override
  String get offline => 'Offline';

  @override
  String get available => 'Available';

  @override
  String get unpairDeviceDialogTitle => 'Unpair Device';

  @override
  String get unpairDeviceDialogMessage =>
      'This will unpair the device so it can be connected to another phone. You will need to go to Settings > Bluetooth and forget the device to complete the process.';

  @override
  String get unpair => 'Unpair';

  @override
  String get unpairAndForgetDevice => 'Unpair and Forget Device';

  @override
  String get unknownDevice => 'Unknown';

  @override
  String get unknown => 'Unknown';

  @override
  String get productName => 'Product Name';

  @override
  String get serialNumber => 'Serial Number';

  @override
  String get connected => 'Connected';

  @override
  String get privacyPolicyTitle => 'Privacy Policy';

  @override
  String labelCopied(String label) {
    return '$label copied';
  }

  @override
  String get noApiKeysYet => 'No API keys yet';

  @override
  String get createKeyToGetStarted => 'Create a key to get started';

  @override
  String get persona => 'Persona';

  @override
  String get configureSttProvider => 'Configure STT provider';

  @override
  String get setWhenConversationsAutoEnd => 'Set when conversations auto-end';

  @override
  String get importDataFromOtherSources => 'Import data from other sources';

  @override
  String get debugAndDiagnostics => 'Debug & Diagnostics';

  @override
  String get helpsDiagnoseIssues => 'Helps diagnose issues';

  @override
  String get exportConversationsToJson => 'Export conversations to a JSON file';

  @override
  String get knowledgeGraphDeletedSuccess => 'Knowledge Graph deleted successfully';

  @override
  String failedToDeleteGraph(String error) {
    return 'Failed to delete graph: $error';
  }

  @override
  String get clearAllNodesAndConnections => 'Clear all nodes and connections';

  @override
  String get addToClaudeDesktopConfig => 'Add to claude_desktop_config.json';

  @override
  String get useYourMcpApiKey => 'Use your MCP API key';

  @override
  String get realTimeTranscript => 'Real-time Transcript';

  @override
  String get experimental => 'Experimental';

  @override
  String get transcriptionDiagnostics => 'Transcription Diagnostics';

  @override
  String get detailedDiagnosticMessages => 'Detailed diagnostic messages';

  @override
  String get autoCreateSpeakers => 'Auto-create Speakers';

  @override
  String get autoCreateWhenNameDetected => 'Auto-create when name detected';

  @override
  String get followUpQuestions => 'Follow-up Questions';

  @override
  String get suggestQuestionsAfterConversations => 'Suggest questions after conversations';

  @override
  String get goalTracker => 'Goal Tracker';

  @override
  String get dailyReflection => 'Daily Reflection';

  @override
  String get overdue => 'Overdue';

  @override
  String get howDoesItWork => 'How does it work?';

  @override
  String get sdCardSyncDescription => 'SD Card Sync will import your memories from the SD Card to the app';

  @override
  String get checksForAudioFiles => 'Checks for audio files on the SD Card';

  @override
  String get omiSyncsAudioFiles => 'Toki then syncs the audio files with the server';

  @override
  String get serverProcessesAudio => 'The server processes the audio files and creates memories';

  @override
  String get youreAllSet => 'You\'re all set!';

  @override
  String get back => 'Back';

  @override
  String get space => 'Space';

  @override
  String get search => 'Search';

  @override
  String get addGoal => 'Add Goal';

  @override
  String get editGoal => 'Edit Goal';

  @override
  String get icon => 'Icon';

  @override
  String get goalTitle => 'Goal title';

  @override
  String get current => 'Current';

  @override
  String get target => 'Target';

  @override
  String get goals => 'Goals';

  @override
  String get noTasksForToday => 'No tasks for today.\nAsk Toki for more tasks or create manually.';

  @override
  String get dailyScore => 'DAILY SCORE';

  @override
  String get dailyScoreDescription => 'A score to help you better\nfocus on execution.';

  @override
  String get actionItems => 'Action Items';

  @override
  String get tasksNoDeadline => 'No Deadline';

  @override
  String get tasksLater => 'Later';

  @override
  String get tasks => 'Tasks';

  @override
  String get create => 'Create';

  @override
  String get noTasksYet => 'No Tasks Yet';

  @override
  String get monthJan => 'Jan';

  @override
  String get monthFeb => 'Feb';

  @override
  String get monthMar => 'Mar';

  @override
  String get monthApr => 'Apr';

  @override
  String get monthMay => 'May';

  @override
  String get monthJun => 'Jun';

  @override
  String get monthJul => 'Jul';

  @override
  String get monthAug => 'Aug';

  @override
  String get monthSep => 'Sep';

  @override
  String get monthOct => 'Oct';

  @override
  String get monthNov => 'Nov';

  @override
  String get monthDec => 'Dec';

  @override
  String get timePM => 'PM';

  @override
  String get timeAM => 'AM';

  @override
  String get deleteActionItem => 'Delete Action Item';

  @override
  String get all => 'All';

  @override
  String get open => 'Open';

  @override
  String get install => 'Install';

  @override
  String get pleaseCheckInternetConnectionAndTryAgain => 'Please check your internet connection and try again';

  @override
  String get chatPrompt => 'Chat Prompt';

  @override
  String get conversationPrompt => 'Conversation Prompt';

  @override
  String get notificationScopes => 'Notification Scopes';

  @override
  String get connectNow => 'Connect Now';

  @override
  String get subscribe => 'Subscribe';

  @override
  String get setupInstructions => 'Setup Instructions';

  @override
  String get errorActivatingApp => 'Error activating the app';

  @override
  String get pleaseEnterAppName => 'Please enter app name';

  @override
  String get startConversation => 'Start a conversation and let the magic begin';

  @override
  String get takePhoto => 'Take Photo';

  @override
  String get selectFile => 'Select a File';

  @override
  String get clearChatTitle => 'Clear Chat?';

  @override
  String get confirmClearChat => 'Are you sure you want to clear the chat? This action cannot be undone.';

  @override
  String get copy => 'Copy';

  @override
  String get share => 'Share';

  @override
  String get report => 'Report';

  @override
  String get transcribing => 'Transcribing...';

  @override
  String get discardedConversation => 'Discarded Conversation';

  @override
  String get at => 'at';

  @override
  String get from => 'from';

  @override
  String get copied => 'Copied!';

  @override
  String get transcript => 'Transcript';

  @override
  String get user => 'User';

  @override
  String get starred => 'Starred';

  @override
  String get date => 'Date';

  @override
  String get conversations => 'Conversations';

  @override
  String get chat => 'Chat';

  @override
  String get actions => 'Actions';

  @override
  String get help => 'Help';

  @override
  String get pro => 'Pro';

  @override
  String get allMemories => 'All Memories';

  @override
  String get manual => 'Manual';

  @override
  String get category => 'Category';

  @override
  String get public => 'Public';

  @override
  String get createMemory => 'Create Memory';

  @override
  String get total => 'Total';

  @override
  String get continueWithApple => 'Continue with Apple';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get and => ' and ';

  @override
  String get dataAndPrivacy => 'Data & Privacy';

  @override
  String get dataProtection => 'Data Protection';

  @override
  String get yourDataIsProtected => 'Your data is protected and governed by our ';

  @override
  String get pleaseWait => 'Please wait...';

  @override
  String get teachOmiYourVoice => 'Teach Toki your voice';

  @override
  String get payment => 'Payment';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get exportConversations => 'Export Conversations';

  @override
  String get saveSettings => 'Save Settings';

  @override
  String get summary => 'Summary';

  @override
  String get auto => 'Auto';

  @override
  String get noSummaryForApp => 'No summary available for this app. Try another app for better results.';

  @override
  String get overview => 'Overview';

  @override
  String get unknownApp => 'Unknown App';

  @override
  String get reconnecting => 'Reconnecting...';

  @override
  String get startRecording => 'Start Recording';

  @override
  String get paused => 'Paused';

  @override
  String get recording => 'Recording';

  @override
  String get you => 'You';

  @override
  String speakerWithId(String speakerId) {
    return 'Speaker $speakerId';
  }

  @override
  String get systemAudio => 'System';

  @override
  String get mic => 'Mic';

  @override
  String get calendarIntegration => 'Calendar Integration';

  @override
  String get dailySummary => 'Daily Summary';

  @override
  String get developer => 'Developer';

  @override
  String get about => 'About';

  @override
  String get selectTime => 'Select Time';

  @override
  String get signOutQuestion => 'Sign Out?';

  @override
  String get signOutConfirmation => 'Are you sure you want to sign out?';

  @override
  String get dailySummaryDescription =>
      'Get a personalized summary of your day\'s conversations delivered as a notification.';

  @override
  String get deliveryTime => 'Delivery Time';

  @override
  String get displayOptions => 'Display Options';

  @override
  String get showMeetingsInMenuBar => 'Show Meetings in Menu Bar';

  @override
  String get upcomingMeetings => 'Upcoming Meetings';

  @override
  String get deleteKnowledgeGraphQuestion => 'Delete Knowledge Graph?';

  @override
  String get dailyReflectionDescription => 'Get a reminder at 9 PM to reflect on your day and capture your thoughts.';

  @override
  String get capabilities => 'Capabilities';

  @override
  String get updateApp => 'Update App';

  @override
  String get newVersionAvailable => 'New Version Available  🎉';

  @override
  String get no => 'No';

  @override
  String get installs => 'INSTALLS';

  @override
  String get updateReview => 'Update Review';

  @override
  String get weekdayMon => 'Mon';

  @override
  String get weekdayTue => 'Tue';

  @override
  String get weekdayWed => 'Wed';

  @override
  String get weekdayThu => 'Thu';

  @override
  String get weekdayFri => 'Fri';

  @override
  String get weekdaySat => 'Sat';

  @override
  String get weekdaySun => 'Sun';

  @override
  String serviceIntegrationComingSoon(String serviceName) {
    return '$serviceName integration coming soon';
  }

  @override
  String alreadyExportedTo(String platform) {
    return 'Already exported to $platform';
  }

  @override
  String get anotherPlatform => 'another platform';

  @override
  String pleaseAuthenticateWithService(String serviceName) {
    return 'Please authenticate with $serviceName in Settings > Task Integrations';
  }

  @override
  String addingToService(String serviceName) {
    return 'Adding to $serviceName...';
  }

  @override
  String addedToService(String serviceName) {
    return 'Added to $serviceName';
  }

  @override
  String failedToAddToService(String serviceName) {
    return 'Failed to add to $serviceName';
  }

  @override
  String get permissionDeniedForAppleReminders => 'Permission denied for Apple Reminders';

  @override
  String get createAKey => 'Create a Key';

  @override
  String get revokeKey => 'Revoke key';

  @override
  String get revoke => 'Revoke';

  @override
  String get revokeKeyQuestion => 'Revoke Key?';

  @override
  String revokeKeyConfirmation(String keyName) {
    return 'Are you sure you want to revoke the key \"$keyName\"? This action cannot be undone.';
  }

  @override
  String get createNewKey => 'Create New Key';

  @override
  String get keyNameHint => 'e.g., Claude Desktop';

  @override
  String get pleaseEnterAName => 'Please enter a name.';

  @override
  String failedToCreateKeyWithError(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get failedToCreateKeyTryAgain => 'Failed to create key. Please try again.';

  @override
  String get keyCreated => 'Key Created';

  @override
  String get keyCreatedMessage =>
      'Your new key has been created. Please copy it now. You will not be able to see it again.';

  @override
  String get keyWord => 'Key';

  @override
  String get noExternalAppsHaveAccess => 'No external apps have access to your data.';

  @override
  String get maximumSecurityE2ee => 'Maximum Security (E2EE)';

  @override
  String get e2eeDescription =>
      'End-to-end encryption is the gold standard for privacy. When enabled, your data is encrypted on your device before it\'s sent to our servers. This means no one, not even Toki, can access your content.';

  @override
  String get importantTradeoffs => 'Important Trade-offs:';

  @override
  String get e2eeTradeoff1 => '• Some features like external app integrations may be disabled.';

  @override
  String get e2eeTradeoff2 => '• If you lose your password, your data cannot be recovered.';

  @override
  String get featureComingSoon => 'This feature is coming soon!';

  @override
  String get migrationInProgressMessage =>
      'Migration in progress. You cannot change the protection level until it is complete.';

  @override
  String get migrationFailed => 'Migration Failed';

  @override
  String migratingFromTo(String source, String target) {
    return 'Migrating from $source to $target';
  }

  @override
  String objectsCount(String processed, String total) {
    return '$processed / $total objects';
  }

  @override
  String get secureEncryption => 'Secure Encryption';

  @override
  String get secureEncryptionDescription =>
      'Your data is encrypted with a key unique to you on our servers, hosted on Google Cloud. This means your raw content is inaccessible to anyone, including Toki staff or Google, directly from the database.';

  @override
  String get endToEndEncryption => 'End-to-End Encryption';

  @override
  String get e2eeCardDescription =>
      'Enable for maximum security where only you can access your data. Tap to learn more.';

  @override
  String get dataAlwaysEncrypted => 'Regardless of the level, your data is always encrypted at rest and in transit.';

  @override
  String get readOnlyScope => 'Read Only';

  @override
  String get fullAccessScope => 'Full Access';

  @override
  String get readScope => 'Read';

  @override
  String get writeScope => 'Write';

  @override
  String get apiKeyCreated => 'API Key Created!';

  @override
  String get saveKeyWarning => 'Save this key now! You won\'t be able to see it again.';

  @override
  String get yourApiKey => 'YOUR API KEY';

  @override
  String get tapToCopy => 'Tap to copy';

  @override
  String get copyKey => 'Copy Key';

  @override
  String get createApiKey => 'Create API Key';

  @override
  String get accessDataProgrammatically => 'Access your data programmatically';

  @override
  String get keyNameLabel => 'KEY NAME';

  @override
  String get keyNamePlaceholder => 'e.g., My App Integration';

  @override
  String get permissionsLabel => 'PERMISSIONS';

  @override
  String get permissionsInfoNote => 'R = Read, W = Write. Defaults to read-only if nothing selected.';

  @override
  String get developerApi => 'Developer API';

  @override
  String get createAKeyToGetStarted => 'Create a key to get started';

  @override
  String errorWithMessage(String error) {
    return 'Error: $error';
  }

  @override
  String get active => 'Active';

  @override
  String get configure => 'Configure';

  @override
  String get privacyInformation => 'Privacy Information';

  @override
  String get yourPrivacyMattersToUs => 'Your Privacy Matters to Us';

  @override
  String get privacyIntroText =>
      'At Toki, we take your privacy very seriously. We want to be transparent about the data we collect and how we use it to improve our product for you. Here\'s what you need to know:';

  @override
  String get whatWeTrack => 'What We Track';

  @override
  String get anonymityAndPrivacy => 'Anonymity and Privacy';

  @override
  String get optInAndOptOutOptions => 'Opt-In and Opt-Out Options';

  @override
  String get ourCommitment => 'Our Commitment';

  @override
  String get commitmentText =>
      'We are committed to using the data we collect only to make Toki a better product for you. Your privacy and trust are paramount to us.';

  @override
  String get thankYouText =>
      'Thank you for being a valued user of Toki. If you have any questions or concerns, feel free to reach out to us to team@basedhardware.com.';

  @override
  String get password => 'Password';

  @override
  String summaryGeneratedForDate(String date) {
    return 'Summary generated for $date';
  }

  @override
  String get failedToGenerateSummaryCheckConversations =>
      'Failed to generate summary. Make sure you have conversations for that day.';

  @override
  String get summaryNotFound => 'Summary not found';

  @override
  String get yourDaysJourney => 'Your Day\'s Journey';

  @override
  String get highlights => 'Highlights';

  @override
  String get unresolvedQuestions => 'Unresolved Questions';

  @override
  String get decisions => 'Decisions';

  @override
  String get learnings => 'Learnings';

  @override
  String get autoDeletesAfterThreeDays => 'Auto-deletes after 3 days.';

  @override
  String get knowledgeGraphDeletedSuccessfully => 'Knowledge Graph deleted successfully';

  @override
  String get exportStartedMayTakeFewSeconds => 'Export started. This may take a few seconds...';

  @override
  String get knowledgeGraphDeleteDescription =>
      'This will delete all derived knowledge graph data (nodes and connections). Your original memories will remain safe. The graph will be rebuilt over time or upon next request.';

  @override
  String accessesDataTypes(String dataTypes) {
    return 'Accesses $dataTypes';
  }

  @override
  String triggeredByType(String triggerType) {
    return 'triggered by $triggerType';
  }

  @override
  String accessesAndTriggeredBy(String accessDescription, String triggerDescription) {
    return '$accessDescription and is $triggerDescription.';
  }

  @override
  String isTriggeredBy(String triggerDescription) {
    return 'Is $triggerDescription.';
  }

  @override
  String get noSpecificDataAccessConfigured => 'No specific data access configured.';

  @override
  String get minutes => 'minutes';

  @override
  String get setupOnDevice => 'Setup on-device';

  @override
  String get importHistory => 'Import History';

  @override
  String get noImportsYet => 'No imports yet';

  @override
  String get selectZipFileToImport => 'Select the .zip file to import!';

  @override
  String get otherDevicesComingSoon => 'Other devices coming soon';

  @override
  String get deleteAllLimitlessConversations => 'Delete All Limitless Conversations?';

  @override
  String get deleteAllLimitlessWarning =>
      'This will permanently delete all conversations imported from Limitless. This action cannot be undone.';

  @override
  String deletedLimitlessConversations(int count) {
    return 'Deleted $count Limitless conversations';
  }

  @override
  String get failedToDeleteConversations => 'Failed to delete conversations';

  @override
  String get deleteImportedData => 'Delete Imported Data';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusProcessing => 'Processing';

  @override
  String get statusCompleted => 'Completed';

  @override
  String get statusFailed => 'Failed';

  @override
  String nConversations(int count) {
    return '$count conversations';
  }

  @override
  String get pleaseEnterName => 'Please enter a name';

  @override
  String get nameMustBeBetweenCharacters => 'Name must be between 2 and 40 characters';

  @override
  String get deleteSampleQuestion => 'Delete Sample?';

  @override
  String deleteSampleConfirmation(String name) {
    return 'Are you sure you want to delete $name\'s sample?';
  }

  @override
  String get confirmDeletion => 'Confirm Deletion';

  @override
  String deletePersonConfirmation(String name) {
    return 'Are you sure you want to delete $name? This will also remove all associated speech samples.';
  }

  @override
  String get howItWorksTitle => 'How it works?';

  @override
  String get howPeopleWorks =>
      'Once a person is created, you can go to a conversation transcript, and assign them their corresponding segments, that way Toki will be able to recognize their speech too!';

  @override
  String get tapToDelete => 'Tap to delete';

  @override
  String get newTag => 'NEW';

  @override
  String get localStorageEnabled => 'Local storage enabled';

  @override
  String get localStorageDisabled => 'Local storage disabled';

  @override
  String failedToUpdateSettings(String error) {
    return 'Failed to update settings: $error';
  }

  @override
  String get privacyNotice => 'Privacy Notice';

  @override
  String get recordingsMayCaptureOthers =>
      'Recordings may capture others\' voices. Ensure you have consent from all participants before enabling.';

  @override
  String get enable => 'Enable';

  @override
  String get storeAudioOnPhone => 'Store Audio on Phone';

  @override
  String get on => 'On';

  @override
  String get storeAudioDescription =>
      'Keep all audio recordings stored locally on your phone. When disabled, only failed uploads are kept to save storage space.';

  @override
  String get enableLocalStorage => 'Enable Local Storage';

  @override
  String get cloudStorageEnabled => 'Cloud storage enabled';

  @override
  String get cloudStorageDisabled => 'Cloud storage disabled';

  @override
  String get enableCloudStorage => 'Enable Cloud Storage';

  @override
  String get storeAudioOnCloud => 'Store Audio on Cloud';

  @override
  String get cloudStorageDialogMessage =>
      'Your real-time recordings will be stored in private cloud storage as you speak.';

  @override
  String get storeAudioCloudDescription =>
      'Store your real-time recordings in private cloud storage as you speak. Audio is captured and saved securely in real-time.';

  @override
  String get downloadingFirmware => 'Downloading Firmware';

  @override
  String get installingFirmware => 'Installing Firmware';

  @override
  String get firmwareUpdateWarning => 'Do not close the app or turn off the device. This could corrupt your device.';

  @override
  String get firmwareUpdated => 'Firmware Updated';

  @override
  String restartDeviceToComplete(Object deviceName) {
    return 'Please restart your $deviceName to complete the update.';
  }

  @override
  String get yourDeviceIsUpToDate => 'Your device is up to date';

  @override
  String get currentVersion => 'Current Version';

  @override
  String get latestVersion => 'Latest Version';

  @override
  String get whatsNew => 'What\'s New';

  @override
  String get installUpdate => 'Install Update';

  @override
  String get updateNow => 'Update Now';

  @override
  String get updateGuide => 'Update Guide';

  @override
  String get checkingForUpdates => 'Checking for Updates';

  @override
  String get checkingFirmwareVersion => 'Checking firmware version...';

  @override
  String get firmwareUpdate => 'Firmware Update';

  @override
  String get payments => 'Payments';

  @override
  String get connectPaymentMethodInfo => 'Connect a payment method below to start receiving payouts for your apps.';

  @override
  String get selectedPaymentMethod => 'Selected Payment Method';

  @override
  String get availablePaymentMethods => 'Available Payment Methods';

  @override
  String get setActive => 'Set Active';

  @override
  String get getPaidThroughStripe => 'Get paid for your app sales through Stripe';

  @override
  String get monthlyPayouts => 'Monthly payouts';

  @override
  String get monthlyPayoutsDescription =>
      'Receive monthly payments directly to your account when you reach \$10 in earnings';

  @override
  String get secureAndReliable => 'Secure and reliable';

  @override
  String get stripeSecureDescription => 'Stripe ensures safe and timely transfers of your app revenue';

  @override
  String get selectYourCountry => 'Select your country';

  @override
  String get countrySelectionPermanent => 'Your country selection is permanent and cannot be changed later.';

  @override
  String get byClickingConnectNow => 'By clicking on \"Connect Now\" you agree to the';

  @override
  String get stripeConnectedAccountAgreement => 'Stripe Connected Account Agreement';

  @override
  String get errorConnectingToStripe => 'Error connecting to Stripe! Please try again later.';

  @override
  String get connectingYourStripeAccount => 'Connecting your Stripe account';

  @override
  String get stripeOnboardingInstructions =>
      'Please complete the Stripe onboarding process in your browser. This page will automatically update once completed.';

  @override
  String get failedTryAgain => 'Failed? Try Again';

  @override
  String get illDoItLater => 'I\'ll do it later';

  @override
  String get successfullyConnected => 'Successfully Connected!';

  @override
  String get stripeReadyForPayments =>
      'Your Stripe account is now ready to receive payments. You can start earning from your app sales right away.';

  @override
  String get updateStripeDetails => 'Update Stripe Details';

  @override
  String get errorUpdatingStripeDetails => 'Error updating Stripe details! Please try again later.';

  @override
  String get updatePayPal => 'Update PayPal';

  @override
  String get setUpPayPal => 'Set Up PayPal';

  @override
  String get updatePayPalAccountDetails => 'Update your PayPal account details';

  @override
  String get connectPayPalToReceivePayments => 'Connect your PayPal account to start receiving payments for your apps';

  @override
  String get paypalEmail => 'PayPal Email';

  @override
  String get paypalMeLink => 'PayPal.me Link';

  @override
  String get stripeRecommendation =>
      'If Stripe is available in your country, we highly recommend using it for faster and easier payouts.';

  @override
  String get updatePayPalDetails => 'Update PayPal Details';

  @override
  String get savePayPalDetails => 'Save PayPal Details';

  @override
  String get pleaseEnterPayPalEmail => 'Please enter your PayPal email';

  @override
  String get pleaseEnterPayPalMeLink => 'Please enter your PayPal.me link';

  @override
  String get doNotIncludeHttpInLink => 'Do not include http or https or www in the link';

  @override
  String get pleaseEnterValidPayPalMeLink => 'Please enter a valid PayPal.me link';

  @override
  String get pleaseEnterValidEmail => 'Please enter a valid email address';

  @override
  String get syncingYourRecordings => 'Syncing your recordings';

  @override
  String get syncYourRecordings => 'Sync your recordings';

  @override
  String get syncNow => 'Sync Now';

  @override
  String get error => 'Error';

  @override
  String get speechSamples => 'Speech Samples';

  @override
  String additionalSampleIndex(String index) {
    return 'Additional Sample $index';
  }

  @override
  String durationSeconds(String seconds) {
    return 'Duration: $seconds seconds';
  }

  @override
  String get additionalSpeechSampleRemoved => 'Additional Speech Sample Removed';

  @override
  String get consentDataMessage =>
      'By continuing, all data you share with this app (including your conversations, recordings, and personal information) will be securely stored on our servers to provide you with AI-powered insights and enable all app features.';

  @override
  String get tasksEmptyStateMessage => 'Tasks from your conversations will appear here.\nTap + to create one manually.';

  @override
  String get clearChatAction => 'Clear Chat';

  @override
  String get omiAppName => 'Toki';

  @override
  String get showMore => 'show more ↓';

  @override
  String get showLess => 'show less ↑';

  @override
  String get loadingYourRecording => 'Loading your recording...';

  @override
  String get photoDiscardedMessage => 'This photo was discarded as it was not significant.';

  @override
  String get analyzing => 'Analyzing...';

  @override
  String get searchCountries => 'Search countries';

  @override
  String get checkingAppleWatch => 'Checking Apple Watch...';

  @override
  String get installOmiOnAppleWatch => 'Install Toki on your\nApple Watch';

  @override
  String get installOmiOnAppleWatchDescription =>
      'To use your Apple Watch with Toki, you need to install the Toki app on your watch first.';

  @override
  String get openOmiOnAppleWatch => 'Open Toki on your\nApple Watch';

  @override
  String get openOmiOnAppleWatchDescription =>
      'The Toki app is installed on your Apple Watch. Open it and tap Start to begin.';

  @override
  String get openWatchApp => 'Open Watch App';

  @override
  String get iveInstalledAndOpenedTheApp => 'I\'ve Installed & Opened the App';

  @override
  String get unableToOpenWatchApp =>
      'Unable to open Apple Watch app. Please manually open the Watch app on your Apple Watch and install Toki from the \"Available Apps\" section.';

  @override
  String get appleWatchConnectedSuccessfully => 'Apple Watch connected successfully!';

  @override
  String get appleWatchNotReachable =>
      'Apple Watch still not reachable. Please make sure the Toki app is open on your watch.';

  @override
  String errorCheckingConnection(String error) {
    return 'Error checking connection: $error';
  }

  @override
  String get muted => 'Muted';

  @override
  String get processNow => 'Process Now';

  @override
  String get finishedConversation => 'Finished Conversation?';

  @override
  String get stopRecordingConfirmation => 'Are you sure you want to stop recording and summarize the conversation now?';

  @override
  String get conversationEndsManually => 'Conversation will only end manually.';

  @override
  String conversationSummarizedAfterMinutes(int minutes, String suffix) {
    return 'Conversation is summarized after $minutes minute$suffix of no speech.';
  }

  @override
  String get dontAskAgain => 'Don\'t ask me again';

  @override
  String get waitingForTranscriptOrPhotos => 'Waiting for transcript or photos...';

  @override
  String get noSummaryYet => 'No summary yet';

  @override
  String hints(String text) {
    return 'Hints: $text';
  }

  @override
  String get testConversationPrompt => 'Test a Conversation Prompt';

  @override
  String get prompt => 'Prompt';

  @override
  String get result => 'Result:';

  @override
  String get compareTranscripts => 'Compare Transcripts';

  @override
  String get notHelpful => 'Not Helpful';

  @override
  String get exportTasksWithOneTap => 'Export tasks with one tap!';

  @override
  String get inProgress => 'In progress';

  @override
  String get photos => 'Photos';

  @override
  String get rawData => 'Raw Data';

  @override
  String get content => 'Content';

  @override
  String get noContentToDisplay => 'No content to display';

  @override
  String get noSummary => 'No summary';

  @override
  String get updateOmiFirmware => 'Update omi firmware';

  @override
  String loadMoreRemaining(String count) {
    return 'Load More ($count remaining)';
  }

  @override
  String wrappedTopPercentUser(String percentile) {
    return 'Top $percentile% User';
  }

  @override
  String get wrappedMinutes => 'minutes';

  @override
  String get wrappedConversations => 'conversations';

  @override
  String get wrappedDaysActive => 'days active';

  @override
  String get wrappedYouTalkedAbout => 'You Talked About';

  @override
  String get wrappedActionItems => 'Action Items';

  @override
  String get wrappedTasksCreated => 'tasks created';

  @override
  String get wrappedCompleted => 'completed';

  @override
  String wrappedCompletionRate(String rate) {
    return '$rate% completion rate';
  }

  @override
  String get wrappedBestMoments => 'Best Moments';

  @override
  String get wrappedMyBuddies => 'My Buddies';

  @override
  String get wrappedCouldntStopTalkingAbout => 'Couldn\'t Stop Talking About';

  @override
  String get wrappedShow => 'SHOW';

  @override
  String get wrappedMovie => 'MOVIE';

  @override
  String get wrappedBook => 'BOOK';

  @override
  String get wrappedCelebrity => 'CELEBRITY';

  @override
  String get wrappedFood => 'FOOD';

  @override
  String get wrappedMovieRecs => 'Movie Recs For Friends';

  @override
  String get wrappedBiggest => 'Biggest';

  @override
  String get wrappedStruggle => 'Struggle';

  @override
  String get wrappedButYouPushedThrough => 'But you pushed through 💪';

  @override
  String get wrappedWin => 'Win';

  @override
  String get wrappedYouDidIt => 'You did it! 🎉';

  @override
  String get wrappedTopPhrases => 'Top 5 Phrases';

  @override
  String get wrappedMins => 'mins';

  @override
  String get wrappedConvos => 'convos';

  @override
  String get wrappedDays => 'days';

  @override
  String get wrappedMyBuddiesLabel => 'MY BUDDIES';

  @override
  String get wrappedObsessionsLabel => 'OBSESSIONS';

  @override
  String get wrappedStruggleLabel => 'STRUGGLE';

  @override
  String get wrappedWinLabel => 'WIN';

  @override
  String get wrappedTopPhrasesLabel => 'TOP PHRASES';

  @override
  String get wrappedLetsHitRewind => 'Let\'s hit rewind on your';

  @override
  String get wrappedGenerateMyWrapped => 'Generate My Wrapped';

  @override
  String get wrappedProcessingDefault => 'Processing...';

  @override
  String get wrappedCreatingYourStory => 'Creating your\n2025 story...';

  @override
  String get wrappedSomethingWentWrong => 'Something\nwent wrong';

  @override
  String get wrappedAnErrorOccurred => 'An error occurred';

  @override
  String get wrappedTryAgain => 'Try Again';

  @override
  String get wrappedNoDataAvailable => 'No data available';

  @override
  String get wrappedOmiLifeRecap => 'Toki Life Recap';

  @override
  String get wrappedSwipeUpToBegin => 'Swipe up to begin';

  @override
  String get wrappedShareText => 'My 2025, remembered by Toki ✨ omi.me/wrapped';

  @override
  String get wrappedFailedToShare => 'Failed to share. Please try again.';

  @override
  String get wrappedFailedToStartGeneration => 'Failed to start generation. Please try again.';

  @override
  String get wrappedStarting => 'Starting...';

  @override
  String get wrappedShare => 'Share';

  @override
  String get wrappedMy2025 => 'My 2025';

  @override
  String get wrappedRememberedByOmi => 'remembered by Toki';

  @override
  String get wrappedMostFunDay => 'Most Fun';

  @override
  String get wrappedMostProductiveDay => 'Most Productive';

  @override
  String get wrappedMostIntenseDay => 'Most Intense';

  @override
  String get wrappedFunniestMoment => 'Funniest';

  @override
  String get wrappedMostCringeMoment => 'Most Cringe';

  @override
  String get wrappedTasksGenerated => 'tasks generated';

  @override
  String get wrappedTasksCompleted => 'tasks completed';

  @override
  String get wrappedTopFivePhrases => 'Top 5 Phrases';

  @override
  String get wrappedAGreatDay => 'A Great Day';

  @override
  String get wrappedGettingItDone => 'Getting It Done';

  @override
  String get wrappedAChallenge => 'A Challenge';

  @override
  String get wrappedAHilariousMoment => 'A Hilarious Moment';

  @override
  String get wrappedThatAwkwardMoment => 'That Awkward Moment';

  @override
  String get wrappedYouHadFunnyMoments => 'You had some funny moments this year!';

  @override
  String get wrappedWeveAllBeenThere => 'We\'ve all been there!';

  @override
  String get wrappedFriend => 'Friend';

  @override
  String get wrappedYourBuddy => 'Your buddy!';

  @override
  String get wrappedNotMentioned => 'Not mentioned';

  @override
  String get wrappedTheHardPart => 'The Hard Part';

  @override
  String get wrappedPersonalGrowth => 'Personal Growth';

  @override
  String get wrappedFunDay => 'Fun';

  @override
  String get wrappedProductiveDay => 'Productive';

  @override
  String get wrappedIntenseDay => 'Intense';

  @override
  String get wrappedFunnyMomentTitle => 'Funny Moment';

  @override
  String get wrappedCringeMomentTitle => 'Cringe Moment';

  @override
  String get wrappedCompletedLabel => 'Completed';

  @override
  String get wrappedMyBuddiesCard => 'My Buddies';

  @override
  String get wrappedBuddiesLabel => 'BUDDIES';

  @override
  String get wrappedObsessionsLabelUpper => 'OBSESSIONS';

  @override
  String get wrappedStruggleLabelUpper => 'STRUGGLE';

  @override
  String get wrappedWinLabelUpper => 'WIN';

  @override
  String get wrappedTopPhrasesLabelUpper => 'TOP PHRASES';

  @override
  String get wrappedBestHeader => 'Best';

  @override
  String get wrappedMomentsHeader => 'Moments';

  @override
  String get wrappedBestMomentsBadge => 'Best Moments';

  @override
  String get wrappedBiggestHeader => 'Biggest';

  @override
  String get wrappedStruggleHeader => 'Struggle';

  @override
  String get wrappedWinHeader => 'Win';

  @override
  String get wrappedButYouPushedThroughEmoji => 'But you pushed through 💪';

  @override
  String get wrappedYouDidItEmoji => 'You did it! 🎉';

  @override
  String get wrappedHours => 'hours';

  @override
  String get wrappedActions => 'actions';

  @override
  String get multipleSpeakersDetected => 'Multiple speakers detected';

  @override
  String get multipleSpeakersDescription =>
      'It seems like there are multiple speakers in the recording. Please make sure you are in a quiet location and try again.';

  @override
  String get invalidRecordingDetected => 'Invalid recording detected';

  @override
  String get notEnoughSpeechDescription => 'There is not enough speech detected. Please speak more and try again.';

  @override
  String get speechDurationDescription => 'Please make sure you speak for at least 5 seconds and not more than 90.';

  @override
  String get connectionLostDescription =>
      'The connection was interrupted. Please check your internet connection and try again.';

  @override
  String get howToTakeGoodSample => 'How to take a good sample?';

  @override
  String get goodSampleInstructions =>
      '1. Make sure you are in a quiet place.\n2. Speak clearly and naturally.\n3. Make sure your device is in its natural position, on your neck.\n\nOnce it\'s created, you can always improve it or do it again.';

  @override
  String get noDeviceConnectedUseMic => 'No device connected. Will use phone microphone.';

  @override
  String get doItAgain => 'Do it again';

  @override
  String get listenToSpeechProfile => 'Listen to my speech profile ➡️';

  @override
  String get recognizingOthers => 'Recognizing others 👀';

  @override
  String get keepGoingGreat => 'Keep going, you are doing great';

  @override
  String get somethingWentWrongTryAgain => 'Something went wrong! Please try again later.';

  @override
  String get uploadingVoiceProfile => 'Uploading your voice profile....';

  @override
  String get memorizingYourVoice => 'Memorizing your voice...';

  @override
  String get personalizingExperience => 'Personalizing your experience...';

  @override
  String get notificationFrequency => 'Notification Frequency';

  @override
  String get dailyScoreBreakdown => 'Daily Score Breakdown';

  @override
  String get todaysScore => 'Today\'s Score';

  @override
  String get tasksCompleted => 'Tasks Completed';

  @override
  String get completionRate => 'Completion Rate';

  @override
  String get howItWorks => 'How it works';

  @override
  String get dailyScoreExplanation =>
      'Your daily score is based on task completion. Complete your tasks to improve your score!';

  @override
  String get notificationFrequencyDescription =>
      'Control how often Toki sends you proactive notifications and reminders.';

  @override
  String get sliderOff => 'Off';

  @override
  String get sliderMax => 'Max';

  @override
  String summaryGeneratedFor(String date) {
    return 'Summary generated for $date';
  }

  @override
  String get failedToGenerateSummary => 'Failed to generate summary. Make sure you have conversations for that day.';

  @override
  String deleteQuoted(String name) {
    return 'Delete \"$name\"';
  }

  @override
  String moveConversationsTo(int count) {
    return 'Move $count conversations to:';
  }

  @override
  String get noFolder => 'No Folder';

  @override
  String get removeFromAllFolders => 'Remove from all folders';

  @override
  String get frequencyOff => 'Off';

  @override
  String get frequencyMinimal => 'Minimal';

  @override
  String get frequencyLow => 'Low';

  @override
  String get frequencyBalanced => 'Balanced';

  @override
  String get frequencyHigh => 'High';

  @override
  String get frequencyMaximum => 'Maximum';

  @override
  String get frequencyDescOff => 'No proactive notifications';

  @override
  String get frequencyDescMinimal => 'Only critical reminders';

  @override
  String get frequencyDescLow => 'Important updates only';

  @override
  String get frequencyDescBalanced => 'Regular helpful nudges';

  @override
  String get frequencyDescHigh => 'Frequent check-ins';

  @override
  String get frequencyDescMaximum => 'Stay constantly engaged';

  @override
  String get clearChatQuestion => 'Clear Chat?';

  @override
  String get syncingMessages => 'Syncing messages with server...';

  @override
  String get disable => 'Disable';

  @override
  String get photoLibrary => 'Photo Library';

  @override
  String get chooseFile => 'Choose File';

  @override
  String get configureAiPersona => 'Configure your AI persona';

  @override
  String get connectAiAssistantsToYourData => 'Connect AI assistants to your data';

  @override
  String get oAuth => 'OAuth';

  @override
  String get trackYourGoalsOnHomepage => 'Track your personal goals on homepage';

  @override
  String get deleteRecording => 'Delete Recording';

  @override
  String get thisCannotBeUndone => 'This cannot be undone.';

  @override
  String get sdCard => 'SD Card';

  @override
  String get fromSd => 'From SD';

  @override
  String get limitless => 'Limitless';

  @override
  String get fastTransfer => 'Fast Transfer';

  @override
  String get syncingStatus => 'Syncing';

  @override
  String get failedStatus => 'Failed';

  @override
  String etaLabel(String time) {
    return 'ETA: $time';
  }

  @override
  String get transferMethod => 'Transfer Method';

  @override
  String get fast => 'Fast';

  @override
  String get ble => 'BLE';

  @override
  String get phone => 'Phone';

  @override
  String get cancelSync => 'Cancel Sync';

  @override
  String get cancelSyncMessage => 'Data already downloaded will be saved. You can resume later.';

  @override
  String get syncCancelled => 'Sync cancelled';

  @override
  String get wifiEnableFailed => 'Failed to enable WiFi on device. Please try again.';

  @override
  String get deviceNoFastTransfer => 'Your device does not support Fast Transfer. Use Bluetooth instead.';

  @override
  String get enableHotspotMessage => 'Please enable your phone\'s hotspot and try again.';

  @override
  String get transferStartFailed => 'Failed to start transfer. Please try again.';

  @override
  String get deviceNotResponding => 'Device did not respond. Please try again.';

  @override
  String get invalidWifiCredentials => 'Invalid WiFi credentials. Check your hotspot settings.';

  @override
  String get wifiConnectionFailed => 'WiFi connection failed. Please try again.';

  @override
  String get sdCardProcessing => 'SD Card Processing';

  @override
  String sdCardProcessingMessage(int count) {
    return 'Processing $count recording(s). Files will be removed from SD card after.';
  }

  @override
  String get process => 'Process';

  @override
  String get wifiSyncFailed => 'WiFi Sync Failed';

  @override
  String get processingFailed => 'Processing Failed';

  @override
  String processingProgress(int current, int total) {
    return 'Processing $current/$total';
  }

  @override
  String conversationsCreated(int count) {
    return '$count conversations created';
  }

  @override
  String get internetRequired => 'Internet required';

  @override
  String get processAudio => 'Process Audio';

  @override
  String get start => 'Start';

  @override
  String get noRecordings => 'No Recordings';

  @override
  String get audioFromOmiWillAppearHere => 'Audio from your Toki device will appear here';

  @override
  String get recordings => 'Recordings';

  @override
  String get enableRemindersAccess => 'Please enable Reminders access in Settings to use Apple Reminders';

  @override
  String todayAtTime(String time) {
    return 'Today at $time';
  }

  @override
  String yesterdayAtTime(String time) {
    return 'Yesterday at $time';
  }

  @override
  String get lessThanAMinute => 'Less than a minute';

  @override
  String estimatedMinutes(int count) {
    return '~$count minute(s)';
  }

  @override
  String estimatedHours(int count) {
    return '~$count hour(s)';
  }

  @override
  String estimatedTimeRemaining(String time) {
    return 'Estimated: $time remaining';
  }

  @override
  String get summarizingConversation => 'Summarizing conversation...\nThis may take a few seconds';

  @override
  String get resummarizingConversation => 'Re-summarizing conversation...\nThis may take a few seconds';

  @override
  String get nothingInterestingRetry => 'Nothing interesting found,\nwant to retry?';

  @override
  String get noSummaryForConversation => 'No summary available\nfor this conversation.';

  @override
  String get unknownLocation => 'Unknown location';

  @override
  String get couldNotLoadMap => 'Could not load map';

  @override
  String get triggerConversationIntegration => 'Trigger Conversation Created Integration';

  @override
  String get webhookUrlNotSet => 'Webhook URL not set';

  @override
  String get setWebhookUrlInSettings => 'Please set the webhook URL in developer settings to use this feature.';

  @override
  String get debugModeDetected => 'Debug Mode Detected';

  @override
  String get performanceReduced => 'Performance reduced 5-10x. Use Release mode.';

  @override
  String autoClosingInSeconds(int seconds) {
    return 'Auto-closing in ${seconds}s';
  }

  @override
  String get modelRequired => 'Model Required';

  @override
  String get downloadWhisperModel => 'Please download a Whisper model before saving.';

  @override
  String get deviceNotCompatible => 'Device Not Compatible';

  @override
  String get willLikelyCrash => 'Enabling this will likely cause the app to crash or freeze.';

  @override
  String get transcriptionSlowerLessAccurate => 'Transcription will be significantly slower and less accurate.';

  @override
  String get proceedAnyway => 'Proceed anyway';

  @override
  String get olderDeviceDetected => 'Older Device Detected';

  @override
  String get batteryUsageHigher => 'Battery usage will be higher than cloud transcription.';

  @override
  String get considerOmiCloud => 'Consider using Toki Cloud for better performance.';

  @override
  String get highResourceUsage => 'High Resource Usage';

  @override
  String get deviceMayWarmUp => 'Device may warm up during extended use.';

  @override
  String get speedAccuracyLower => 'Speed and accuracy may be lower than Cloud models.';

  @override
  String get cloudProvider => 'Cloud Provider';

  @override
  String get model => 'Model';

  @override
  String get performanceWarning => 'Performance Warning';

  @override
  String get usingNativeIosSpeech => 'Using Native iOS Speech Recognition';

  @override
  String get modelReady => 'Model Ready';

  @override
  String get doNotCloseApp => 'Please do not close the app.';

  @override
  String get downloading => 'Downloading...';

  @override
  String get downloadModel => 'Download Model';

  @override
  String estimatedSize(String size) {
    return 'Estimated Size: ~$size MB';
  }

  @override
  String availableSpace(String space) {
    return 'Available Space: $space';
  }

  @override
  String get notEnoughSpace => 'Warning: Not enough space!';

  @override
  String get download => 'Download';

  @override
  String downloadError(String error) {
    return 'Download error: $error';
  }

  @override
  String get cancelled => 'Cancelled';

  @override
  String get deviceNotCompatibleTitle => 'Device Not Compatible';

  @override
  String get deviceNotMeetRequirements => 'Your device does not meet the requirements for On-Device transcription.';

  @override
  String get transcriptionSlowerOnDevice => 'On-device transcription may be slower on this device.';

  @override
  String get computationallyIntensive => 'On-Device transcription is computationally intensive.';

  @override
  String get batteryDrainSignificantly => 'Battery drain will increase significantly.';

  @override
  String get audioProcessedLocally => 'Audio is processed locally. Works offline, more private, but uses more battery.';

  @override
  String get languageLabel => 'Language';

  @override
  String get modelLabel => 'Model';

  @override
  String get modelTooLargeWarning =>
      'This model is large and may crash the app or run very slowly on mobile devices.\n\n\"small\" or \"base\" is recommended.';

  @override
  String get nativeEngineNoDownload => 'Your devices native speech engine will be used. No model download required.';

  @override
  String modelReadyWithName(String model) {
    return 'Model Ready ($model)';
  }

  @override
  String get reDownload => 'Re-download';

  @override
  String downloadingModelProgress(String model, String received, String total) {
    return 'Downloading $model: $received / $total MB';
  }

  @override
  String preparingModel(String model) {
    return 'Preparing $model...';
  }

  @override
  String downloadErrorWithMessage(String error) {
    return 'Download error: $error';
  }

  @override
  String estimatedSizeWithValue(String size) {
    return 'Estimated Size: ~$size MB';
  }

  @override
  String availableSpaceWithValue(String space) {
    return 'Available Space: $space';
  }

  @override
  String get omiTranscriptionOptimized =>
      'Tokis built-in live transcription is optimized for real-time conversations with automatic speaker detection and diarization.';

  @override
  String get reset => 'Reset';

  @override
  String get useTemplateFrom => 'Use template from';

  @override
  String get selectProviderTemplate => 'Select a provider template...';

  @override
  String get quicklyPopulateResponse => 'Quickly populate with a known providers response format';

  @override
  String get quicklyPopulateRequest => 'Quickly populate with a known providers request format';

  @override
  String get invalidJsonError => 'Invalid JSON';

  @override
  String downloadModelWithName(String model) {
    return 'Download Model ($model)';
  }

  @override
  String modelNameWithFile(String model) {
    return 'Model: $model';
  }

  @override
  String get device => 'Device';

  @override
  String get setupCompleted => 'Completed';

  @override
  String get setupQuestionsIntro => 'Help us improve Toki by answering a few questions.  🫶 💜';

  @override
  String get setupQuestionProfession => '1. What do you do?';

  @override
  String get setupQuestionUsage => '2. Where do you plan to use your Toki?';

  @override
  String get setupQuestionAge => '3. What\'s your age range?';

  @override
  String get setupAnswerAllQuestions => 'You haven\'t answered all the questions yet! 🥺';

  @override
  String get setupSkipHelp => 'Skip, I don\'t want to help :C';

  @override
  String get professionEntrepreneur => 'Entrepreneur';

  @override
  String get professionSoftwareEngineer => 'Software Engineer';

  @override
  String get professionProductManager => 'Product Manager';

  @override
  String get professionExecutive => 'Executive';

  @override
  String get professionSales => 'Sales';

  @override
  String get professionStudent => 'Student';

  @override
  String get usageAtWork => 'At work';

  @override
  String get usageIrlEvents => 'IRL Events';

  @override
  String get usageOnline => 'Online';

  @override
  String get usageSocialSettings => 'In Social Settings';

  @override
  String get usageEverywhere => 'Everywhere';

  @override
  String get customBackendUrlTitle => 'Custom Backend URL';

  @override
  String get backendUrlLabel => 'Backend URL';

  @override
  String get saveUrlButton => 'Save URL';

  @override
  String get enterBackendUrlError => 'Please enter the backend URL';

  @override
  String get urlMustEndWithSlashError => 'URL must end with \"/\"';

  @override
  String get invalidUrlError => 'Please enter a valid URL';

  @override
  String get backendUrlSavedSuccess => 'Backend URL saved successfully!';

  @override
  String get signInTitle => 'Sign In';

  @override
  String get signInButton => 'Sign In';

  @override
  String get enterEmailError => 'Please enter your email';

  @override
  String get invalidEmailError => 'Please enter a valid email';

  @override
  String get enterPasswordError => 'Please enter your password';

  @override
  String get passwordMinLengthError => 'Password must be at least 8 characters long';

  @override
  String get signInSuccess => 'Sign In Successful!';

  @override
  String get alreadyHaveAccountLogin => 'Already have an account? Log In';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get createAccountTitle => 'Create Account';

  @override
  String get nameLabel => 'Name';

  @override
  String get repeatPasswordLabel => 'Repeat Password';

  @override
  String get signUpButton => 'Sign Up';

  @override
  String get enterNameError => 'Please enter your name';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get signUpSuccess => 'Signup Successful!';

  @override
  String get loadingKnowledgeGraph => 'Loading Knowledge Graph...';

  @override
  String get noKnowledgeGraphYet => 'No knowledge graph yet';

  @override
  String get buildingKnowledgeGraphFromMemories => 'Building your knowledge graph from memories...';

  @override
  String get knowledgeGraphWillBuildAutomatically =>
      'Your knowledge graph will be built automatically as you create new memories.';

  @override
  String get buildGraphButton => 'Build Graph';

  @override
  String get checkOutMyMemoryGraph => 'Check out my memory graph!';

  @override
  String get send => 'Send';

  @override
  String get sharePublicLink => 'Share Public Link';

  @override
  String get makePersonaPublic => 'Make Persona Public';

  @override
  String get connectedKnowledgeData => 'Connected Knowledge Data';

  @override
  String get enterName => 'Enter name';

  @override
  String get disconnectTwitter => 'Disconnect Twitter';

  @override
  String get disconnectTwitterConfirmation =>
      'Are you sure you want to disconnect your Twitter account? Your persona will no longer have access to your Twitter data.';

  @override
  String get iHaveOmiDevice => 'I have Toki device';

  @override
  String get goal => 'GOAL';

  @override
  String get tapToTrackThisGoal => 'Tap to track this goal';

  @override
  String get tapToSetAGoal => 'Tap to set a goal';

  @override
  String get processedConversations => 'Processed Conversations';

  @override
  String get updatedConversations => 'Updated Conversations';

  @override
  String get newConversations => 'New Conversations';

  @override
  String get createCustomTemplate => 'Create Custom Template';

  @override
  String tagSpeaker(int speakerId) {
    return 'Tag Speaker $speakerId';
  }

  @override
  String get personNameAlreadyExists => 'A person with this name already exists.';

  @override
  String get selectYouFromList => 'To tag yourself, please select \"You\" from the list.';

  @override
  String get enterPersonsName => 'Enter Person\'s Name';

  @override
  String get addPerson => 'Add Person';

  @override
  String tagOtherSegmentsFromSpeaker(int selected, int total) {
    return 'Tag other segments from this speaker ($selected/$total)';
  }

  @override
  String get tagOtherSegments => 'Tag other segments';

  @override
  String get managePeople => 'Manage People';

  @override
  String get shareViaSms => 'Share via SMS';

  @override
  String get selectContactsToShareSummary => 'Select contacts to share your conversation summary';

  @override
  String get searchContactsHint => 'Search contacts...';

  @override
  String contactsSelectedCount(int count) {
    return '$count selected';
  }

  @override
  String get clearAllSelection => 'Clear all';

  @override
  String get selectContactsToShare => 'Select contacts to share';

  @override
  String shareWithContactCount(int count) {
    return 'Share with $count contact';
  }

  @override
  String shareWithContactsCount(int count) {
    return 'Share with $count contacts';
  }

  @override
  String get contactsPermissionRequired => 'Contacts permission required';

  @override
  String get contactsPermissionRequiredForSms => 'Contacts permission is required to share via SMS';

  @override
  String get grantContactsPermissionForSms => 'Please grant contacts permission to share via SMS';

  @override
  String get noContactsWithPhoneNumbers => 'No contacts with phone numbers found';

  @override
  String get noContactsMatchSearch => 'No contacts match your search';

  @override
  String get failedToLoadContacts => 'Failed to load contacts';

  @override
  String get failedToPrepareConversationForSharing => 'Failed to prepare conversation for sharing. Please try again.';

  @override
  String get couldNotOpenSmsApp => 'Could not open SMS app. Please try again.';

  @override
  String heresWhatWeDiscussed(String link) {
    return 'Here\'s what we just discussed: $link';
  }

  @override
  String get wifiSync => 'WiFi Sync';

  @override
  String itemCopiedToClipboard(String item) {
    return '$item copied to clipboard';
  }

  @override
  String get wifiConnectionFailedTitle => 'Connection Failed';

  @override
  String connectingToDeviceName(String deviceName) {
    return 'Connecting to $deviceName';
  }

  @override
  String enableDeviceWifi(String deviceName) {
    return 'Enable $deviceName\'s WiFi';
  }

  @override
  String connectToDeviceName(String deviceName) {
    return 'Connect to $deviceName';
  }

  @override
  String get recordingDetails => 'Recording Details';

  @override
  String get storageLocationSdCard => 'SD Card';

  @override
  String get storageLocationLimitlessPendant => 'Limitless Pendant';

  @override
  String get storageLocationPhone => 'Phone';

  @override
  String get storageLocationPhoneMemory => 'Phone (Memory)';

  @override
  String storedOnDevice(String deviceName) {
    return 'Stored on $deviceName';
  }

  @override
  String get transferring => 'Transferring...';

  @override
  String get transferRequired => 'Transfer Required';

  @override
  String get downloadingAudioFromSdCard => 'Downloading audio from your device\'s SD card';

  @override
  String get transferRequiredDescription =>
      'This recording is stored on your device\'s SD card. Transfer it to your phone to play or share.';

  @override
  String get cancelTransfer => 'Cancel Transfer';

  @override
  String get transferToPhone => 'Transfer to Phone';

  @override
  String get privateAndSecureOnDevice => 'Private & secure on your device';

  @override
  String get recordingInfo => 'Recording Info';

  @override
  String get transferInProgress => 'Transfer in progress...';

  @override
  String get shareRecording => 'Share Recording';

  @override
  String get deleteRecordingConfirmation =>
      'Are you sure you want to permanently delete this recording? This can\'t be undone.';

  @override
  String get recordingIdLabel => 'Recording ID';

  @override
  String get dateTimeLabel => 'Date & Time';

  @override
  String get durationLabel => 'Duration';

  @override
  String get audioFormatLabel => 'Audio Format';

  @override
  String get storageLocationLabel => 'Storage Location';

  @override
  String get estimatedSizeLabel => 'Estimated Size';

  @override
  String get deviceModelLabel => 'Device Model';

  @override
  String get deviceIdLabel => 'Device ID';

  @override
  String get statusLabel => 'Status';

  @override
  String get statusProcessed => 'Processed';

  @override
  String get statusUnprocessed => 'Unprocessed';

  @override
  String get switchedToFastTransfer => 'Switched to Fast Transfer';

  @override
  String get transferCompleteMessage => 'Transfer complete! You can now play this recording.';

  @override
  String transferFailedMessage(String error) {
    return 'Transfer failed: $error';
  }

  @override
  String get transferCancelled => 'Transfer cancelled';

  @override
  String get fastTransferEnabled => 'Fast Transfer enabled';

  @override
  String get bluetoothSyncEnabled => 'Bluetooth sync enabled';

  @override
  String get enableFastTransfer => 'Enable Fast Transfer';

  @override
  String get fastTransferDescription =>
      'Fast Transfer uses WiFi for ~5x faster speeds. Your phone will temporarily connect to your Toki device\'s WiFi network during transfer.';

  @override
  String get internetAccessPausedDuringTransfer => 'Internet access is paused during transfer';

  @override
  String get chooseTransferMethodDescription =>
      'Choose how recordings are transferred from your Toki device to your phone.';

  @override
  String get wifiSpeed => '~150 KB/s via WiFi';

  @override
  String get fiveTimesFaster => '5X FASTER';

  @override
  String get fastTransferMethodDescription =>
      'Creates a direct WiFi connection to your Toki device. Your phone temporarily disconnects from your regular WiFi during transfer.';

  @override
  String get bluetooth => 'Bluetooth';

  @override
  String get bleSpeed => '~30 KB/s via BLE';

  @override
  String get bluetoothMethodDescription =>
      'Uses standard Bluetooth Low Energy connection. Slower but doesn\'t affect your WiFi connection.';

  @override
  String get selected => 'Selected';

  @override
  String get selectOption => 'Select';

  @override
  String get lowBatteryAlertTitle => 'Low Battery Alert';

  @override
  String get lowBatteryAlertBody => 'Your device is running low on battery. Time for a recharge! 🔋';

  @override
  String get deviceDisconnectedNotificationTitle => 'Your Toki Device Disconnected';

  @override
  String get deviceDisconnectedNotificationBody => 'Please reconnect to continue using your Toki.';

  @override
  String get firmwareUpdateAvailable => 'Firmware Update Available';

  @override
  String firmwareUpdateAvailableDescription(String version) {
    return 'A new firmware update ($version) is available for your Toki device. Would you like to update now?';
  }

  @override
  String get later => 'Later';

  @override
  String get appDeletedSuccessfully => 'App deleted successfully';

  @override
  String get appDeleteFailed => 'Failed to delete app. Please try again later.';

  @override
  String get appVisibilityChangedSuccessfully =>
      'App visibility changed successfully. It may take a few minutes to reflect.';

  @override
  String get errorActivatingAppIntegration =>
      'Error activating the app. If this is an integration app, make sure the setup is completed.';

  @override
  String get errorUpdatingAppStatus => 'An error occurred while updating the app status.';

  @override
  String get calculatingETA => 'Calculating...';

  @override
  String aboutMinutesRemaining(int minutes) {
    return 'About $minutes minutes remaining';
  }

  @override
  String get aboutAMinuteRemaining => 'About a minute remaining';

  @override
  String get almostDone => 'Almost done...';

  @override
  String get omiSays => 'omi says';

  @override
  String get analyzingYourData => 'Analyzing your data...';

  @override
  String migratingToProtection(String level) {
    return 'Migrating to $level protection...';
  }

  @override
  String get noDataToMigrateFinalizing => 'No data to migrate. Finalizing...';

  @override
  String migratingItemsProgress(String itemType, int percentage) {
    return 'Migrating $itemType... $percentage%';
  }

  @override
  String get allObjectsMigratedFinalizing => 'All objects migrated. Finalizing...';

  @override
  String get migrationErrorOccurred => 'An error occurred during migration. Please try again.';

  @override
  String get migrationComplete => 'Migration complete!';

  @override
  String dataProtectedWithSettings(String level) {
    return 'Your data is now protected with the new $level settings.';
  }

  @override
  String get chatsLowercase => 'chats';

  @override
  String get dataLowercase => 'data';

  @override
  String get fallNotificationTitle => 'Ouch';

  @override
  String get fallNotificationBody => 'Did you fall?';

  @override
  String get importantConversationTitle => 'Important Conversation';

  @override
  String get importantConversationBody => 'You just had an important convo. Tap to share the summary with others.';

  @override
  String get templateName => 'Template Name';

  @override
  String get templateNameHint => 'e.g., Meeting Action Items Extractor';

  @override
  String get nameMustBeAtLeast3Characters => 'Name must be at least 3 characters';

  @override
  String get conversationPromptHint =>
      'e.g., Extract action items, decisions made, and key takeaways from the provided conversation.';

  @override
  String get pleaseEnterAppPrompt => 'Please enter a prompt for your app';

  @override
  String get promptMustBeAtLeast10Characters => 'Prompt must be at least 10 characters';

  @override
  String get anyoneCanDiscoverTemplate => 'Anyone can discover your template';

  @override
  String get onlyYouCanUseTemplate => 'Only you can use this template';

  @override
  String get generatingDescription => 'Generating description...';

  @override
  String get creatingAppIcon => 'Creating app icon...';

  @override
  String get installingApp => 'Installing app...';

  @override
  String get appCreatedAndInstalled => 'App created and installed!';

  @override
  String get appCreatedSuccessfully => 'App created successfully!';

  @override
  String get personaTwitterHandleNotFound => 'Twitter handle not found';

  @override
  String get personaTwitterHandleSuspended => 'Twitter handle is suspended';

  @override
  String get personaFailedToVerifyTwitter => 'Failed to verify Twitter handle';

  @override
  String get personaFailedToFetch => 'Failed to fetch your persona';

  @override
  String get personaFailedToCreate => 'Failed to create your persona';

  @override
  String get personaConnectKnowledgeSource => 'Please connect at least one knowledge data source (Toki or Twitter)';

  @override
  String get personaUpdatedSuccessfully => 'Persona updated successfully';

  @override
  String get personaFailedToUpdate => 'Failed to update persona';

  @override
  String get personaPleaseSelectImage => 'Please select an image';

  @override
  String get personaFailedToCreateTryLater => 'Failed to create your persona. Please try again later.';

  @override
  String personaFailedToCreateWithError(String error) {
    return 'Failed to create persona: $error';
  }

  @override
  String get personaFailedToEnable => 'Failed to enable persona';

  @override
  String personaErrorEnablingWithError(String error) {
    return 'Error enabling persona: $error';
  }

  @override
  String get paymentFailedToFetchCountries => 'Failed to fetch supported countries. Please try again later.';

  @override
  String get paymentFailedToSetDefault => 'Failed to set default payment method. Please try again later.';

  @override
  String get paymentFailedToSavePaypal => 'Failed to save PayPal details. Please try again later.';

  @override
  String get paypalEmailHint => 'nik@example.com';

  @override
  String get paypalMeLinkHint => 'paypal.me/nik';

  @override
  String get paymentMethodStripe => 'Stripe';

  @override
  String get paymentMethodPayPal => 'PayPal';

  @override
  String get paymentStatusActive => 'Active';

  @override
  String get paymentStatusConnected => 'Connected';

  @override
  String get paymentStatusNotConnected => 'Not Connected';

  @override
  String get paymentPlan => 'Payment Plan';

  @override
  String get xHandleTitle => 'What\'s your X handle?';

  @override
  String get xHandleDescription => 'We will pre-train your Toki clone\nbased on your account\'s activity';

  @override
  String get xHandleHint => '@nikshevchenko';

  @override
  String get xHandlePleaseEnter => 'Please enter your X handle';

  @override
  String get xHandlePleaseEnterValid => 'Please enter a valid X handle';

  @override
  String get nextButton => 'Next';

  @override
  String get connectOmiDevice => 'Connect Toki Device';

  @override
  String get transcriptionJsonPlaceholder => 'Paste your JSON configuration here...';

  @override
  String get transcriptionSourceOmi => 'Toki';

  @override
  String importErrorOpeningFilePicker(String message) {
    return 'Error opening file picker: $message';
  }

  @override
  String importErrorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get mergeConversationsSuccessTitle => 'Conversations Merged Successfully';

  @override
  String mergeConversationsSuccessBody(int count) {
    return '$count conversations have been merged successfully';
  }

  @override
  String get dailyReflectionNotificationTitle => 'Time for Daily Reflection';

  @override
  String get dailyReflectionNotificationBody => 'Tell me about your day';

  @override
  String get actionItemReminderTitle => 'Toki Reminder';

  @override
  String deviceDisconnectedTitle(String deviceName) {
    return '$deviceName Disconnected';
  }

  @override
  String deviceDisconnectedBody(String deviceName) {
    return 'Please reconnect to continue using your $deviceName.';
  }

  @override
  String get onboardingComplete => 'Complete';

  @override
  String get searchTranscriptOrSummary => 'Search transcript or summary...';

  @override
  String get myGoal => 'My goal';

  @override
  String get appNotAvailable => 'Oops! Looks like the app you are looking for is not available.';

  @override
  String get failedToConnectTodoist => 'Failed to connect to Todoist';

  @override
  String get failedToConnectAsana => 'Failed to connect to Asana';

  @override
  String get failedToConnectGoogleTasks => 'Failed to connect to Google Tasks';

  @override
  String get failedToConnectClickUp => 'Failed to connect to ClickUp';

  @override
  String failedToConnectServiceWithError(String serviceName, String error) {
    return 'Failed to connect to $serviceName: $error';
  }

  @override
  String get successfullyConnectedTodoist => 'Successfully connected to Todoist!';

  @override
  String get failedToConnectTodoistRetry => 'Failed to connect to Todoist. Please try again.';

  @override
  String get successfullyConnectedAsana => 'Successfully connected to Asana!';

  @override
  String get failedToConnectAsanaRetry => 'Failed to connect to Asana. Please try again.';

  @override
  String get successfullyConnectedGoogleTasks => 'Successfully connected to Google Tasks!';

  @override
  String get failedToConnectGoogleTasksRetry => 'Failed to connect to Google Tasks. Please try again.';

  @override
  String get successfullyConnectedClickUp => 'Successfully connected to ClickUp!';

  @override
  String get failedToConnectClickUpRetry => 'Failed to connect to ClickUp. Please try again.';

  @override
  String get successfullyConnectedGoogle => 'Successfully connected to Google!';

  @override
  String get failedToRefreshGoogleStatus => 'Failed to refresh Google connection status.';

  @override
  String get authFailedToSignInWithGoogle => 'Failed to sign in with Google, please try again.';

  @override
  String get authenticationFailed => 'Authentication failed. Please try again.';

  @override
  String get authFailedToSignInWithApple => 'Failed to sign in with Apple, please try again.';

  @override
  String get authFailedToRetrieveToken => 'Failed to retrieve firebase token, please try again.';

  @override
  String get authUnexpectedErrorFirebase => 'Unexpected error signing in, Firebase error, please try again.';

  @override
  String get authUnexpectedError => 'Unexpected error signing in, please try again';

  @override
  String get authFailedToLinkGoogle => 'Failed to link with Google, please try again.';

  @override
  String get authFailedToLinkApple => 'Failed to link with Apple, please try again.';

  @override
  String get onboardingBluetoothRequired => 'Bluetooth permission is required to connect to your device.';

  @override
  String get onboardingBluetoothDeniedSystemPrefs =>
      'Bluetooth permission denied. Please grant permission in System Preferences.';

  @override
  String onboardingBluetoothStatusCheckPrefs(String status) {
    return 'Bluetooth permission status: $status. Please check System Preferences.';
  }

  @override
  String onboardingFailedCheckBluetooth(String error) {
    return 'Failed to check Bluetooth permission: $error';
  }

  @override
  String get onboardingNotificationDeniedSystemPrefs =>
      'Notification permission denied. Please grant permission in System Preferences.';

  @override
  String get onboardingNotificationDeniedNotifications =>
      'Notification permission denied. Please grant permission in System Preferences > Notifications.';

  @override
  String onboardingNotificationStatusCheckPrefs(String status) {
    return 'Notification permission status: $status. Please check System Preferences.';
  }

  @override
  String onboardingFailedCheckNotification(String error) {
    return 'Failed to check Notification permission: $error';
  }

  @override
  String get onboardingLocationGrantInSettings =>
      'Please grant location permission in Settings > Privacy & Security > Location Services';

  @override
  String get onboardingMicrophoneRequired => 'Microphone permission is required for recording.';

  @override
  String get onboardingMicrophoneDenied =>
      'Microphone permission denied. Please grant permission in System Preferences > Privacy & Security > Microphone.';

  @override
  String onboardingMicrophoneStatusCheckPrefs(String status) {
    return 'Microphone permission status: $status. Please check System Preferences.';
  }

  @override
  String onboardingFailedCheckMicrophone(String error) {
    return 'Failed to check Microphone permission: $error';
  }

  @override
  String get onboardingScreenCaptureRequired => 'Screen capture permission is required for system audio recording.';

  @override
  String get onboardingScreenCaptureDenied =>
      'Screen capture permission denied. Please grant permission in System Preferences > Privacy & Security > Screen Recording.';

  @override
  String onboardingScreenCaptureStatusCheckPrefs(String status) {
    return 'Screen capture permission status: $status. Please check System Preferences.';
  }

  @override
  String onboardingFailedCheckScreenCapture(String error) {
    return 'Failed to check Screen Capture permission: $error';
  }

  @override
  String get onboardingAccessibilityRequired => 'Accessibility permission is required for detecting browser meetings.';

  @override
  String onboardingAccessibilityStatusCheckPrefs(String status) {
    return 'Accessibility permission status: $status. Please check System Preferences.';
  }

  @override
  String onboardingFailedCheckAccessibility(String error) {
    return 'Failed to check Accessibility permission: $error';
  }

  @override
  String get msgCameraNotAvailable => 'Camera capture is not available on this platform';

  @override
  String get msgCameraPermissionDenied => 'Camera permission denied. Please allow access to camera';

  @override
  String msgCameraAccessError(String error) {
    return 'Error accessing camera: $error';
  }

  @override
  String get msgPhotoError => 'Error taking photo. Please try again.';

  @override
  String get msgMaxImagesLimit => 'You can only select up to 4 images';

  @override
  String msgFilePickerError(String error) {
    return 'Error opening file picker: $error';
  }

  @override
  String msgSelectImagesError(String error) {
    return 'Error selecting images: $error';
  }

  @override
  String get msgPhotosPermissionDenied => 'Photos permission denied. Please allow access to photos to select images';

  @override
  String get msgSelectImagesGenericError => 'Error selecting images. Please try again.';

  @override
  String get msgMaxFilesLimit => 'You can only select up to 4 files';

  @override
  String msgSelectFilesError(String error) {
    return 'Error selecting files: $error';
  }

  @override
  String get msgSelectFilesGenericError => 'Error selecting files. Please try again.';

  @override
  String get msgUploadFileFailed => 'Failed to upload file, please try again later';

  @override
  String get msgReadingMemories => 'Reading your memories...';

  @override
  String get msgLearningMemories => 'Learning from your memories...';

  @override
  String get msgUploadAttachedFileFailed => 'Failed to upload the attached file.';

  @override
  String captureRecordingError(String error) {
    return 'An error occurred during recording: $error';
  }

  @override
  String captureRecordingStoppedDisplayIssue(String reason) {
    return 'Recording stopped: $reason. You may need to reconnect external displays or restart recording.';
  }

  @override
  String get captureMicrophonePermissionRequired => 'Microphone permission required';

  @override
  String get captureMicrophonePermissionInSystemPreferences => 'Grant microphone permission in System Preferences';

  @override
  String get captureScreenRecordingPermissionRequired => 'Screen recording permission required';

  @override
  String get captureDisplayDetectionFailed => 'Display detection failed. Recording stopped.';

  @override
  String get devModeInvalidAudioBytesWebhookUrl => 'Invalid audio bytes webhook URL';

  @override
  String get devModeInvalidRealtimeTranscriptWebhookUrl => 'Invalid realtime transcript webhook URL';

  @override
  String get devModeInvalidConversationCreatedWebhookUrl => 'Invalid conversation created webhook URL';

  @override
  String get devModeInvalidDaySummaryWebhookUrl => 'Invalid day summary webhook URL';

  @override
  String get devModeSettingsSaved => 'Settings saved!';

  @override
  String get voiceFailedToTranscribe => 'Failed to transcribe audio';

  @override
  String get locationPermissionRequired => 'Location Permission Required';

  @override
  String get locationPermissionContent =>
      'Fast Transfer requires location permission to verify WiFi connection. Please grant location permission to continue.';

  @override
  String get conversationNewIndicator => 'New 🚀';

  @override
  String conversationPhotosCount(int count) {
    return '$count photos';
  }

  @override
  String get mergingStatus => 'Merging...';

  @override
  String timeSecsSingular(int count) {
    return '$count sec';
  }

  @override
  String timeSecsPlural(int count) {
    return '$count secs';
  }

  @override
  String timeMinSingular(int count) {
    return '$count min';
  }

  @override
  String timeMinsPlural(int count) {
    return '$count mins';
  }

  @override
  String timeMinsAndSecs(int mins, int secs) {
    return '$mins mins $secs secs';
  }

  @override
  String timeHourSingular(int count) {
    return '$count hour';
  }

  @override
  String timeHoursPlural(int count) {
    return '$count hours';
  }

  @override
  String timeHoursAndMins(int hours, int mins) {
    return '$hours hours $mins mins';
  }

  @override
  String timeDaySingular(int count) {
    return '$count day';
  }

  @override
  String timeDaysPlural(int count) {
    return '$count days';
  }

  @override
  String timeDaysAndHours(int days, int hours) {
    return '$days days $hours hours';
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
  String get moveToFolder => 'Move to Folder';

  @override
  String get noFoldersAvailable => 'No folders available';

  @override
  String get newFolder => 'New Folder';

  @override
  String get color => 'Color';

  @override
  String get waitingForDevice => 'Waiting for device...';

  @override
  String get saySomething => 'Say something...';

  @override
  String get initialisingSystemAudio => 'Initialising System Audio';

  @override
  String get stopRecording => 'Stop Recording';

  @override
  String get continueRecording => 'Continue Recording';

  @override
  String get initialisingRecorder => 'Initialising Recorder';

  @override
  String get pauseRecording => 'Pause Recording';

  @override
  String get resumeRecording => 'Resume Recording';

  @override
  String get noDailyRecapsYet => 'No daily recaps yet';

  @override
  String get dailyRecapsDescription => 'Your daily recaps will appear here once generated';

  @override
  String get chooseTransferMethod => 'Choose Transfer Method';

  @override
  String get fastTransferSpeed => '~150 KB/s via WiFi';

  @override
  String largeTimeGapDetected(String gap) {
    return 'Large time gap detected ($gap)';
  }

  @override
  String largeTimeGapsDetected(String gaps) {
    return 'Large time gaps detected ($gaps)';
  }

  @override
  String get deviceDoesNotSupportWifiSwitchingToBle => 'Device does not support WiFi sync, switching to Bluetooth';

  @override
  String get appleHealthNotAvailable => 'Apple Health is not available on this device';

  @override
  String get audioDownloadFailed => 'Failed to download audio';

  @override
  String get downloadingAudio => 'Downloading audio...';

  @override
  String get shareAudio => 'Share Audio';

  @override
  String get preparingAudio => 'Preparing Audio';

  @override
  String get downloadingAudioProgress => 'Downloading Audio';

  @override
  String get processingAudio => 'Processing Audio';

  @override
  String get audioReady => 'Audio Ready';

  @override
  String get audioShareFailed => 'Share Failed';

  @override
  String get dailyRecaps => 'Daily Recaps';

  @override
  String get removeFilter => 'Remove Filter';

  @override
  String get categoryConversationAnalysis => 'Conversation Analysis';

  @override
  String get categoryPersonalityClone => 'Personality Clone';

  @override
  String get categoryHealth => 'Health';

  @override
  String get categoryEducation => 'Education';

  @override
  String get categoryCommunication => 'Communication';

  @override
  String get categoryEmotionalSupport => 'Emotional Support';

  @override
  String get categoryProductivity => 'Productivity';

  @override
  String get categoryEntertainment => 'Entertainment';

  @override
  String get categoryFinancial => 'Financial';

  @override
  String get categoryTravel => 'Travel';

  @override
  String get categorySafety => 'Safety';

  @override
  String get categoryShopping => 'Shopping';

  @override
  String get categorySocial => 'Social';

  @override
  String get categoryNews => 'News';

  @override
  String get categoryUtilities => 'Utilities';

  @override
  String get categoryOther => 'Other';

  @override
  String get capabilityChat => 'Chat';

  @override
  String get capabilityConversations => 'Conversations';

  @override
  String get capabilityExternalIntegration => 'External Integration';

  @override
  String get capabilityNotification => 'Notification';

  @override
  String get triggerAudioBytes => 'Audio Bytes';

  @override
  String get triggerConversationCreation => 'Conversation Creation';

  @override
  String get triggerTranscriptProcessed => 'Transcript Processed';

  @override
  String get actionCreateConversations => 'Create conversations';

  @override
  String get actionCreateMemories => 'Create memories';

  @override
  String get actionReadConversations => 'Read conversations';

  @override
  String get actionReadMemories => 'Read memories';

  @override
  String get actionReadTasks => 'Read tasks';

  @override
  String get scopeUserName => 'User Name';

  @override
  String get scopeUserFacts => 'User Facts';

  @override
  String get scopeUserConversations => 'User Conversations';

  @override
  String get scopeUserChat => 'User Chat';

  @override
  String get capabilityFeatured => 'Featured';

  @override
  String get capabilityTasks => 'Tasks';

  @override
  String get capabilityIntegrations => 'Integrations';

  @override
  String get categoryPersonalityClones => 'Personality Clones';

  @override
  String get categoryProductivityLifestyle => 'Productivity & Lifestyle';

  @override
  String get categorySocialEntertainment => 'Social & Entertainment';

  @override
  String get categoryProductivityTools => 'Productivity & Tools';

  @override
  String get categoryPersonalWellness => 'Personal & Lifestyle';

  @override
  String get rating => 'Rating';

  @override
  String get categories => 'Categories';

  @override
  String get newTask => 'New Task';

  @override
  String get viewAll => 'View All';

  @override
  String get addTask => 'Add Task';

  @override
  String get mcpServerUrl => 'MCP Server URL';

  @override
  String get whereDidYouHearAboutOmi => 'How did you find us?';

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
  String get friendWordOfMouth => 'Friend';

  @override
  String get otherSource => 'Other';

  @override
  String get pleaseSpecify => 'Please specify';

  @override
  String get event => 'Event';

  @override
  String get coworker => 'Coworker';

  @override
  String get linkedIn => 'LinkedIn';

  @override
  String get googleSearch => 'Google Search';

  @override
  String get audioPlaybackUnavailable => 'Audio file is not available for playback';

  @override
  String get audioPlaybackFailed => 'Unable to play audio. The file may be corrupted or missing.';

  @override
  String get connectionGuide => 'Connection Guide';

  @override
  String get iveDoneThis => 'I\'ve done this';

  @override
  String get reportAnIssue => 'Report an issue';

  @override
  String get pairingTitleOmi => 'Turn On Toki';

  @override
  String get pairingDescOmi => 'Press and hold the device until it vibrates to turn it on.';

  @override
  String get pairingTitleOmiDevkit => 'Put Toki DevKit in Pairing Mode';

  @override
  String get pairingDescOmiDevkit =>
      'Press the button once to turn on. The LED will blink purple when in pairing mode.';

  @override
  String get pairingTitleOmiGlass => 'Turn On Toki Glass';

  @override
  String get pairingDescOmiGlass => 'Power on by pressing the side button for 3 seconds.';

  @override
  String get pairingTitlePlaudNote => 'Put Plaud Note in Pairing Mode';

  @override
  String get pairingDescPlaudNote =>
      'Press and hold the side button for 2 seconds. The red LED will blink when ready to pair.';

  @override
  String get pairingTitleBee => 'Put Bee in Pairing Mode';

  @override
  String get pairingDescBee => 'Press the button 5 times continuously. The light will start blinking blue and green.';

  @override
  String get pairingTitleLimitless => 'Put Limitless in Pairing Mode';

  @override
  String get pairingDescLimitless =>
      'When any light is visible, press once and then press and hold until the device shows a pink light, then release.';

  @override
  String get pairingTitleFriendPendant => 'Put Friend Pendant in Pairing Mode';

  @override
  String get pairingDescFriendPendant =>
      'Press the button on the pendant to turn it on. It will enter pairing mode automatically.';

  @override
  String get pairingTitleFieldy => 'Put Fieldy in Pairing Mode';

  @override
  String get pairingDescFieldy => 'Press and hold the device until the light appears to turn it on.';

  @override
  String get pairingTitleAppleWatch => 'Connect Apple Watch';

  @override
  String get pairingDescAppleWatch => 'Install and open the Toki app on your Apple Watch, then tap Connect in the app.';

  @override
  String get pairingTitleNeoOne => 'Put Neo One in Pairing Mode';

  @override
  String get pairingDescNeoOne =>
      'Press and hold the power button until the LED blinks. The device will be discoverable.';

  @override
  String get downloadingFromDevice => 'Downloading from device';

  @override
  String get reconnectingToInternet => 'Reconnecting to internet...';

  @override
  String uploadingToCloud(int current, int total) {
    return 'Uploading $current of $total';
  }

  @override
  String get corruptedStatus => 'Corrupted';

  @override
  String get synced => 'Synced';

  @override
  String get noPendingRecordings => 'No pending recordings';

  @override
  String get noProcessedRecordings => 'No processed recordings yet';

  @override
  String get pending => 'Pending';

  @override
  String get addToYourTaskList => 'Add to your task list?';

  @override
  String get failedToCreateShareLink => 'Failed to create share link';

  @override
  String get deleteGoal => 'Delete Goal';

  @override
  String get deviceUpToDate => 'Your device is up to date';

  @override
  String get wifiConfiguration => 'WiFi Configuration';

  @override
  String get wifiConfigurationSubtitle => 'Enter your WiFi credentials to allow the device to download the firmware.';

  @override
  String get networkNameSsid => 'Network Name (SSID)';

  @override
  String get enterWifiNetworkName => 'Enter WiFi network name';

  @override
  String get enterWifiPassword => 'Enter WiFi password';

  @override
  String get onboardingWhatIKnowAboutYouTitle => 'Here is what I know about you';

  @override
  String get onboardingWhatIKnowAboutYouDescription => 'This map updates as Toki learns from your conversations.';

  @override
  String get apiEnvironment => 'API Environment';

  @override
  String get apiEnvironmentDescription => 'Choose which backend to connect to';

  @override
  String get production => 'Production';

  @override
  String get staging => 'Staging';

  @override
  String get switchRequiresRestart => 'Switching requires app restart';

  @override
  String get switchApiConfirmTitle => 'Switch API Environment';

  @override
  String switchApiConfirmBody(String environment) {
    return 'Switch to $environment? You will need to close and reopen the app for changes to take effect.';
  }

  @override
  String get switchAndRestart => 'Switch';

  @override
  String get stagingDisclaimer =>
      'Staging may be buggy, have inconsistent performance, and data might be lost. Use for testing only.';

  @override
  String get apiEnvSavedRestartRequired => 'Saved. Close and reopen the app to apply.';

  @override
  String get shared => 'Shared';

  @override
  String get onlyYouCanSeeConversation => 'Only you can see this conversation';

  @override
  String get anyoneWithLinkCanView => 'Anyone with the link can view';

  @override
  String get tasksCleanTodayTitle => 'Clean today\'s tasks?';

  @override
  String get tasksCleanTodayMessage => 'This will only remove deadlines';

  @override
  String get tasksOverdue => 'Overdue';

  @override
  String get showDailyScoreOnHomepage => 'Show Daily Score on homepage';

  @override
  String get showTasksOnHomepage => 'Show Tasks on homepage';

  @override
  String get deleteSynced => 'Delete Synced';

  @override
  String get deleteSyncedFiles => 'Delete Synced Recordings';

  @override
  String get deleteSyncedFilesMessage =>
      'These recordings have already been synced to your phone. This cannot be undone.';

  @override
  String get syncedFilesDeleted => 'Synced recordings deleted';

  @override
  String get deletePending => 'Delete Pending';

  @override
  String get deletePendingFiles => 'Delete Pending Recordings';

  @override
  String get deletePendingFilesWarning =>
      'These recordings have NOT been synced to your phone and will be permanently lost. This cannot be undone.';

  @override
  String get pendingFilesDeleted => 'Pending recordings deleted';

  @override
  String get deleteAllFiles => 'Delete All Recordings';

  @override
  String get deleteAll => 'Delete All';

  @override
  String get deleteAllFilesWarning =>
      'This will delete both synced and pending recordings. Pending recordings have NOT been synced and will be permanently lost. This cannot be undone.';

  @override
  String get allFilesDeleted => 'All recordings deleted';

  @override
  String get manageStorage => 'Manage Storage';

  @override
  String get safelyBackedUp => 'Safely backed up to your phone';

  @override
  String get notYetSynced => 'Not yet synced to your phone';

  @override
  String get clearAll => 'Clear All';

  @override
  String get fairUsePolicy => 'Fair Use';

  @override
  String get fairUseLoadError => 'Unable to load fair use status. Please try again.';

  @override
  String get fairUseStageWarning => 'Warning';

  @override
  String get fairUseStageThrottle => 'Throttled';

  @override
  String get fairUseStageRestrict => 'Restricted';

  @override
  String get fairUseSpeechUsage => 'Speech Usage';

  @override
  String get fairUseToday => 'Today';

  @override
  String get fairUse3Day => '3-Day Rolling';

  @override
  String get fairUseWeekly => 'Weekly Rolling';

  @override
  String get fairUseAboutTitle => 'About Fair Use';

  @override
  String get fairUseAboutBody =>
      'Toki is designed for personal conversations, meetings, and live interactions. Usage is measured by real speech time detected, not connection time. If usage significantly exceeds normal patterns for non-personal content, adjustments may apply.';

  @override
  String fairUseCaseRefCopied(String caseRef) {
    return '$caseRef copied';
  }

  @override
  String get fairUseDailyTranscription => 'Daily Transcription';

  @override
  String fairUseBudgetUsed(String used, String limit) {
    return '${used}m / ${limit}m';
  }

  @override
  String get fairUseBudgetExhausted => 'Daily transcription limit reached';

  @override
  String fairUseBudgetResetsAt(String time) {
    return 'Resets $time';
  }

  @override
  String get transcriptionPaused => 'Recording, reconnecting';

  @override
  String get transcriptionPausedReconnecting => 'Still recording — reconnecting to transcription...';

  @override
  String get improveConnectionTitle => 'Improve Connection';

  @override
  String get improveConnectionContent =>
      'We\'ve improved how Toki stays connected to your device. To activate this, please go to the Device Info page, tap \"Disconnect Device\", and then pair your device again.';

  @override
  String get improveConnectionAction => 'Got it';

  @override
  String clockSkewWarning(int minutes) {
    return 'Your device clock is off by ~$minutes min. Check your date & time settings.';
  }

  @override
  String get cloudTranscriptionPoweredByDeepgram => 'Cloud transcription powered by Deepgram.';

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
  String get usageStatistics => 'Usage Statistics';

  @override
  String get transcriptionTime => 'Transcription Time';

  @override
  String get wordsTranscribed => 'Words Transcribed';

  @override
  String get insightsGained => 'Insights Gained';

  @override
  String get memoriesCreated => 'Memories Created';

  @override
  String get noDataYet => 'No data yet';
}
