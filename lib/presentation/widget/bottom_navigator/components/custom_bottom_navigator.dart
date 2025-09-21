part of app_bottom_navigator;

class CustomBottomNavigationBar extends StatelessWidget {
  final void Function(({int index, String? switcher}))? onTap;
  final List<
      ({
      int index,
      String image,
      String label,
      bool isSwitcher,
      Color? backgroundColor,
      int? notificationCount,
      })> items;
  final int? currentIndex;
  final EdgeInsets padding;
  final EdgeInsets innerPadding;
  final BorderRadiusGeometry borderRadius;

  const CustomBottomNavigationBar({
    Key? key,
    this.currentIndex = 0,
    this.onTap,
    required this.items,
    this.padding = const EdgeInsets.only(top: 15),
    this.innerPadding = const EdgeInsets.only(bottom: 2, left: 2, right: 2),
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom != 0 ? 0 : 5;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: bottomPadding.toDouble()),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(items.length, (index) {
            final itemData = items[index];
            if (itemData.isSwitcher) {
              if (itemData.backgroundColor == null) {
                throw 'Background color cannot be null';
              }
              return Expanded(
                child: CustomNavBarItem.circle(
                  image: itemData.image,
                  label: itemData.label,
                  isSelected: currentIndex == itemData.index,
                  backgroundColor: itemData.backgroundColor!,
                  onTap: () => onTap?.call(
                      (index: itemData.index, switcher: itemData.label)),
                  count: itemData.notificationCount,
                ),
              );
            }
            return Expanded(
              child: CustomNavBarItem(
                count: itemData.notificationCount,
                image: itemData.image,
                label: itemData.label,
                isSelected: currentIndex == itemData.index,
                onTap: () =>
                    onTap?.call((index: itemData.index, switcher: null)),
              ),
            );
          }),
        ),
      ),
    );
  }
}

