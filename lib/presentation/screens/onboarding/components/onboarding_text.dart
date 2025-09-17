part of on_boarding;

class OnBoardingText extends StatelessWidget {
  final PageController controller;
  final List<Map<String, String>> pages;
  final int currentPage;
  const OnBoardingText({Key? key, required this.controller, required this.pages, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          pages[currentPage]["title"]!,
          style:  TextStyle(
            fontSize: 22,
            color: context.colorScheme.surface,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          pages[currentPage]["subtitle"]!,
          style:  TextStyle(
            fontSize: 14,
            color: context.colorScheme.surface,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
