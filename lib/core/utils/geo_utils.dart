import 'dart:math';

/// Haversine formula to compute distance between two lat/lng points in kilometers.
class GeoUtils {
  static const double _earthRadiusKm = 6371.0;

  /// Computes the great-circle distance between two points in km.
  static double haversineDistance(
    double lat1, double lon1,
    double lat2, double lon2,
  ) {
    final double dLat = _toRadians(lat2 - lat1);
    final double dLon = _toRadians(lon2 - lon1);

    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) * cos(_toRadians(lat2)) *
        sin(dLon / 2) * sin(dLon / 2);

    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return _earthRadiusKm * c;
  }

  static double _toRadians(double degrees) => degrees * pi / 180.0;

  /// Generates a geohash string from lat/lng with specified precision.
  /// This is a simplified geohash encoder — geoflutterfire_plus handles the
  /// actual Firestore geohash queries, but we need this to store geohashes
  /// alongside GeoPoints in documents.
  static String encodeGeohash(double latitude, double longitude, {int precision = 9}) {
    const String base32 = '0123456789bcdefghjkmnpqrstuvwxyz';
    double minLat = -90.0, maxLat = 90.0;
    double minLon = -180.0, maxLon = 180.0;
    bool isEven = true;
    int bit = 0;
    int ch = 0;
    final StringBuffer geohash = StringBuffer();

    while (geohash.length < precision) {
      if (isEven) {
        final double mid = (minLon + maxLon) / 2;
        if (longitude > mid) {
          ch |= (1 << (4 - bit));
          minLon = mid;
        } else {
          maxLon = mid;
        }
      } else {
        final double mid = (minLat + maxLat) / 2;
        if (latitude > mid) {
          ch |= (1 << (4 - bit));
          minLat = mid;
        } else {
          maxLat = mid;
        }
      }
      isEven = !isEven;
      if (bit < 4) {
        bit++;
      } else {
        geohash.write(base32[ch]);
        bit = 0;
        ch = 0;
      }
    }
    return geohash.toString();
  }
}
