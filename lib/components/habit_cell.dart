import 'package:flutter/material.dart';

class HabitCell extends StatelessWidget {
  final String name;

  const HabitCell({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(name);
  }
}
