class BatterDetails {
  final String ab, r, h, rbi, bb, avg, obp, slg;

  BatterDetails(
      {required this.ab,
      required this.r,
      required this.rbi,
      required this.bb,
      required this.avg,
      required this.obp,
      required this.slg,
      required this.h});

  factory BatterDetails.fromJson(var json) {
    return BatterDetails(
        ab: json['ab'],
        r: json['r'],
        rbi: json['rbi'],
        bb: json['bb'],
        avg: json['avg'],
        obp: json['obp'],
        slg: json['slg'],
        h: json['h']);
  }
}
