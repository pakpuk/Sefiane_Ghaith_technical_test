import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghaith_test/core/constants/app_colors.dart';
import 'package:ghaith_test/core/constants/text_manager.dart';
import 'package:ghaith_test/core/constants/text_styles.dart';
import 'package:ghaith_test/presentation/screens/task_detail_screen.dart';
import 'package:ghaith_test/presentation/widgets/task_widget.dart';
import 'package:ghaith_test/providers/task_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.whitecolor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          TextManager.mestachesTxt,
          style: TextStyles.heading1,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                taskProvider.loadTasks();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
              child: taskProvider.taskList.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          FadeInUp(
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: LottieBuilder.asset(
                                TextManager.lottieUrl,
                              ),
                            ),
                          ),
                          const Text(TextManager.noTasks),
                        ],
                      ),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: taskProvider.taskList.length,
                      itemBuilder: (context, index) {
                        final task = taskProvider.taskList[index];
                        return Dismissible(
                            key: ValueKey(task.id),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: ColorsManager.redAccent,
                              alignment: Alignment.centerRight,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.delete,
                                    color: ColorsManager.whitecolor,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    TextManager.deletetask,
                                    style: TextStyles.body.copyWith(
                                        color: ColorsManager.whitecolor),
                                  )
                                ],
                              ),
                            ),
                            onDismissed: (direction) {
                              final deletedTask = task;
                              taskProvider.deleteTask(task.id);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                duration: const Duration(seconds: 2),
                                content:
                                    Text('Tâche "${task.title}" est supprimée'),
                                action: SnackBarAction(
                                    label: TextManager.undoTxt,
                                    onPressed: () {
                                      taskProvider.restoreTask(deletedTask);
                                    }),
                              ));
                            },
                            child: TaskWidget(
                              task: task,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TaskDetailScreen(
                                              task: task,
                                            )));
                              },
                              ontoggle: () {
                                taskProvider.toggleTaskCompletion(task.id);
                              },
                            ));
                      }))),
    );
  }
}
