import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// The name of the application
  ///
  /// In en, this message translates to:
  /// **'RecycleLink'**
  String get appName;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBack;

  /// No description provided for @generatorDashboard.
  ///
  /// In en, this message translates to:
  /// **'Generator Dashboard'**
  String get generatorDashboard;

  /// No description provided for @companyDashboard.
  ///
  /// In en, this message translates to:
  /// **'Company Dashboard'**
  String get companyDashboard;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @myOffers.
  ///
  /// In en, this message translates to:
  /// **'My Offers'**
  String get myOffers;

  /// No description provided for @newOffer.
  ///
  /// In en, this message translates to:
  /// **'New Offer'**
  String get newOffer;

  /// No description provided for @postOffer.
  ///
  /// In en, this message translates to:
  /// **'Post Offer & Find Matches'**
  String get postOffer;

  /// No description provided for @wasteCategory.
  ///
  /// In en, this message translates to:
  /// **'Waste Category'**
  String get wasteCategory;

  /// No description provided for @estimatedWeight.
  ///
  /// In en, this message translates to:
  /// **'Estimated Weight (kg)'**
  String get estimatedWeight;

  /// No description provided for @canDeliverMyself.
  ///
  /// In en, this message translates to:
  /// **'I can deliver it myself'**
  String get canDeliverMyself;

  /// No description provided for @needsPickup.
  ///
  /// In en, this message translates to:
  /// **'Needs company pickup'**
  String get needsPickup;

  /// No description provided for @preferredPickupWindow.
  ///
  /// In en, this message translates to:
  /// **'Preferred Pickup Window'**
  String get preferredPickupWindow;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @until.
  ///
  /// In en, this message translates to:
  /// **'Until'**
  String get until;

  /// No description provided for @photos.
  ///
  /// In en, this message translates to:
  /// **'Photos (optional, max 3)'**
  String get photos;

  /// No description provided for @companies.
  ///
  /// In en, this message translates to:
  /// **'Companies'**
  String get companies;

  /// No description provided for @browseCompanies.
  ///
  /// In en, this message translates to:
  /// **'Browse Companies'**
  String get browseCompanies;

  /// No description provided for @searchCompanies.
  ///
  /// In en, this message translates to:
  /// **'Search companies…'**
  String get searchCompanies;

  /// No description provided for @filterCompanies.
  ///
  /// In en, this message translates to:
  /// **'Filter Companies'**
  String get filterCompanies;

  /// No description provided for @maxRadius.
  ///
  /// In en, this message translates to:
  /// **'Max Radius'**
  String get maxRadius;

  /// No description provided for @requiresDriver.
  ///
  /// In en, this message translates to:
  /// **'Requires Driver (company picks up)'**
  String get requiresDriver;

  /// No description provided for @sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get sortBy;

  /// No description provided for @distance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get distance;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @matchScore.
  ///
  /// In en, this message translates to:
  /// **'Match Score'**
  String get matchScore;

  /// No description provided for @pendingMatches.
  ///
  /// In en, this message translates to:
  /// **'Pending Matches'**
  String get pendingMatches;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @decline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get decline;

  /// No description provided for @matchAccepted.
  ///
  /// In en, this message translates to:
  /// **'Match accepted!'**
  String get matchAccepted;

  /// No description provided for @matchDeclined.
  ///
  /// In en, this message translates to:
  /// **'Match declined.'**
  String get matchDeclined;

  /// No description provided for @communityImpact.
  ///
  /// In en, this message translates to:
  /// **'Community Impact'**
  String get communityImpact;

  /// No description provided for @kgRecycled.
  ///
  /// In en, this message translates to:
  /// **'kg Recycled'**
  String get kgRecycled;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @co2Offset.
  ///
  /// In en, this message translates to:
  /// **'Estimated CO₂ Offset'**
  String get co2Offset;

  /// No description provided for @byMaterialType.
  ///
  /// In en, this message translates to:
  /// **'By Material Type'**
  String get byMaterialType;

  /// No description provided for @weightConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirm Weight'**
  String get weightConfirmation;

  /// No description provided for @agreedWeight.
  ///
  /// In en, this message translates to:
  /// **'Agreed Weight (kg)'**
  String get agreedWeight;

  /// No description provided for @yourMeasuredWeight.
  ///
  /// In en, this message translates to:
  /// **'Your Measured Weight'**
  String get yourMeasuredWeight;

  /// No description provided for @enterActualWeight.
  ///
  /// In en, this message translates to:
  /// **'Enter actual weight (kg)'**
  String get enterActualWeight;

  /// No description provided for @submitWeight.
  ///
  /// In en, this message translates to:
  /// **'Submit Weight'**
  String get submitWeight;

  /// No description provided for @withinTolerance.
  ///
  /// In en, this message translates to:
  /// **'Within 15% tolerance — transaction will be confirmed.'**
  String get withinTolerance;

  /// No description provided for @outsideTolerance.
  ///
  /// In en, this message translates to:
  /// **'Outside 15% tolerance — transaction will be disputed.'**
  String get outsideTolerance;

  /// No description provided for @transactionConfirmed.
  ///
  /// In en, this message translates to:
  /// **'✅ Transaction confirmed! Weight accepted.'**
  String get transactionConfirmed;

  /// No description provided for @transactionDisputed.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Weight mismatch — transaction disputed.'**
  String get transactionDisputed;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @matched.
  ///
  /// In en, this message translates to:
  /// **'Matched'**
  String get matched;

  /// No description provided for @scheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get scheduled;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @disputed.
  ///
  /// In en, this message translates to:
  /// **'Disputed'**
  String get disputed;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @plasticPet.
  ///
  /// In en, this message translates to:
  /// **'PET Plastic (Bottles)'**
  String get plasticPet;

  /// No description provided for @plasticOther.
  ///
  /// In en, this message translates to:
  /// **'Other Plastic'**
  String get plasticOther;

  /// No description provided for @aluminumCans.
  ///
  /// In en, this message translates to:
  /// **'Aluminum Cans'**
  String get aluminumCans;

  /// No description provided for @glass.
  ///
  /// In en, this message translates to:
  /// **'Glass'**
  String get glass;

  /// No description provided for @paperCardboard.
  ///
  /// In en, this message translates to:
  /// **'Paper & Cardboard'**
  String get paperCardboard;

  /// No description provided for @organicCompostable.
  ///
  /// In en, this message translates to:
  /// **'Organic / Compostable'**
  String get organicCompostable;

  /// No description provided for @eWaste.
  ///
  /// In en, this message translates to:
  /// **'E-Waste (Electronics)'**
  String get eWaste;

  /// No description provided for @metalScrap.
  ///
  /// In en, this message translates to:
  /// **'Metal Scrap'**
  String get metalScrap;

  /// No description provided for @textile.
  ///
  /// In en, this message translates to:
  /// **'Textile'**
  String get textile;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
