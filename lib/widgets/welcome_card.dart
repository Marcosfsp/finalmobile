import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.orange[100],
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "MyAnimeWatchlist", // Nome do app
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Organize os animes que você deseja assistir",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.orange[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
