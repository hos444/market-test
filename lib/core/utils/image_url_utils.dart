import '../constants/api_endpoints.dart';

class ImageUrlUtils {
  static String getFullUrl(String? path) {
    if (path == null || path.isEmpty) {
      return 'http://error.invalid';
    }
    
    // If it's already a full URL, return it
    if (path.startsWith('http')) {
      return path;
    }

    // Otherwise, construct it using the base URL
    final cleanPath = path.startsWith('/') ? path.substring(1) : path;
    final base = ApiEndpoints.baseUrl.replaceFirst('/api/v1', '');
    
    // Images are now served directly from the public folder
    return '$base/$cleanPath';
  }
}
