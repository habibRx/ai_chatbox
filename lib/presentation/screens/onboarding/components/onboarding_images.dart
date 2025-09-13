part of on_boarding;

class OnboardingImages extends StatelessWidget {
  final PageController controller;
 final  Map<String, String> page;
  const OnboardingImages({super.key, required this.controller, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          page["image"]!,
          fit: BoxFit.cover,
        ),
      ),
    ).withContentPadded;

  }
}
