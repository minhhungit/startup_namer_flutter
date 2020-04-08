import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

int tmpIndex = 0;
final _fakeDatabase = generateWordPairs().take(35).map((WordPair x) {
  tmpIndex++;
  return '${x.asPascalCase}';
}).toList();
Set<String> savedGlobal = new Set<String>();

List<String> _titles = [
  "Scraping Executive Bios From Company Sites With Python",
  "JavaScript Algorithm: Remove the Final Exclamation Mark",
  "F# Weekly #14, 2020 – .NET 5.0 Preview 2 & tasks and resumable state machines in the F# compiler",
  "Presentation: From POC to Production in Minimal Time - Avoiding Pain in ML Projects",
  "Enabling Remote Learning with Office 365 Education | Premier Developer",
  "Working with Dates in Dart"
];

List<String> _imageCover = [
  "https://www.developer-tech.com/wp-content/uploads/sites/3/2020/03/ibm_call_for_code_coronavirus_covid19_challenge_developer_330x245_crop_80.jpg",
  "https://www.developer-tech.com/wp-content/uploads/sites/3/2020/03/singapore_tracetogether_contact_tracing_coronavirus_covid19_developer_open_source_330x245_crop_7.png",
  "https://www.developer-tech.com/wp-content/uploads/sites/3/2020/03/xbox_series_x_graphics_amd_leak_code_gaming_developer_330x245_crop_80.jpg",
  "https://www.developer-tech.com/wp-content/uploads/sites/3/2020/03/facebook_messenger_coronavirus_covid_19_developer_hackathon_330x245_crop_80.jpg",
  "https://www.developer-tech.com/wp-content/uploads/sites/3/2020/03/facebook_messenger_coronavirus_covid_19_developer_hackathon-350x233.jpg",
  "https://www.developer-tech.com/wp-content/uploads/sites/3/2020/03/microsoft_build_2020_digital_virtual_only_developer_app_event_coronavirus_covid19-350x225.png",
  "https://www.developer-tech.com/wp-content/uploads/sites/3/2020/03/tim_sweeney_nvidia_geforce_now_cloud_game_streaming_gaming_developer-350x237.jpg",
  "https://www.developer-tech.com/wp-content/uploads/sites/3/2020/03/apple_developers_adverts_push_notifications_ios_apps-350x233.jpg",
  "https://www.developer-tech.com/wp-content/uploads/sites/3/2020/03/ethereum_devcon_6_crypto_market_developer_dapps_event_blockchain-350x229.jpg"
];

class RandomWordsV2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsStateV2();
}

class RandomWordsStateV2 extends State<RandomWordsV2> {
  int perPage = 10;
  int curSeek = 0;
  int tempData = 0;

  final _biggerFont = const TextStyle(fontSize: 18.0);
  var items = List<String>();

  @override
  void initState() {
    super.initState();
    setState(() {
      items.addAll(_fakeDatabase.getRange(curSeek, curSeek + perPage));
      curSeek = curSeek + perPage;
      tempData = 0;
    });
  }

