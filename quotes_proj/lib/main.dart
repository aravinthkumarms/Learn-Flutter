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
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,
      ),
      body: Column(
        children: quotes
            .map((quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                }))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Quote? addQuote = await _showTextInputDialog(context);
            if (addQuote != null) {
                setState(() {
                quotes.add(Quote(addQuote.text, addQuote.author));
              });
            }
          },
          child: const Icon(Icons.add_card)),
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
            mainAxisSize: MainAxisSize.min,
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
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor:
                Theme.of(context).colorScheme.secondaryContainer,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                var quote = Quote(
                    textFieldController.text, authorTextFieldController.text);
                Navigator.of(context).pop(quote);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              child: const Text('OK'),
            ),
          ],
            actionsAlignment: MainAxisAlignment.end,
        );
      });
}
