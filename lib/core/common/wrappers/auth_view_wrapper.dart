import 'dart:io';

import 'package:ed_chat/core/constants/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthViewWrapper extends StatelessWidget {
  final Widget body;
  final bool showCancelButton;
  const AuthViewWrapper(
      {super.key, required this.body, this.showCancelButton = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 0,
        actions: !showCancelButton
            ? null
            : [
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text('cancel'),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
      ),
      body: Platform.isIOS ? body : Padding(
        padding: EdgeInsets.only(bottom: context.bottomViewPadding),
      child: body,),
    );
  }
}
