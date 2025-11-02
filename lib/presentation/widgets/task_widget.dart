import 'package:flutter/material.dart';
import 'package:ghaith_test/core/constants/app_colors.dart';
import 'package:ghaith_test/core/constants/text_styles.dart';
import 'package:ghaith_test/data/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget(
      {super.key,
      required this.task,
      required this.onTap,
      required this.ontoggle});
  final TaskModel task;
  final VoidCallback onTap;
  final VoidCallback ontoggle;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: task.isCompleted
              ? ColorsManager.greenColor.withOpacity(0.08)
              : ColorsManager.whitecolor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorsManager.textfieldbordercolor)),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Hero(
            tag: task.id,
            child: Material(
              color: Colors.transparent,
              child: Text(
                task.title,
                style: TextStyles.taskTitle.copyWith(
                    color: task.isCompleted
                        ? ColorsManager.greycolor
                        : ColorsManager.blackcolor,
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              task.description,
              style: TextStyles.smallText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: IconButton(
              key: ValueKey(task.isCompleted),
              onPressed: ontoggle,
              iconSize: 28,
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
      ),
    );
  }
}
