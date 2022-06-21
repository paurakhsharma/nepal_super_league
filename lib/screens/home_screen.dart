import 'package:flutter/material.dart';
import 'package:nepal_super_league/models/super_league.dart';
import 'package:nepal_super_league/services/scraper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SuperLeague? _superLeague;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nepal Super League',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _superLeague == null
              ? Center(child: CircularProgressIndicator())
              : Text('Loaded'),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Scraper.getData().then((value) {
      _superLeague = value;
      setState(() {});
    });
  }
}
