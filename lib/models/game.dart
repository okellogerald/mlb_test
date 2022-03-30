import 'inning.dart';
import 'pitcher.dart';
import 'team.dart';


class Game {
  final String id, venue, time, status, gameDateDirectory;
  final Team homeTeam, awayTeam;
  final Pitcher winningPitcher, losingPitcher;
  final Pitcher? savingPitcher;
  final List<Inning> innings;

  const Game(
      {required this.id,
      required this.homeTeam,
      required this.awayTeam,
      required this.venue,
      required this.time,
      required this.status,
      required this.winningPitcher,
      required this.losingPitcher,
      required this.savingPitcher,
      required this.gameDateDirectory,
      required this.innings});

  factory Game.fromJson(var json) {
    final jsonInnings = json['linescore']['inning'] as List?;
    final innings = jsonInnings?.map((e) => Inning.fromJson(e)).toList();
    return Game(
        id: json['id'],
        homeTeam: Team.fromJson(json, TeamStatus.home),
        awayTeam: Team.fromJson(json, TeamStatus.away),
        venue: json['venue'],
        time: json['time'] + json['ampm'],
        status: json['status']['status'],
        winningPitcher: Pitcher.fromJson(json['winning_pitcher'], 'WIN'),
        losingPitcher: Pitcher.fromJson(json['losing_pitcher'], 'LOSS'),
        savingPitcher: ((json['save_pitcher'] as Map)['id'] as String).isEmpty
            ? null
            : Pitcher.fromJson(json['save_pitcher'], 'SAVE'),
        gameDateDirectory: json['game_data_directory'],
        innings: innings ?? []);
  }

  List<Pitcher> get patchers => savingPitcher == null
      ? [winningPitcher, losingPitcher]
      : [winningPitcher, losingPitcher, savingPitcher!];

  Team get winningTeam =>
      homeTeam.totalRuns > awayTeam.totalRuns ? homeTeam : awayTeam;

  bool get wasPlayed => status == 'Final';
}
