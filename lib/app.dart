import 'package:ed_chat/presentation/bloc/app_bloc_provider.dart';
import 'package:ed_chat/presentation/bloc/cubit/cubit_provider.dart';
import 'package:ed_chat/presentation/bloc/cubit/loading_cubit/loading_cubit.dart';
import 'package:ed_chat/presentation/bloc/cubit/loading_cubit/loading_state.dart';
import 'package:ed_chat/router/app_router.dart';
import 'package:ed_chat/services/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_theme/app_theme.dart';
import 'core/common/controllers/controllers_provider.dart';
import 'core/common/overlays/loading_overlay.dart';
import 'core/common/wrappers/keyboard_dismiss_wrapper.dart';
import 'core/utils/enums.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoriesProvider(
      child: AppCubitProvider(
        child: AppBlocProvider(
          child: ControllersProvider(
            child: KeyBoardDismissWrapper(
              child: Builder(
                builder: (context) {
                  return BlocBuilder<ThemeCubit, AppThemeMode>(
                    buildWhen: (previous, current) => previous != current,
                    builder: (context, appTheme) {
                      return MaterialApp.router(
                        useInheritedMediaQuery: true,
                        theme: AppTheme.theme,
                        darkTheme: AppTheme.darkTheme,
                        themeMode: _getThemeMode(appTheme),
                        debugShowCheckedModeBanner: false,
                        routerConfig: AppRouter.router,
                        builder: (context, child) {
                          final loadingState = context
                              .watch<LoadingCubit>()
                              .state;
                          return _buildApp(
                            context,
                            child,
                            loadingState,
                            appTheme,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  ThemeMode _getThemeMode(AppThemeMode appTheme) {
    return switch (appTheme) {
      AppThemeMode.light => ThemeMode.light,
      AppThemeMode.dark => ThemeMode.dark,
      AppThemeMode.blue => ThemeMode.light, // Or handle blue theme differently
    };
  }

  Widget _buildApp(
    BuildContext context,
    Widget? child,
    LoadingState loadingState,
    AppThemeMode appTheme,
  ) {
    final isLoading = loadingState.maybeWhen(
      loading: (_, __, ___, ____, _____) => true,
      orElse: () => false,
    );

    final content = Stack(
      children: [
        if (child != null) child,
        if (isLoading)
          Positioned.fill(
            child: LoadingOverlay(
              message: loadingState.maybeWhen(
                loading: (msg, _, __, ___, _____) => msg,
                orElse: () => null,
              ),

              useFanLoader: loadingState.maybeWhen(
                loading: (_, __, useFan, ____, _____) => useFan ?? false,
                orElse: () => false,
              ),
            ),
          ),
      ],
    );

    return appTheme == AppThemeMode.blue
        ? Theme(data: AppTheme.theme, child: content)
        : content;
  }
}
