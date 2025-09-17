part of on_boarding;

class OnboardingImages extends StatelessWidget {
  final PageController controller;
 final  Map<String, String> page;
  const OnboardingImages({super.key, required this.controller, required this.page});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        page["image"]!,
        fit: BoxFit.cover,
      ),
    ).withContentPadded;

  }
}
