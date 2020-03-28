import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());
Set<WordPair> savedGlobal = new Set<WordPair>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: RandomWords());
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = savedGlobal.contains(pair);

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                // decoration: new BoxDecoration(
                //   border: Border.all(
                //     width: 1,
                //     color: Colors.grey[300]
                //   ),
                //   borderRadius: new BorderRadius.all(const Radius.circular(10))
                // ),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/news-placeholder.png',
                  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTkea-Mp_zvy1whxsQn9Msc032o7dOOOl0QhwO5SWXWNVkDhudW'// 'https://picsum.photos/250?image=9'
                ),
              )              
            ],
          ), 
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Container(
                    child: Text(
                      '5 Minutes to RedisInsight running on àầ ầgfdh ...',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                        fontFamily: 'LiuJianMaoCao',
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  padding: const EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    //color: Colors.purple,
                    border: Border.all(
                      width: 1,
                      color: Colors.blue[300]
                    ),
                    borderRadius: new BorderRadius.all(const Radius.circular(5))
                  ),
                  child: Text(
                    "Hello world",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12
                    ),
                  )
                ),
            ])
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
              icon: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border),
              color: alreadySaved ? Colors.red : null,
              onPressed: () {
                  setState(() {
                    if (alreadySaved) {
                      savedGlobal.remove(pair);
                    } else {
                      savedGlobal.add(pair);
                    }
                  });
                },
              ),
            ],
          )
        ],
      ),
    );

    // title: Text(
      //   pair.asPascalCase,
      //   style: _biggerFont,
      // ),
      // trailing: Icon(
      //   alreadySaved ? Icons.favorite : Icons.favorite_border,
      //   color: alreadySaved ? Colors.red : null,
      // ),
      // onTap: () {
      //   setState(() {
      //     if (alreadySaved) {
      //       savedGlobal.remove(pair);
      //     } else {
      //       savedGlobal.add(pair);
      //     }
      //   });
      //},
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        });
  }

  void _pushSaved() {
    if (savedGlobal == null || savedGlobal.length == 0){
      showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              //title: Text('No data'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Please choose at least one item.'),
                    Text('Thank you!'),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

      return;
    }

    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: Text("Saved Suggestion"),
        ),
        body: ListView.builder(
          itemCount: savedGlobal.length,
          itemBuilder: (context, index) {

            final item = savedGlobal.elementAt(index);

            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key(item.asPascalCase),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  savedGlobal.remove(item);
                });

                //Show a snackbar. This snackbar could also contain "Undo" actions.
                Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(
                      content: Text(
                        '${item.asPascalCase} dismissed'
                      )
                    ));
              },
              child: ListTile(title: Text(
                savedGlobal.elementAt(index).asPascalCase, 
                style: _biggerFont,
              ),
              trailing: Icon(
                Icons.remove_circle_outline,
                color: Colors.red,
              ),
              onTap: (){
                setState(() {
                  savedGlobal.remove(item);
                });
              })
            );
          }
        )
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}

/*
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

// create a global saved set
Set<WordPair> savedGlobal = new Set<WordPair>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: RandomWords());
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = savedGlobal.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            savedGlobal.remove(pair);
          } else {
            savedGlobal.add(pair);
          }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        });
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) => DetailPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}

// https://stackoverflow.com/questions/55142992/flutter-delete-item-from-listview
// add a new stateful page
class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {

    Iterable<ListTile> tiles = savedGlobal.map((WordPair pair) {
      return new ListTile(        
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(
          Icons.remove_circle_outline,
          color: Colors.red,
        ),
        onTap: () {
          setState(() {
            savedGlobal.remove(pair);
          });
        },
      );
    });

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: new ListView(children: divided),
    );
  }
}
*/
