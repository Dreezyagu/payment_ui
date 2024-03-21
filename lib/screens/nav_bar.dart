import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_ui/screens/activity_report_1.dart';
import 'package:payment_ui/screens/activity_report_2.dart';
import 'package:payment_ui/utils/app_colors.dart';
import 'package:payment_ui/utils/image_util.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: const [
        ActivityReport1(),
        ActivityReport2(),
        ActivityReport1(),
        ActivityReport2(),
        ActivityReport1(),
      ],
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style17,
      onItemSelected: (value) {
        selectedIndex = value;
        setState(() {});
      },
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Transform.scale(
            scale: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 2.5, 0.0, 0.0),
              child: SvgPicture.asset(ImageUtil.home),
            ),
          ),
          title: ("Home"),
          contentPadding: 0,
          textStyle: TextStyle(
              fontSize: 10.sp,
              fontWeight:
                  0 == selectedIndex ? FontWeight.w700 : FontWeight.w400),
          activeColorPrimary: AppColors.blue100,
          inactiveColorPrimary: AppColors.grey200),
      PersistentBottomNavBarItem(
          icon: Transform.scale(
            scale: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 2.5, 0.0, 0.0),
              child: SvgPicture.asset(ImageUtil.card),
            ),
          ),
          title: ("My Card"),
          textStyle: TextStyle(
              fontSize: 10.sp,
              fontWeight:
                  1 == selectedIndex ? FontWeight.w700 : FontWeight.w400),
          activeColorPrimary: AppColors.blue100,
          inactiveColorPrimary: AppColors.grey200),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(ImageUtil.scan),
          contentPadding: 0,
          activeColorPrimary: AppColors.green,
          inactiveColorPrimary: AppColors.grey200),
      PersistentBottomNavBarItem(
          icon: Transform.scale(
            scale: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 2.5, 0.0, 0.0),
              child: SvgPicture.asset(ImageUtil.activity),
            ),
          ),
          title: ("Activity"),
          activeColorPrimary: AppColors.blue100,
          textStyle: TextStyle(
              fontSize: 10.sp,
              fontWeight:
                  3 == selectedIndex ? FontWeight.w700 : FontWeight.w400),
          inactiveColorPrimary: AppColors.grey200),
      PersistentBottomNavBarItem(
          icon: Transform.scale(
            scale: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 2.5, 0.0, 0.0),
              child: SvgPicture.asset(ImageUtil.profile),
            ),
          ),
          title: ("Profile"),
          activeColorPrimary: AppColors.blue100,
          textStyle: TextStyle(
              fontSize: 10.sp,
              fontWeight:
                  4 == selectedIndex ? FontWeight.w700 : FontWeight.w400),
          inactiveColorPrimary: AppColors.grey200),
    ];
  }
}
