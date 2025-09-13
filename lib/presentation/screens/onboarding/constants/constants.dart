part of on_boarding;

@immutable
class Constants {
  const Constants._();

  static const List<Map<String, String>> pages = [
    {
      "title": "Discover something new",
      "subtitle": "Special new arrivals just for you",
      "image":
      "assets/images/splash/splashOne.jpg",
    },
    {
      "title": "Exclusive Styles",
      "subtitle": "Latest trends for every occasion",
      "image": "assets/images/splash/splashTwo.jpg",
    },
    {
      "title": "Shop Now",
      "subtitle": "Find your perfect outfit today",
      "image": "assets/images/splash/splashThree.jpg",
    },
  ];

  static const Size dotIndicatorSize = Size(AppSizes.size12, AppSizes.size12);

  static final List<String> onBoardingImages = [
   AppImages.onboardingImage1,
    AppImages.onboardingImage2,
    AppImages.onboardingImage3,
  ];

  static const List onBoardingPrompts = [
    {'title': Strings.curatedTitle, 'subtitle': Strings.curatedSubtitle, 'image' : AppImages.onboardingImage1},
    {'title': Strings.deliveryTitle, 'subtitle': Strings.deliverySubtitle,'image' : AppImages.onboardingImage2},
    {'title': Strings.seamlessTitle, 'subtitle': Strings.seamlessSubtitle, 'image' : AppImages.onboardingImage3},
  ];

  static const double dotIndicatorBorderRadius = 4;

  static const Size onBoardingButtonMinimumSize =
      Size(AppSizes.size100, AppSizes.size45);

  static const double onBoardingButtonBorderRadius = AppSizes.size10;
  static const double onBoardingTextContainerHeight = 150;

  static Duration nextPageAnimationDuration = 500.milliseconds;
  static const nextPageAnimationCurve = Curves.fastEaseInToSlowEaseOut;
}
