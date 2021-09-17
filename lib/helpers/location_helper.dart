import 'dart:convert';

import 'package:http/http.dart' as http;

const String googleApiKey = 'AIzaSyCyk5SQRuwXUXFIzhnPKyQc5WcUwQ6-Dmk';

class LocationHelper {
  static String locationPreviewImage({double? latitude, double? longitude}) {
    return "https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude,NY&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$googleApiKey";
  }

  static Future<String> getPlaceAddress(
      double latitude, double longitude) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$googleApiKey');
    try {
      final response = await http.get(url);
      return json.decode(response.body)['results'][0]['formatted_address'];
    } catch (e) {
      rethrow;
    }
  }
}
