import 'package:flutter/material.dart';

class MainList extends StatelessWidget {
  final List<int> elements = List.generate(20, (index) => index);

  MainList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: elements.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 50,
          width: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.blue,
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${elements[index]}'),
              ),
            ),
          ),
        );
      },
    );
  }
}
