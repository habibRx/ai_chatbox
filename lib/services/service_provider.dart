
import 'package:ed_chat/services/pinata_service.dart';
import  'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_service.dart';

class RepositoriesProvider extends StatelessWidget {
  final Widget child;
  const RepositoriesProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserService>(
          lazy: true,
          create: (context) => UserService(),
        ),

        RepositoryProvider<PinataService>(
          lazy: true,
          create: (context) => PinataService(),
        ),

        // RepositoryProvider<TradeService>(
        //   lazy: true,
        //   create: (context) => TradeService(),
        // ),
      ],
      child: child,
    );
  }
}
