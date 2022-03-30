enum PatcherType { winning, losing, saving }

class Pitcher {
  final String id, name, wins, losses, era, type;

  const Pitcher(
      {required this.id,
      required this.name,
      required this.wins,
      required this.losses,
      required this.type,
      required this.era});

  factory Pitcher.fromJson(var json, String type) {
    return Pitcher(
        name: '${json['first']} ${json['last']}',
        wins: json['wins'],
        era: json['era'],
        losses: json['losses'],
        type: type,
        id: json['id']);
  }
}
