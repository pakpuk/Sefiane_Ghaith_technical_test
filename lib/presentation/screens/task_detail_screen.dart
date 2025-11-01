import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghaith_test/core/constants/app_colors.dart';
import 'package:ghaith_test/core/constants/text_manager.dart';
import 'package:ghaith_test/core/constants/text_styles.dart';
import 'package:ghaith_test/data/models/task_model.dart';
import 'package:ghaith_test/presentation/widgets/button_custom_widget.dart';
import 'package:ghaith_test/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.whitecolor,
        elevation: 0,
        title: Text(
          TextManager.taskDetailTitle,
          style: TextStyles.heading1,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyles.heading2,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  task.description,
                  style: TextStyles.body,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      task.isCompleted
                          ? TextManager.taskCompleted
                          : TextManager.taskUncompleted,
                      style: TextStyles.body.copyWith(
                          color: task.isCompleted
                              ? ColorsManager.greenColor
                              : ColorsManager.greycolor),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Icon(
                      task.isCompleted
                          ? Icons.check_circle_outline_outlined
                          : Icons.circle,
                      color: task.isCompleted
                          ? ColorsManager.greenColor
                          : ColorsManager.greycolor,
                    ),
                    const Spacer(),
                    ButtonWidget(
                      onTap: () {
                        taskProvider.toggleTaskCompletion(task.id);
                        Navigator.pop(context);
                      },
                      title: task.isCompleted
                          ? TextManager.markAsNotDone
                          : TextManager.markAsDone,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
