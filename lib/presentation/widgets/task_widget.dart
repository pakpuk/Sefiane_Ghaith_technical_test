import 'package:flutter/material.dart';
import 'package:ghaith_test/core/constants/app_colors.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorsManager.textfieldbordercolor)),
      child: ListTile(
        leading: Column(
          children: [
            Text(
              'hello',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text("hello")
          ],
        ),
        title: Text('first Tach'),
      ),
    );
  }
}
