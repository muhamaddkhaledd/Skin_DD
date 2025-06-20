import 'package:flutter/material.dart';

import 'package:skin_dd/features/drawer/presentation/ui/custom_drawer.dart';
import 'package:skin_dd/features/home/presentation/ui/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> animation;

  late AnimationController controller;
  late Animation<double> _scaleAnimation;
  String userId = '';
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      reverseDuration: Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(controller);
    animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0.5, 0.1),
    ).animate(controller);
    /* userId =
        SharedPreferencesHelper.getDate(
          key: SharedPrefConstans.userId,
        ).toString();
    context.read<ScannerCubit>().geAlltDiagnosis(userId: userId);*/

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomDrawer(),
        SlideTransition(
          position: animation,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()
                      ..rotateZ(0.2 * controller.value)
                      ..scale(_scaleAnimation.value), // زاوية دوران خفيفة
                child: HomeView(
                  controllerValue: controller.value,
                  onTap: () {
                    controller.value == 0
                        ? controller.forward()
                        : controller.reverse();
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
