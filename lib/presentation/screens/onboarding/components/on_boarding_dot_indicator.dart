part of on_boarding;

class DotIndicator extends StatelessWidget {
  final PageController controller;
  const DotIndicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          int currentPage = controller.page?.round() ?? 0;

          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.viewPaddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) {
                  bool isActive = currentPage == index;
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: isActive ? Constants.dotIndicatorSize.width : Constants.dotIndicatorSize.width*.50,
                    height: isActive ? Constants.dotIndicatorSize.height : Constants.dotIndicatorSize.height*.50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: context.colorScheme.onSurface),
                      color: isActive
                          ? context.colorScheme.onSurface
                          : context.colorScheme.surface.withOpacity(.50),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
