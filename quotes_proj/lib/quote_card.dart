import 'quote.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key, required this.quote, required this.delete});
  final Quote quote;
  final Function() delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.text,
              style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
            ),
            const SizedBox(height: 10),
            Text(quote.author,
                style: TextStyle(fontSize: 14.0, color: Colors.grey[800])),
            TextButton.icon(
                onPressed: delete,
                label: const Text('Delete Quote'),
                icon: const Icon(Icons.delete)
            )
          ],
        ),
      ),
    );
  }
}