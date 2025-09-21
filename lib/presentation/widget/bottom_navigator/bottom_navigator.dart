library app_bottom_navigator;

import 'package:ed_chat/core/constants/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/app_images.dart';
import '../../../core/app_theme/sizes.dart';
import '../../../core/common/controllers/app_scaffold_controller.dart';
import '../../../core/config/mixins/authenticaiton_mixin.dart';
import '../../../core/utils/orientation_utils.dart';

part 'components/bottom_navigator_icon.dart';
part 'components/custom_bottom_navigator.dart';
part 'components/custom_navigation_bar_item.dart';
part 'constants/constants.dart';
part 'constants/strings.dart';

class AppBottomNavigator extends StatefulWidget {
  final StatefulNavigationShell child;
  final bool showBnb;

  const AppBottomNavigator({
    super.key,
    required this.child,
    required this.showBnb,
  });

  @override
  State<AppBottomNavigator> createState() => _AppBottomNavigatorState();
}

class _AppBottomNavigatorState extends State<AppBottomNavigator>
    with FirebaseAuthenticationMixin {
  @override
  void initState() {
    super.initState();
    onSessionExpire(context);
    setPortraitOrientation();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // restoreSession(context);
    // });
  }

  @override
  void dispose() {
    resetPreferredOrientations();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dashStitch = <({
      int index,
      Color? backgroundColor,
      String image,
      bool isSwitcher,
      String label,
      int? notificationCount,
    })>[
      (
        index: 0,
        image : AppImages.homeActive,
        label: "Home",
        isSwitcher: false,
        backgroundColor: null,
        notificationCount: null
      ),
      (
        index: 1,
      image : AppImages.exploreActive,
        label: "Explore",
        isSwitcher: false,
        backgroundColor: null,
        notificationCount: null
      ),
      (
        index: 2,
      image : AppImages.historyActive,
        label: "History",
        isSwitcher: false,
      backgroundColor: null,
        notificationCount: null
      ),
      (
        index: 3,
      image : AppImages.profileActive,
        label: "Profile",
        isSwitcher: false,
        backgroundColor: null,
        notificationCount: null
      ),

    ];


    void onChange(({int index, String? switcher}) po) {
      widget.child.goBranch(
        po.index,
        initialLocation: po.index == widget.child.currentIndex,
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
        drawerScrimColor: Colors.black54,
        key: context.read<AppScaffoldController>().key,
        // drawer: DashboardDrawer(),

        // endDrawer: widget.child.currentIndex <= 4
        //     ? const DashboardDrawer()
        //     : const EcobookDrawer(),
        body: widget.child,
        persistentFooterAlignment: AlignmentDirectional.center,
        // persistentFooterButtons: context
        //             .watch<TripsCubit>()
        //             .state
        //             .hasActiveRental &&
        //         ![1, 3, 4, 5, 6, 7, 8, 9].contains(widget.child.currentIndex)
        //     ? [const SmartCarControls()]
        //     : null,
        bottomNavigationBar: CustomBottomNavigationBar(
          onTap: onChange,
          currentIndex: widget.child.currentIndex,
          items: dashStitch,
        )
        );
  }
}


// final x = BottomNavigationBar(
//   currentIndex: widget.child.currentIndex,  
//   onTap: (index) {
//     widget.child.goBranch(
//       index,
//       initialLocation: index == widget.child.currentIndex,
//     );
//   },
//   items: const [
//     BottomNavigationBarItem(
//       icon: BottomNavigationIcon(
//         color: AppColors.inActiveBottomNavigationColor,
//         name: AppImages.homeIcon,
//       ),
//       activeIcon: BottomNavigationIcon(
//         name: AppImages.homeIcon,
//       ),
//       label: Strings.homeMenu,
//     ),
//     BottomNavigationBarItem(
//       icon: BottomNavigationIcon(
//         color: AppColors.inActiveBottomNavigationColor,
//         name: AppImages.categoryIcon,
//       ),
//       activeIcon: BottomNavigationIcon(
//         name: AppImages.categoryIcon,
//       ),
//       label: Strings.tripsMenu,
//     ),
//     BottomNavigationBarItem(
//       icon: BottomNavigationIcon(
//         color: AppColors.inActiveBottomNavigationColor,
//         name: AppImages.ecoBookIcon,
//       ),
//       activeIcon: BottomNavigationIcon(
//         name: AppImages.ecoBookIcon,
//       ),
//       label: Strings.ecoBookMenu,
//     ),
//     BottomNavigationBarItem(
//       icon: BottomNavigationIcon(
//         color: AppColors.inActiveBottomNavigationColor,
//         name: AppImages.savedIcon,
//       ),
//       activeIcon: BottomNavigationIcon(
//         name: AppImages.savedIcon,
//       ),
//       label: Strings.savedMenu,
//     ),
//     BottomNavigationBarItem(
//       icon: BottomNavigationIcon(
//         color: AppColors.inActiveBottomNavigationColor,
//         name: AppImages.profileIcon,
//       ),
//       activeIcon: BottomNavigationIcon(
//         name: AppImages.profileIcon,
//       ),
//       label: Strings.profileMenu,
//     ),
//   ],
// );
