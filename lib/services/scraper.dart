import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:nepal_super_league/models/super_league.dart';

class Scraper {
  static const URL = 'https://goalnepal.com/tournament/55';

  static Future<SuperLeague> getData() async {
    final response = await http.get(Uri.parse(URL));

    final body = response.body;

    final html = parse(body);

    final participatingTeams =
        _getParticipatingTeams(html.querySelectorAll('.row .club-list'));

    final fixtures = _getFixtures(
        html.querySelectorAll('.tabbox-slide table'), participatingTeams);

    final leagueStandings = _getLeagueStandings(
      html.querySelectorAll('section + .fixtures table').first,
      participatingTeams,
    );

    final goalScorers =
        _getGoalScorers(html.querySelectorAll('section + .fixtures table')[1]);

    return SuperLeague(
      teams: participatingTeams,
      fixtures: fixtures,
      leaugueStandings: leagueStandings,
      goalScorers: goalScorers,
    );
  }

  static List<Team> _getParticipatingTeams(List<Element> teams) {
    return teams.map((e) {
      return Team(
        name: e.text.trim(),
        logoUrl: e.querySelector('img')!.attributes['src']!.trim(),
      );
    }).toList();
  }

  static List<Fixture> _getFixtures(List<Element> fixtures, List<Team> teams) {
    final _fixtures = <Fixture>[];
    fixtures.forEach((e) {
      final rows = e.querySelectorAll('tr');
      rows.sublist(2).forEach((element) {
        final match = element.querySelectorAll('td');
        final fixture = match[1];
        final team1 = fixture.children[0].text.trim();
        final team2 = fixture.children[1].text.trim();

        _fixtures.add(
          Fixture(
            name: rows[1].text.trim(),
            team1: teams.firstWhere((element) => element.name == team1),
            team2: teams.firstWhere((element) => element.name == team2),
            result: match[3]
                .text
                .trim()
                .split(' - ')
                .map((e) => int.parse(e))
                .toList(),
            dateTime: match[4].text.trim(),
            venue: match[5].text.trim(),
          ),
        );
      });
    });

    return _fixtures;
  }

  static List<LeagueStanding> _getLeagueStandings(
      Element table, List<Team> teams) {
    return table.querySelectorAll('tr').sublist(1).map((e) {
      final tds = e.querySelectorAll('td');

      final teamUrl = tds[0].querySelector('img')!.attributes['src']!.trim();

      final team = teams.firstWhere((element) => element.logoUrl == teamUrl);

      return LeagueStanding(
        team: team,
        mp: int.parse(tds[1].text.trim()),
        w: int.parse(tds[2].text.trim()),
        d: int.parse(tds[3].text.trim()),
        l: int.parse(tds[4].text.trim()),
        gf: int.parse(tds[5].text.trim()),
        ga: int.parse(tds[6].text.trim()),
        gd: int.parse(tds[7].text.trim()),
        pts: int.parse(tds[8].text.trim()),
      );
    }).toList();
  }

  static List<GoalScorer> _getGoalScorers(Element table) {
    return table.querySelectorAll('tr').sublist(1).map((e) {
      final tds = e.querySelectorAll('td');
      return GoalScorer(
        player: tds[1].text.trim(),
        noOfGoals: int.parse(tds[3].text.trim()),
      );
    }).toList();
  }
}

void main(List<String> arguments) {
  Scraper.getData();
}
