import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  const ListItem({super.key});

  @override
  State<ListItem> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Slidable'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(50, (item) {
              return Container(
                margin: EdgeInsets.only(bottom: 12),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: Colors.lightBlue,
                child: Text("Item $item"),
              );
            }),
          ),
        ),
      ),
    );
  }
}
