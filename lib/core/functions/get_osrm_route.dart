import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';


Future<Set<Polyline>> getRouteOSRM({
  required double startLat,
  required double startLng,
  required double endLat,
  required double endLng,
}) async {

  String url =
      "https://router.project-osrm.org/route/v1/driving/"
      "$startLng,$startLat;$endLng,$endLat"
      "?overview=full&geometries=geojson";

  final response = await http.get(Uri.parse(url));

  final data = jsonDecode(response.body);

  List coords = data["routes"][0]["geometry"]["coordinates"];

  List<LatLng> points = coords
      .map((e) => LatLng(e[1], e[0]))
      .toList();

  Polyline polyline = Polyline(
    polylineId: const PolylineId("route"),
    color: const Color(0xFF287AC6),
    width: 6,
    points: points,
  );

  return {polyline};
}