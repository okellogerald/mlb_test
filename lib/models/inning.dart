class Inning {
  final String home, away;
  const Inning(this.home, this.away);

  factory Inning.fromJson(var json) {
    return Inning(json['home'], json['away']);
  }
}
