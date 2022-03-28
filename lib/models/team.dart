enum TeamStatus { home, away }

class Team {
  final String id, name, wins, losses, runs, hits, errors;

  Team(
      {required this.id,
      required this.name,
      required this.wins,
      required this.runs,
      required this.hits,
      required this.errors,
      required this.losses});

  factory Team.fromJson(var json, TeamStatus teamStatus) {
    final isHome = teamStatus == TeamStatus.home;
    final linescore = json['linescore'];
    final runs = linescore['r'];
    final errors = linescore['e'];
    final hits = linescore['h'];
    return Team(
      id: isHome ? json['home_team_id'] : json['away_team_id'],
      name: isHome ? json['home_team_name'] : json['away_team_name'],
      wins: isHome ? json['home_win'] : json['away_win'],
      losses: isHome ? json['home_loss'] : json['away_loss'],
      runs: isHome ? runs['home'] : runs['away'],
      errors: isHome ? errors['home'] : runs['away'],
      hits: isHome ? hits['home'] : runs['away'],
    );
  }

  int get totalRuns => int.parse(runs);
}
