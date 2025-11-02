import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghaith_test/core/constants/app_colors.dart';
import 'package:ghaith_test/core/constants/font_weights.dart';
import 'package:ghaith_test/core/constants/text_manager.dart';
import 'package:ghaith_test/core/constants/text_styles.dart';
import 'package:ghaith_test/data/models/task_model.dart';
import 'package:ghaith_test/presentation/widgets/button_custom_widget.dart';
import 'package:ghaith_test/providers/task_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: true);

    final currentTask = taskProvider.taskList.firstWhere(
      (t) => t.id == task.id,
      orElse: () => task,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.whitecolor,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          TextManager.taskDetailTitle,
          style: TextStyles.heading2,
        ),
        leading: IconButton(
          iconSize: 24,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: currentTask.id,
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    currentTask.title,
                    style: TextStyles.heading2,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                currentTask.description,
                style: TextStyles.body.copyWith(height: 1.5),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Icon(
                    currentTask.isCompleted
                        ? Icons.check_circle_outline_outlined
                        : Icons.circle_outlined,
                    color: currentTask.isCompleted
                        ? ColorsManager.greenColor
                        : ColorsManager.greycolor,
                    size: 24,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    currentTask.isCompleted
                        ? TextManager.taskCompleted
                        : TextManager.taskUncompleted,
                    style: TextStyles.body.copyWith(
                      color: currentTask.isCompleted
                          ? ColorsManager.greenColor
                          : ColorsManager.greycolor,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              ButtonWidget(
                height: 56.h,
                onTap: () {
                  taskProvider.toggleTaskCompletion(currentTask.id);
                },
                title: currentTask.isCompleted
                    ? TextManager.markAsNotDone
                    : TextManager.markAsDone,
              ),
              SizedBox(height: 32.h),
              if (currentTask.latitude != null && currentTask.longitude != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TextManager.seeOnMap,
                      style: TextStyles.taskTitle,
                    ),
                    SizedBox(height: 16.h),
                    Container(
                        height: 250.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: ColorsManager.textfieldbordercolor,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                                target: LatLng(currentTask.latitude!,
                                    currentTask.longitude!),
                                zoom: 14.5),
                            markers: {
                              Marker(
                                  markerId: const MarkerId('Task Location'),
                                  position: LatLng(currentTask.latitude!,
                                      currentTask.longitude!),
                                  infoWindow:
                                      InfoWindow(title: currentTask.title))
                            },
                            zoomControlsEnabled: false,
                            myLocationButtonEnabled: false,
                            compassEnabled: true,
                          ),
                        )),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
