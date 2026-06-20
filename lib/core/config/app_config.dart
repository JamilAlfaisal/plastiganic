class AppConfig {
  // ─── Cloudinary ─────────────────────────────────────────────────────────────
  // Replace with your actual Cloudinary Cloud Name and Upload Preset.
  static const String cloudinaryCloudName = 'recyclelink-free';
  static const String cloudinaryUploadPreset = 'recyclelink_unsigned';
  static const String cloudinaryUrl =
      'https://api.cloudinary.com/v1_1/$cloudinaryCloudName/image/upload';

  // ─── Firestore Collection Names ─────────────────────────────────────────────
  static const String usersCollection = 'users';
  static const String generatorProfilesCollection = 'generatorProfiles';
  static const String companyProfilesCollection = 'companyProfiles';
  static const String wasteOffersCollection = 'wasteOffers';
  static const String matchesCollection = 'matches';
  static const String transactionsCollection = 'transactions';
  static const String disputesCollection = 'disputes';
  static const String fraudFlagsCollection = 'fraudFlags';
  static const String communityStatsCollection = 'communityStats';
  static const String pickupBatchesCollection = 'pickupBatches';

  // ─── Matching ───────────────────────────────────────────────────────────────
  /// Default geo search radius in km for company discovery.
  static const double searchRadiusKm = 30.0;

  /// Default average market price per kg (LBP) used when company has no price set.
  static const double defaultAvgMarketPricePerKg = 5000.0;

  /// Maximum matches written per offer.
  static const int maxMatchesPerOffer = 5;

  // ─── Exchange Rate ──────────────────────────────────────────────────────────
  /// Fallback USD→LBP rate; override from Firestore /config/exchangeRate in production.
  static const double fallbackExchangeRate = 90000.0;

  // ─── Matching Weights ──────────────────────────────────────────────────────
  /// Fallback weights used if /config/matchingWeights is not set in Firestore.
  static const Map<String, double> fallbackMatchingWeights = {
    'distance': 0.40,
    'price': 0.30,
    'driver': 0.15,
    'category': 0.15,
  };

  // ─── Waste Taxonomy ─────────────────────────────────────────────────────────
  static const List<String> wasteCategories = [
    'plastic_pet',
    'plastic_other',
    'aluminum_cans',
    'glass',
    'paper_cardboard',
    'organic_compostable',
    'e_waste',
    'metal_scrap',
    'textile',
    'other',
  ];

  static const Map<String, String> wasteCategoryLabels = {
    'plastic_pet': 'PET Plastic (Bottles)',
    'plastic_other': 'Other Plastic',
    'aluminum_cans': 'Aluminum Cans',
    'glass': 'Glass',
    'paper_cardboard': 'Paper & Cardboard',
    'organic_compostable': 'Organic / Compostable',
    'e_waste': 'E-Waste (Electronics)',
    'metal_scrap': 'Metal Scrap',
    'textile': 'Textile',
    'other': 'Other',
  };
}
