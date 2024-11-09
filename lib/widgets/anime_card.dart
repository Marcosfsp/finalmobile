import 'package:flutter/material.dart';
import '../models/anime.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;
  final VoidCallback onToggleAssistido;

  const AnimeCard({
    Key? key,
    required this.anime,
    required this.onToggleAssistido,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(anime.nome, style: TextStyle(fontSize: 18)),
        subtitle: Text('${anime.genero} • ${anime.ano}'),
        trailing: IconButton(
          icon: Icon(
            anime.assistido ? Icons.check_circle : Icons.circle_outlined,
            color: anime.assistido ? Colors.green : Colors.grey,
          ),
          onPressed: onToggleAssistido,
        ),
      ),
    );
  }
}
