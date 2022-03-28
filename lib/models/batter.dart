import 'package:mlb_test1/models/batter_details.dart';

class Batter {
  final String id, name, position;
  final BatterDetails details;

  Batter(
      {required this.id,
      required this.name,
      required this.details,
      required this.position});

  factory Batter.fromJson(var json) {
    return Batter(
        id: json['id'],
        name: json['name_display_first_last'],
        position: json['pos'],
        details: BatterDetails.fromJson(json));
  }
}
