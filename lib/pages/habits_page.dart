import 'package:flutter/material.dart';

import '../components/habit_cell.dart';
import '../constants.dart';

class HabitsPage extends StatefulWidget {
  const HabitsPage({Key? key}) : super(key: key);

  @override
  State<HabitsPage> createState() => _HabitsPageState();
}

class _HabitsPageState extends State<HabitsPage> {
  List _habits = [];

  Future<void> _getHabits() async {
    // final userId = supabase.auth.currentUser!.id;

    final data = await supabase.from('habits').select('*');

    setState(() {
      _habits = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _getHabits();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _habits.isNotEmpty
            ? _habits.map((habit) => HabitCell(name: habit['name'])).toList()
            : [const Text('Add Habits')]);
  }
}
