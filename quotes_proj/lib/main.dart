import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(const MaterialApp(home: QuoteList()));

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote('Be yourself; everyone else is taken', 'Oscar Wilde'),
    Quote('Consistency is the key to success', 'Unknown'),
    Quote('Chase goals, not girls', 'Unknown'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'Quotes List',
          style: TextStyle(color: Colors.cyanAccent),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(66, 1, 244, 1),
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
          quote: quote,
          delete: (){
            setState(() {
              quotes.remove(quote);
            });
          }
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Quote? addQuote = await _showTextInputDialog(context);
            if (quote != null) {
              setState((){
                quotes.add(Quote(addQuote!.text, addQuote.author!));
              });
            }
          },
        child: const Icon(
          Icons.add_card
        )
      ),
    );
  }
}



Future<Quote?> _showTextInputDialog(BuildContext context) async {
  final textFieldController = TextEditingController();
  final authorTextFieldController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Quote'),
          content: Column(
            children: [
              TextField(
                controller: textFieldController,
                decoration: const InputDecoration(labelText: "Quote"),
              ),
              TextField(
                controller: authorTextFieldController,
                decoration: const InputDecoration(labelText: "Author"),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                var quote = Quote(textFieldController.text, authorTextFieldController.text);
                Navigator.of(context).pop(quote);
              }
            ),
          ],
        );
      });
}



