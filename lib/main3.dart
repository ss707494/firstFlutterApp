import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new RandomWords(),
      theme: new ThemeData(
        primaryColor: Colors.white
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggest = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18);

  Widget _buildSuggest() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (e, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggest.length) {
            _suggest.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggest[index]);
        });
  }

  Widget _buildRow(WordPair content) {
    final isSaved = _saved.contains(content);

    return new ListTile(
      title: new Text(
        content.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (isSaved) {
            _saved.remove(content);
          } else {
            _saved.add(content);
          }
        });
      },
    );
  }

  _pushSaved() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      final titles = _saved.map((i) => new ListTile(
              title: new Text(
            i.asPascalCase,
            style: _biggerFont,
          )));
      final divided = ListTile.divideTiles(tiles: titles, context: context).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('saved title')
        ),
        body: new ListView(children: divided),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('list'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggest(),
    );
  }
}

class SS extends StatefulWidget {
  @override
  _SSState createState() => _SSState();
}

class _SSState extends State<SS> {
  @override
  Widget build(BuildContext context) {
    return Container(child: new Text('sldkjf'));
  }
}

