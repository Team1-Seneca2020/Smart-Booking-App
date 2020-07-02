import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; // dummy data

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookSmart',
      home: ServiceSuggestions(),      
    );
  }
}


class ServiceSuggestions extends StatefulWidget {
  @override
  _ServiceSuggestionsState createState() => _ServiceSuggestionsState();
}

class _ServiceSuggestionsState extends State<ServiceSuggestions> {
    final _suggestions = <WordPair>[];
    final _biggerFont = TextStyle(fontSize: 18.0);

    Widget _buildRow(WordPair pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
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
        
            @override
            Widget build(BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('BookSmart'),
                ),
                body: Center(
                  child: _buildSuggestions()
                ),
              );
            }
        }

