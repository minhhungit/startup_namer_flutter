import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// class FeedItem {
//   int Id;
//   String name;
// }

void main() => runApp(MyApp());

int tmpIndex = 0;
final _fakeDatabase = generateWordPairs().take(100).map((WordPair x) {
  tmpIndex++;
  return '${tmpIndex.toString()}. ${x.asPascalCase}';
}).toList();
Set<String> savedGlobal = new Set<String>();

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
  int perPage = 10;
  int curSeek = 0;

  final _biggerFont = const TextStyle(fontSize: 18.0);
  var items = List<String>();

  @override
  void initState() {
    super.initState();
    setState(() {
      items.addAll(_fakeDatabase.getRange(curSeek, curSeek + perPage));
      curSeek = curSeek + perPage;
    });
  }

  Widget _buildRow(String pair) {
    final bool alreadySaved = savedGlobal.contains(pair);
    return Container(
      child: Column(children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 0, top: 2),
                  constraints:
                      new BoxConstraints(maxHeight: 100, maxWidth: 100),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/news-placeholder.png',
                      //image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTkea-Mp_zvy1whxsQn9Msc032o7dOOOl0QhwO5SWXWNVkDhudW',// 'https://picsum.photos/250?image=9'
                      //image: 'https://i.kym-cdn.com/photos/images/facebook/001/295/524/cda.jpg',
                      image:
                          'https://iweb.tatthanh.com.vn/pic/3/blog/chu-long-dep.JPG',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Container(
                      // decoration: new BoxDecoration(
                      //   border: Border.all(
                      //     width: 1,
                      //     color: Colors.grey[300]
                      //   ),
                      // ),
                      margin: const EdgeInsets.only(left: 10, bottom: 5),
                      child: Container(
                        constraints: new BoxConstraints(minHeight: 72.0),
                        child: Text(
                          pair.length % 2 == 0
                              ? '${pair} > 5 Minutes to RedisInsight running on hello world 5 Minutes to RedisInsight running on hello world 5 Minutes to RedisInsight running on hello world 5 Minutes to RedisInsight running on hello world 5 Minutes to RedisInsight running on hello world 5 Minutes to RedisInsight running on hello world 5 Minutes to RedisInsight running on hello world 5 Minutes to RedisInsight running on hello world '
                              : '${pair} > ưpưpjwp ưpẹ pưegpjw á akfá;f a;sfa f  epg ựgưe ưgj ưpgwgư',
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 13.0,
                              //fontFamily: 'LiuJianMaoCao',
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      padding: const EdgeInsets.all(2),
                      height: 20,
                      decoration: new BoxDecoration(
                          //color: Colors.purple,
                          border: Border.all(width: 1, color: Colors.blue[300]),
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(5))),
                      child: Text(
                        "Hello world",
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      )),
                ])),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                      alreadySaved ? Icons.favorite : Icons.favorite_border),
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
        Container(
          child: Stack(         
            children: <Widget>[
              Divider(
                color: Colors.grey[400]
              )
            ]
          )
        )
      ]),
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
        // separatorBuilder: (context, index) => Divider(
        //   color: Colors.grey[400],
        // ),
        itemCount: (curSeek <= _fakeDatabase.length)
            ? items.length + 1
            : items.length, // check has items after fetch data from api
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        itemBuilder: (context, i) {
          print(i);

          if (i == items.length)
            return Container(
                width: 50,
                child: Center(
                    child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  child: Text("Load More"),
                  onPressed: () {
                    setState(() {
                      if ((curSeek + perPage) > _fakeDatabase.length) {
                        items.addAll(_fakeDatabase.getRange(
                            curSeek, _fakeDatabase.length));
                      } else {
                        items.addAll(
                            _fakeDatabase.getRange(curSeek, curSeek + perPage));
                      }
                      curSeek = curSeek + perPage;
                    });
                  },
                )));
          else {
            return _buildRow(items[i]);
          }
        });
  }

  void _pushSaved() {
    if (savedGlobal == null || savedGlobal.length == 0) {
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
                    key: Key(item),
                    // Provide a function that tells the app
                    // what to do after an item has been swiped away.
                    onDismissed: (direction) {
                      // Remove the item from the data source.
                      setState(() {
                        savedGlobal.remove(item);
                      });

                      //Show a snackbar. This snackbar could also contain "Undo" actions.
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('${item} dismissed')));
                    },
                    child: ListTile(
                        title: Text(
                          savedGlobal.elementAt(index),
                          style: _biggerFont,
                        ),
                        trailing: Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                        ),
                        onTap: () {
                          setState(() {
                            savedGlobal.remove(item);
                          });
                        }));
              }));
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
  final items = generateWordPairs()
      .take(10000)
      .map((WordPair x) => x.asPascalCase)
      .toList();

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
