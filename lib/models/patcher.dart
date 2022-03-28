enum PatcherType { winning, losing, saving }

class Patcher {
  final String id, name, wins, losses, era, type;

  const Patcher(
      {required this.id,
      required this.name,
      required this.wins,
      required this.losses,
      required this.type,
      required this.era});

  factory Patcher.fromJson(var json, String type) {
    return Patcher(
        name: '${json['first']} ${json['last']}',
        wins: json['wins'],
        era: json['era'],
        losses: json['losses'],
        type: type,
        id: json['id']);
  }
}
