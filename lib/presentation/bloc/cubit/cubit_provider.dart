import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_theme/app_theme.dart';
import '../../../services/user_service.dart';
import 'loading_cubit/loading_cubit.dart';
import 'user_cubit/user_cubit.dart';

class AppCubitProvider extends StatelessWidget {
  final Widget child;
  const AppCubitProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),

        BlocProvider<LoadingCubit>(
          create: (context) => LoadingCubit(),
        ),
        BlocProvider<UserCubit>(
          lazy: false,
          create: (context) => UserCubit(
            context.read<UserService>(),
            context.read<LoadingCubit>(),
          ),
        ),


        // BlocProvider<TradeBloc>(
        //   create: (context) => TradeBloc(
        //     context.read<TradeService>(),
        //     context.read<LoadingCubit>(),
        //     context.read<PinataService>(),
        //     context.read<UserCubit>(),
        //   )
        //     ..add(const TradeEvent.loadTrades()),
        // ),


        // BlocProvider<AuthCubit>(
        //   create: (context) => AuthCubit(
        //       context.read<UserCubit>(),
        //       context.read<UserService>(),
        //       context.read<LoadingCubit>(),
        //       context.read<WalletService>(),
        //       context.read<FirebaseService>()),
        // )
      ],
      child: child,
    );
  }
}
