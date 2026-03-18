import 'dart:convert';

import 'package:http/http.dart' as http;



Future<double> getDurationOSRM({
  required double startLat,
  required double startLng,
  required double endLat,
  required double endLng,
}) async {

  String url =
      "https://router.project-osrm.org/route/v1/driving/"
      "$startLng,$startLat;$endLng,$endLat"
      "?overview=false";

  final response = await http.get(Uri.parse(url));
  final data = jsonDecode(response.body);

  double duration = data["routes"][0]["duration"]; // بالثواني

  return duration;
}