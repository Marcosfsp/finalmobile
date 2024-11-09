import 'package:flutter/material.dart';
import '../models/anime.dart';
import '../database/anime_dao.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _genreController = TextEditingController();
  final _yearController = TextEditingController();

  // Função para salvar o anime no SQLite
  Future<void> _saveAnime() async {
    if (_formKey.currentState!.validate()) {
      final newAnime = Anime(
        nome: _nameController.text,
        genero: _genreController.text,
        ano: int.parse(_yearController.text),
      );
      await AnimeDAO.instance.create(newAnime);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Anime adicionado à watchlist!')),
      );

      // Limpa os campos após salvar
      _nameController.clear();
      _genreController.clear();
      _yearController.clear();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _genreController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Anime'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nome do Anime',
                  labelStyle: TextStyle(color: Colors.orange[800]),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o nome do anime';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _genreController,
                decoration: InputDecoration(
                  labelText: 'Gênero',
                  labelStyle: TextStyle(color: Colors.orange[800]),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o gênero do anime';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _yearController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Ano de Lançamento',
                  labelStyle: TextStyle(color: Colors.orange[800]),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira o ano de lançamento';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Insira um ano válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  onPressed: _saveAnime,
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
