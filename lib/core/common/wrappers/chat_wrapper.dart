import 'dart:io';

import 'package:ed_chat/core/constants/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../controllers/app_scaffold_controller.dart';

class ChatWrapper extends StatelessWidget {
  final Widget body;
  const ChatWrapper(
      {super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text("New Chat") ,
        centerTitle: true,
        leading:  IconButton(onPressed: (){
          context.read<AppScaffoldController>().openDrawer();        },
            icon: Icon(Icons.menu)) ,
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.mark_unread_chat_alt_outlined))
        ]
      ),
      body: Platform.isIOS ? body : Padding(
        padding: EdgeInsets.only(bottom: context.bottomViewPadding),
        child: body,),
    );
  }
}
