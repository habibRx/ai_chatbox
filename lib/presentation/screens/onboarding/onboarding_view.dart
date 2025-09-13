library on_boarding;


import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/app_theme/app_images.dart';
import '../../../core/config/app_config.dart';
import '../../../core/utils/orientation_utils.dart';
import '../../../router/app_router.dart' as AppRouter;

part 'components/on_boarding_button.dart';
part 'components/on_boarding_dot_indicator.dart';
part 'components/onboarding_images.dart';
part 'components/onboarding_text.dart';
part 'constants/constants.dart';
part 'constants/strings.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  OnBoardingViewState createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  late final PageController _controller;

  int _currentPage = 0;

  @override
  void initState() {
    _controller = PageController(viewportFraction: 0.9);
    setPortraitOrientation();
    super.initState();
  }

  @override
  void dispose() {
    resetPreferredOrientations();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          OnBoardingText(
            controller: _controller,
            pages: Constants.pages,
            currentPage: _currentPage,
          ),

          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: Constants.pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              padEnds: true,
              clipBehavior: Clip.none,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final page = Constants.pages[index];
                return OnboardingImages(controller: _controller, page: page);
              },
            ),
          ),

          DotIndicator(controller: _controller),
          const SizedBox(height: 24),
          OnBoardingButton(controller: _controller),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
