import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghaith_test/core/constants/app_colors.dart';
import 'package:ghaith_test/core/constants/text_manager.dart';
import 'package:ghaith_test/core/constants/text_styles.dart';
import 'package:ghaith_test/presentation/screens/task_detail_screen.dart';
import 'package:ghaith_test/presentation/widgets/task_List_widget.dart';
import 'package:ghaith_test/presentation/widgets/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TaskDetailScreen()));
        },
        child: const Icon(
          Icons.add,
          color: ColorsManager.whitecolor,
        ),
      ),
      appBar: AppBar(
        title: const Text(TextManager.mestachesTxt),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return TaskWidget();
                  }))),
    );
  }
}
