import 'package:flutter/material.dart';
import 'package:number_trivia_app/core/get_number.dart';

import '../models/number_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();

  NumberModel? numberModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Number Trivia'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    numberModel == null ? '' : numberModel!.number.toString(),
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    numberModel == null ? 'Start Searching' : numberModel!.text,
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () async {
                              int n = int.parse(controller.text);
                              NumberModel son = await getNumber(n);
                              setState(() {
                                numberModel = son;
                              });
                            },
                            child: const Text('Search')),
                        TextButton(
                            onPressed: () async {
                              NumberModel son = await getRandomNumber();
                              setState(() {
                                numberModel = son;
                              });
                            },
                            child: const Text('Get random trivia')),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
