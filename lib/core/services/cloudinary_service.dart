import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';

/// Service for uploading images to Cloudinary using unsigned upload presets.
/// No server-side signing needed — the upload preset must be configured as
/// "unsigned" on the Cloudinary dashboard with strict settings:
///   - Max file size: 5MB
///   - Allowed formats: jpg, jpeg, png, webp
///   - No raw/video uploads
class CloudinaryService {
  /// Uploads image bytes to Cloudinary and returns the secure URL.
  /// Returns null if the upload fails.
  static Future<String?> uploadImage(Uint8List imageBytes, {String? fileName}) async {
    try {
      final Uri uri = Uri.parse(AppConfig.cloudinaryUrl);
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);

      request.fields['upload_preset'] = AppConfig.cloudinaryUploadPreset;

      final http.MultipartFile file = http.MultipartFile.fromBytes(
        'file',
        imageBytes,
        filename: fileName ?? 'upload_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
      request.files.add(file);

      final http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final String responseBody = await response.stream.bytesToString();
        final Map<String, dynamic> jsonResponse =
            json.decode(responseBody) as Map<String, dynamic>;
        return jsonResponse['secure_url'] as String?;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
