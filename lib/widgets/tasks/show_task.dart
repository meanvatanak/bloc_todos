import 'package:flutter/material.dart';

import '../../utilities/constants.dart';

class ShowTask extends StatelessWidget {
  ShowTask({
    super.key,
    required this.name,
    required this.description,
    required this.dueDate,
    required this.category,
  });

  final String name;
  final String description;
  final String dueDate;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Task Details',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 20),
          Text('Name:'),
          Text(
            name,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Text('Description:'),
          Text(
            description,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Text('Due Date:'),
          Text(
            dueDate,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Text('Category:'),
          Text(
            category,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          // cancel and add buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Close',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
