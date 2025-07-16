import 'package:flutter/material.dart';
import 'package:slidable/components/item_slidable.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(50, (item) {
              return ItemSlidable(
                index: item + 1,
              );
            }),
          ),
        ),
      ),
    );
  }
}
