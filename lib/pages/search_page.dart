import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Number Trivia'),
        ),
        body: Column(children: [
          // TODO: Change this to variables
          const Center(
            child: Text('Start searching!'),
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            children: [
              TextButton(onPressed: () {}, child: const Text('Search')),
              TextButton(onPressed: () {}, child: const Text('Get random trivia')),
            ],
          )
        ]),
      ),
    );
  }
}
