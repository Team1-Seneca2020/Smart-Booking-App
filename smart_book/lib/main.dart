import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; // dummy data

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookSmart',
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.white,

        fontFamily: 'Arial',
      )      
    );
  }
}


//******** CLASSES ********/ 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class ServiceSuggestions extends StatefulWidget {
  @override
  _ServiceSuggestionsState createState() => _ServiceSuggestionsState();
}

//******** STATES ********/ 
class _HomePageState extends State<HomePage> {
  void _settings() {
    // TBU
  }
            @override
            Widget build(BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('BookSmart'),
                  actions: [
                    IconButton(icon: Icon(Icons.list), onPressed: _settings)
                  ],
                ),
                body: Center(
                  child: HomeContent()
                ),
                bottomNavigationBar: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Main')),
                    BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chat')),
                    BottomNavigationBarItem(icon: Icon(Icons.perm_contact_calendar), title: Text('Bookings')),
                ]
                ),
              );
            }  
}

class _HomeContentState extends State<HomeContent> {
  void _search() {
    //TBU
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Search'),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: _search)]),
        body: Center(
          child: ServiceSuggestions(),
          ),
      );
    }

}

  class ServiceListItem extends StatelessWidget {
    const ServiceListItem({
      this.thumbnail,
      this.title,
    });

    final Widget thumbnail;
    final String title;

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: thumbnail,
            ),
            Expanded(
              flex: 3,
              child: Text(title),
            ),
          ],
        ),
      );
    }
    
  }

class _ServiceSuggestionsState extends State<ServiceSuggestions> {  
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0.0),
      itemExtent: 106.0,
      children: <ServiceListItem> [
        ServiceListItem(
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          title: 'Cafe'
        ),
      ],
    );
  }
}

// From tutorial
class ListExample extends StatefulWidget {
  @override
  _ListExampleState createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
    final _suggestions = <WordPair>[];
    final _saved = Set<WordPair>();
    final _biggerFont = TextStyle(fontSize: 18.0);

    Widget _buildRow(WordPair pair) {
      final alreadySaved = _saved.contains(pair);
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
                    _saved.remove(pair);
                  } else { 
                    _saved.add(pair); 
                  } 
                });
              },
            );
    }

    Widget _buildSuggestions() {
      return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
              });
        }

        void _pushSaved() {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  final tiles = _saved.map(
                    (WordPair pair) {
                      return ListTile(
                        title: Text(
                          pair.asPascalCase,
                          style: _biggerFont,
                        ),
                      );
                    },
                  );
                  final divided = ListTile.divideTiles(
                    context: context,
                    tiles: tiles,
                  ).toList();

                  return Scaffold(
                    appBar: AppBar(
                      title: Text('Saved Suggestions'),
                    ),
                    body: ListView(children: divided),
                  );
                }
              )
            );
        }
        
            @override
            Widget build(BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('BookSmart'),
                  actions: [
                    IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
                  ],
                ),
                body: Center(
                  child: _buildSuggestions()
                ),
                bottomNavigationBar: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Main')),
                    BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chat')),
                    BottomNavigationBarItem(icon: Icon(Icons.perm_contact_calendar), title: Text('Bookings')),
                ]
                ),
              );
            }
        }

