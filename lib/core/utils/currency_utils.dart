import 'package:intl/intl.dart';

/// Utility for formatting and converting between LBP and USD currencies.
class CurrencyUtils {
  /// Format a numeric amount as a currency string.
  static String format(double amount, String currency) {
    if (currency == 'LBP') {
      final NumberFormat formatter = NumberFormat('#,###', 'en_US');
      return '${formatter.format(amount.round())} LBP';
    } else {
      final NumberFormat formatter = NumberFormat('#,##0.00', 'en_US');
      return '\$${formatter.format(amount)}';
    }
  }

  /// Convert USD to LBP using the provided exchange rate.
  static double usdToLbp(double usdAmount, double exchangeRate) {
    return usdAmount * exchangeRate;
  }

  /// Convert LBP to USD using the provided exchange rate.
  static double lbpToUsd(double lbpAmount, double exchangeRate) {
    if (exchangeRate == 0) return 0;
    return lbpAmount / exchangeRate;
  }

  /// Returns a dual-currency display string: "$2.50 / 225,000 LBP"
  static String dualDisplay(double amount, String baseCurrency, double exchangeRate) {
    if (baseCurrency == 'USD') {
      final String usd = format(amount, 'USD');
      final String lbp = format(usdToLbp(amount, exchangeRate), 'LBP');
      return '$usd / $lbp';
    } else {
      final String lbp = format(amount, 'LBP');
      final String usd = format(lbpToUsd(amount, exchangeRate), 'USD');
      return '$lbp / $usd';
    }
  }
}
