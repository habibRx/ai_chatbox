part of app_bottom_navigator;



class CustomNavBarItem extends StatelessWidget {
  final IconData iconData;
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final int? count;
  final Color? backgroundColor;

  const CustomNavBarItem({
    super.key,
    required this.iconData,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.count,
    this.backgroundColor,
  });

  const CustomNavBarItem.circle({
    super.key,
    required this.iconData,
    required this.label,
    required this.backgroundColor,
    this.isSelected = false,
    this.onTap,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 4),
            decoration: backgroundColor != null
                ? BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            )
                : null,
            child: Icon(
              iconData,
              size: isSelected ? 30 : 25,
              color: isSelected ? context.colorScheme.primary : Colors.grey,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontWeight:  FontWeight.bold,
              color: isSelected ? context.colorScheme.primary : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}