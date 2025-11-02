import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghaith_test/core/constants/app_colors.dart';
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
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.whitecolor,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          TextManager.taskDetailTitle,
          style: TextStyles.heading1,
        ),
        leading: IconButton(
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
                tag: task.id,
                child: Text(
                  task.title,
                  style: TextStyles.heading2,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                task.description,
                style: TextStyles.body,
              ),
              SizedBox(height: 25.h),
              Row(
                children: [
                  Text(
                    task.isCompleted
                        ? TextManager.taskCompleted
                        : TextManager.taskUncompleted,
                    style: TextStyles.body.copyWith(
                      color: task.isCompleted
                          ? ColorsManager.greenColor
                          : ColorsManager.greycolor,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    task.isCompleted
                        ? Icons.check_circle_outline_outlined
                        : Icons.circle_outlined,
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
              ),
              SizedBox(height: 30.h),
              if (task.latitude != null && task.longitude != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TextManager.seeOnMap,
                      style: TextStyles.font13bold,
                    ),
                    SizedBox(height: 10.h),
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
                                target: LatLng(task.latitude!, task.longitude!),
                                zoom: 14.5),
                            markers: {
                              Marker(
                                  markerId: const MarkerId('Task Location'),
                                  position:
                                      LatLng(task.latitude!, task.longitude!),
                                  infoWindow: InfoWindow(title: task.title))
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
