import 'package:flutter/material.dart';
import 'package:ghaith_test/core/constants/app_colors.dart';
import 'package:ghaith_test/core/constants/text_styles.dart';
import 'package:ghaith_test/data/models/task_model.dart';
import 'package:ghaith_test/presentation/screens/task_detail_screen.dart';
import 'package:ghaith_test/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorsManager.textfieldbordercolor)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TaskDetailScreen()));
        },
        child: ListTile(
          title: Text(
            task.title,
            style: TextStyles.font13bold.copyWith(
                decoration: task.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          subtitle: Text(
            task.description,
            style: TextStyles.smallText,
          ),
          trailing: IconButton(
            onPressed: () {
              taskProvider.toggleTaskCompletion(task.id);
            },
            icon: Icon(
              task.isCompleted
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: task.isCompleted
                  ? ColorsManager.greenColor
                  : ColorsManager.greycolor,
            ),
          ),
        ),
      ),
    );
  }
}