  Widget _buildRow(int index, String pair) {
    final bool alreadySaved = savedGlobal.contains(pair);
    final currentTitle = _titles[new Random().nextInt(_titles.length)];

    return 
      Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: new BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey[300]
            ),
            borderRadius: new BorderRadius.all(Radius.circular(20)
            )
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => print("OnImage: ${currentTitle}}"),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/loading-2.gif',
                          image: _imageCover[new Random().nextInt(_imageCover.length)],
                          fit: BoxFit.fitWidth,
                          //width: 100,
                          height: 200,
                        ),
                      ),
                    )
                  )
                ]
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: GestureDetector(
                            onTap: () => print(currentTitle),
                            child: Text(
                              "${index}. ${currentTitle}",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14.0,
                                fontFamily: 'Roboto',
                                //wordSpacing: 1.2,
                                letterSpacing: 1.1
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "2020 Aug 19",
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        )
                      ]
                    )
                  ],
                ),
              )              
            ],
          ),
        ),
      );
    
    // Container(
    //   child: Column(children: <Widget>[
    //     Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: <Widget>[
    //         Column(
    //           children: <Widget>[
    //             Container(
    //               margin: const EdgeInsets.only(left: 0, top: 2),
    //               // decoration: new BoxDecoration(
    //               //   border: Border.all(
    //               //     width: 1,
    //               //     color: Colors.grey[300]
    //               //   ),
    //               //   borderRadius: new BorderRadius.only(
    //               //     topLeft: Radius.circular(20),
    //               //     bottomRight: Radius.circular(20)
    //               //   )
    //               // ),
    //               child: Padding(
    //                 //padding: const EdgeInsets.all(8.0),
    //                 padding: const EdgeInsets.all(0),
    //                 child: Stack(
    //                   children: <Widget>[
    //                     Container(                        
    //                       //color: Colors.blue, 
    //                       width: 100, 
    //                       height: 100),
    //                     Positioned(
    //                       top: 0,
    //                       left: 0,
    //                       // bottom: -50,
    //                       // right: -50,
    //                       child: Container(
    //                         //color: Colors.yellow, 
    //                         width: 100, 
    //                         //height: 100,
    //                         child: FadeInImage.assetNetwork(
    //                           placeholder: 'assets/news-placeholder.png',
    //                           //image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTkea-Mp_zvy1whxsQn9Msc032o7dOOOl0QhwO5SWXWNVkDhudW',// 'https://picsum.photos/250?image=9'
    //                           //image: 'https://i.kym-cdn.com/photos/images/facebook/001/295/524/cda.jpg',
    //                           image: 'https://iweb.tatthanh.com.vn/pic/3/blog/chu-long-dep.JPG',
    //                           //image: 'https://openimagedenoise.github.io/images/moana_16spp_oidn.jpg',
    //                           fit: BoxFit.fitWidth,
    //                           width: 100,
    //                           //height: 100,
    //                         ),
    //                       )
    //                     ),
    //                   ],
    //                   overflow: Overflow.clip,
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //         Expanded(
    //             child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //               Container(
    //                   // decoration: new BoxDecoration(
    //                   //   border: Border.all(
    //                   //     width: 1,
    //                   //     color: Colors.grey[300]
    //                   //   ),
    //                   // ),
    //                   margin: const EdgeInsets.only(left: 10, bottom: 5),
    //                   child: Container(
    //                     constraints: new BoxConstraints(minHeight: 78.0),
    //                     child: Text(
    //                       "${pair}. ${_titles[new Random().nextInt(_titles.length)]}",
    //                       style: TextStyle(
    //                         color: Colors.grey[500],
    //                         fontSize: 14.0,
    //                         //fontFamily: 'LiuJianMaoCao',
    //                         //fontWeight: FontWeight.bold,
    //                       ),
    //                       //textAlign: TextAlign.justify,
    //                     ),
    //                   )),
    //               Container(
    //                   margin: const EdgeInsets.only(left: 10.0),
    //                   padding: const EdgeInsets.all(2),
    //                   height: 20,
    //                   decoration: new BoxDecoration(
    //                       //color: Colors.purple,
    //                       border: Border.all(width: 1, color: Colors.blue[300]),
    //                       borderRadius:
    //                           new BorderRadius.all(const Radius.circular(5))),
    //                   child: Text(
    //                     "Hello != world",
    //                     style: TextStyle(color: Colors.blue, fontSize: 12),
    //                   )),
    //             ])),
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           children: <Widget>[
    //             IconButton(
    //               icon: Icon(
    //                   alreadySaved ? Icons.favorite : Icons.favorite_border),
    //               color: alreadySaved ? Colors.red : null,
    //               onPressed: () {
    //                 setState(() {
    //                   if (alreadySaved) {
    //                     savedGlobal.remove(pair);
    //                   } else {
    //                     savedGlobal.add(pair);
    //                   }
    //                 });
    //               },
    //             ),
    //           ],
    //         )
    //       ],
    //     ),
    //     Container(
    //         child: Stack(children: <Widget>[Divider(color: Colors.grey[400])]))
    //   ]),
    // );

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
        itemBuilder: (context, i) {

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
            print (items[i]);
            return _buildRow(i, items[i]);
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
          IconButton(
              icon: Icon(Icons.terrain),
              onPressed: () => {
                    setState(() {
                      tempData++;
                    })
                  }),
          Icon(
            Icons.play_arrow,
            color: tempData.isOdd ? Colors.red : Colors.blue,
          ),
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}

