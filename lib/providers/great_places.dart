import 'package:flutter/foundation.dart';
import 'package:great_places/models/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _places = [];

  List<Place> get places => [..._places];
}
