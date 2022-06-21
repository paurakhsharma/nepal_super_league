import 'dart:convert';

import 'package:collection/collection.dart';

class SuperLeague {
  final List<Team> teams;
  final List<Fixture> fixtures;
  final List<LeagueStanding> leaugueStandings;
  final List<GoalScorer> goalScorers;
  SuperLeague({
    required this.teams,
    required this.fixtures,
    required this.leaugueStandings,
    required this.goalScorers,
  });



  SuperLeague copyWith({
    List<Team>? teams,
    List<Fixture>? fixtures,
    List<LeagueStanding>? leaugueStandings,
    List<GoalScorer>? goalScorers,
  }) {
    return SuperLeague(
      teams: teams ?? this.teams,
      fixtures: fixtures ?? this.fixtures,
      leaugueStandings: leaugueStandings ?? this.leaugueStandings,
      goalScorers: goalScorers ?? this.goalScorers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'teams': teams.map((x) => x.toMap()).toList(),
      'fixtures': fixtures.map((x) => x.toMap()).toList(),
      'leaugueStandings': leaugueStandings.map((x) => x.toMap()).toList(),
      'goalScorers': goalScorers.map((x) => x.toMap()).toList(),
    };
  }

  factory SuperLeague.fromMap(Map<String, dynamic> map) {
    return SuperLeague(
      teams: List<Team>.from(map['teams']?.map((x) => Team.fromMap(x))),
      fixtures: List<Fixture>.from(map['fixtures']?.map((x) => Fixture.fromMap(x))),
      leaugueStandings: List<LeagueStanding>.from(map['leaugueStandings']?.map((x) => LeagueStanding.fromMap(x))),
      goalScorers: List<GoalScorer>.from(map['goalScorers']?.map((x) => GoalScorer.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SuperLeague.fromJson(String source) => SuperLeague.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SuperLeague(teams: $teams, fixtures: $fixtures, leaugueStandings: $leaugueStandings, goalScorers: $goalScorers)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is SuperLeague &&
      listEquals(other.teams, teams) &&
      listEquals(other.fixtures, fixtures) &&
      listEquals(other.leaugueStandings, leaugueStandings) &&
      listEquals(other.goalScorers, goalScorers);
  }

  @override
  int get hashCode {
    return teams.hashCode ^
      fixtures.hashCode ^
      leaugueStandings.hashCode ^
      goalScorers.hashCode;
  }
}

class Team {
  final String name;
  final String logoUrl;
  Team({
    required this.name,
    required this.logoUrl,
  });



  Team copyWith({
    String? name,
    String? logoUrl,
  }) {
    return Team(
      name: name ?? this.name,
      logoUrl: logoUrl ?? this.logoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'logoUrl': logoUrl,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      name: map['name'],
      logoUrl: map['logoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) => Team.fromMap(json.decode(source));

  @override
  String toString() => 'Team(name: $name, logoUrl: $logoUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Team &&
      other.name == name &&
      other.logoUrl == logoUrl;
  }

  @override
  int get hashCode => name.hashCode ^ logoUrl.hashCode;
}

class Fixture {
  final String name;
  final Team team1;
  final Team team2;
  final List<int> result;
  final String dateTime;
  final String venue;
  Fixture({
    required this.name,
    required this.team1,
    required this.team2,
    required this.result,
    required this.dateTime,
    required this.venue,
  });



  Fixture copyWith({
    String? name,
    Team? team1,
    Team? team2,
    List<int>? result,
    String? dateTime,
    String? venue,
  }) {
    return Fixture(
      name: name ?? this.name,
      team1: team1 ?? this.team1,
      team2: team2 ?? this.team2,
      result: result ?? this.result,
      dateTime: dateTime ?? this.dateTime,
      venue: venue ?? this.venue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'team1': team1.toMap(),
      'team2': team2.toMap(),
      'result': result,
      'dateTime': dateTime,
      'venue': venue,
    };
  }

  factory Fixture.fromMap(Map<String, dynamic> map) {
    return Fixture(
      name: map['name'],
      team1: Team.fromMap(map['team1']),
      team2: Team.fromMap(map['team2']),
      result: List<int>.from(map['result']),
      dateTime: map['dateTime'],
      venue: map['venue'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Fixture.fromJson(String source) => Fixture.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Fixture(name: $name, team1: $team1, team2: $team2, result: $result, dateTime: $dateTime, venue: $venue)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is Fixture &&
      other.name == name &&
      other.team1 == team1 &&
      other.team2 == team2 &&
      listEquals(other.result, result) &&
      other.dateTime == dateTime &&
      other.venue == venue;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      team1.hashCode ^
      team2.hashCode ^
      result.hashCode ^
      dateTime.hashCode ^
      venue.hashCode;
  }
}

class LeagueStanding {
  final Team team;
  final int mp;
  final int w;
  final int d;
  final int l;
  final int gf;
  final int ga;
  final int gd;
  final int pts;
  LeagueStanding({
    required this.team,
    required this.mp,
    required this.w,
    required this.d,
    required this.l,
    required this.gf,
    required this.ga,
    required this.gd,
    required this.pts,
  });

  LeagueStanding copyWith({
    Team? team,
    int? mp,
    int? w,
    int? d,
    int? l,
    int? gf,
    int? ga,
    int? gd,
    int? pts,
  }) {
    return LeagueStanding(
      team: team ?? this.team,
      mp: mp ?? this.mp,
      w: w ?? this.w,
      d: d ?? this.d,
      l: l ?? this.l,
      gf: gf ?? this.gf,
      ga: ga ?? this.ga,
      gd: gd ?? this.gd,
      pts: pts ?? this.pts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'team': team.toMap(),
      'mp': mp,
      'w': w,
      'd': d,
      'l': l,
      'gf': gf,
      'ga': ga,
      'gd': gd,
      'pts': pts,
    };
  }

  factory LeagueStanding.fromMap(Map<String, dynamic> map) {
    return LeagueStanding(
      team: Team.fromMap(map['team']),
      mp: map['mp'],
      w: map['w'],
      d: map['d'],
      l: map['l'],
      gf: map['gf'],
      ga: map['ga'],
      gd: map['gd'],
      pts: map['pts'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LeagueStanding.fromJson(String source) => LeagueStanding.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LeagueStanding(team: $team, mp: $mp, w: $w, d: $d, l: $l, gf: $gf, ga: $ga, gd: $gd, pts: $pts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LeagueStanding &&
      other.team == team &&
      other.mp == mp &&
      other.w == w &&
      other.d == d &&
      other.l == l &&
      other.gf == gf &&
      other.ga == ga &&
      other.gd == gd &&
      other.pts == pts;
  }

  @override
  int get hashCode {
    return team.hashCode ^
      mp.hashCode ^
      w.hashCode ^
      d.hashCode ^
      l.hashCode ^
      gf.hashCode ^
      ga.hashCode ^
      gd.hashCode ^
      pts.hashCode;
  }
}

class GoalScorer {
  final String player;
  final int noOfGoals;
  GoalScorer({
    required this.player,
    required this.noOfGoals,
  });

  GoalScorer copyWith({
    String? player,
    int? noOfGoals,
  }) {
    return GoalScorer(
      player: player ?? this.player,
      noOfGoals: noOfGoals ?? this.noOfGoals,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'player': player,
      'noOfGoals': noOfGoals,
    };
  }

  factory GoalScorer.fromMap(Map<String, dynamic> map) {
    return GoalScorer(
      player: map['player'],
      noOfGoals: map['noOfGoals'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GoalScorer.fromJson(String source) => GoalScorer.fromMap(json.decode(source));

  @override
  String toString() => 'GoalScorer(player: $player, noOfGoals: $noOfGoals)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GoalScorer &&
      other.player == player &&
      other.noOfGoals == noOfGoals;
  }

  @override
  int get hashCode => player.hashCode ^ noOfGoals.hashCode;
}
