import 'package:flutter/material.dart';
import '../models/anime.dart';
import '../database/anime_dao.dart';
import '../widgets/anime_card.dart';

class WatchlistPage extends StatefulWidget {
  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  late Future<List<Anime>> _animeList;

  @override
  void initState() {
    super.initState();
    _loadAnimes();
  }

  void _loadAnimes() {
    setState(() {
      _animeList = AnimeDAO.instance.readAllAnimes();
    });
  }

  Future<void> _toggleAssistido(Anime anime) async {
    anime.assistido = !anime.assistido;
    await AnimeDAO.instance.update(anime);
    _loadAnimes(); // Recarrega a lista para atualizar a interface
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Watchlist'),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<Anime>>(
        future: _animeList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar a watchlist.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum anime na sua watchlist.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final anime = snapshot.data![index];
                return AnimeCard(
                  anime: anime,
                  onToggleAssistido: () => _toggleAssistido(anime),
                );
              },
            );
          }
        },
      ),
    );
  }
}
