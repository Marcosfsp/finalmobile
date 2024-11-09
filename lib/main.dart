import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'package:finalmobile/pages/register_page.dart';
import 'package:finalmobile/pages/watchlist_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyAnimeWatchlist',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.orange[50],
      ),
      home: WelcomePage(),
      routes: {
        '/register': (context) => RegisterPage(),
        '/watchlist': (context) => WatchlistPage(),
      },
    );
  }
}
