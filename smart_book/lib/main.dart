import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; // dummy data

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookSmart',
      home: Scaffold(
        appBar: AppBar(
          title: Text('BookSmart'),
        ),
        body: Center(
          child: ServiceSuggestions(),
        ),
      ),
    );
  }
}


class ServiceSuggestions extends StatefulWidget {
  @override
  _ServiceSuggestionsState createState() => _ServiceSuggestionsState();
}

class _ServiceSuggestionsState extends State<ServiceSuggestions> {
    @override
    Widget build(BuildContext context) {
      final wordPair = WordPair.random();
      final _suggestions = <WordPair>[];
      final _biggerFont = TextStyle(fontSize: 18.0);
      return Text(wordPair.asPascalCase);
      
    }
    
}