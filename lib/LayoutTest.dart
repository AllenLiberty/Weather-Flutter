import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(args ?? "ffeeee"),
      ),
      body: Center(
        child: Text('fff'),
      ),
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Start up Name',
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();
  Widget _buildSuggestions(){
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder:(context, i){
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }
  Widget _buildRow(WordPair pair){
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          if (alreadySaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }
  void _pushSaved(){
    Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) {
          final titles = _saved.map(
                  (pair){
                return new ListTile(
                  title: new Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                );
              }
          );

          final divided = ListTile
              .divideTiles(
            context:context,
            tiles: titles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('sdfafasdfasfd'),
            ),
            body: new ListView(children: divided),
          );
        })
    );
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
}