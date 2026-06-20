import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/fraud_flag_model.dart';
import '../config/app_config.dart';

class FraudDetectionService {
  static final _fs = FirebaseFirestore.instance;

  /// Flags an offer if the weight is suspiciously high.
  static Future<void> checkOfferQuantity({
    required String offerId,
    required double weightKg,
    required String generatorId,
  }) async {
    if (weightKg > 2000) {
      // 2000 kg is very high for a normal generator. Flag it.
      await _flag(
        targetType: 'offer',
        targetId: offerId,
        reason: 'Suspiciously high quantity: $weightKg kg',
        signalScore: 0.8,
      );
    }
  }

  /// Flags a transaction if the weight deviation is extreme.
  static Future<void> checkWeightDeviation({
    required String transactionId,
    required double agreedWeight,
    required double actualWeight,
    required String submitterId,
  }) async {
    final diff = (agreedWeight - actualWeight).abs();
    final avg = (agreedWeight + actualWeight) / 2;
    final percentDeviation = diff / avg;

    if (percentDeviation > 0.40) {
      // Over 40% deviation is highly suspicious.
      await _flag(
        targetType: 'transaction',
        targetId: transactionId,
        reason: 'Extreme weight deviation: ${(percentDeviation * 100).toStringAsFixed(1)}%',
        signalScore: 0.9,
      );
    }
  }

  static Future<void> _flag({
    required String targetType,
    required String targetId,
    required String reason,
    required double signalScore,
  }) async {
    final ref = _fs.collection(AppConfig.fraudFlagsCollection).doc();
    final flag = FraudFlagModel(
      id: ref.id,
      targetType: targetType,
      targetId: targetId,
      reason: reason,
      signalScore: signalScore,
    );
    await ref.set(flag.toJson());
  }
}
