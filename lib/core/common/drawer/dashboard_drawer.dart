library profile_drawer;

import 'dart:async';

import 'package:ed_chat/core/app_theme/app_colors.dart';
import 'package:ed_chat/core/constants/extensions/context.dart';
import 'package:ed_chat/core/constants/extensions/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../router/app_router.dart';
import '../../../presentation/bloc/cubit/loading_cubit/loading_cubit.dart';
import '../../../presentation/bloc/cubit/user_cubit/user_cubit.dart';
import '../../../router/app_routes.dart';
import '../../app_theme/app_images.dart';
import '../../config/mixins/authenticaiton_mixin.dart';
import '../controllers/app_scaffold_controller.dart';


part 'components/drawer_header.dart';
part 'components/drawer_list_tile.dart';
part 'constants/strings.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      shadowColor: Colors.black,
      width: context.viewSize.width*.85,
      backgroundColor: context.colorScheme.surface,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileDrawerHeader(),
            Divider(
              color: AppColors.lowOpacityTextColor,

            ),

            SizedBox(
              height: context.viewSize.height*.82,
              child: DrawerTileList(),
            ),


          ],
        ),
      )
    );
  }
}
