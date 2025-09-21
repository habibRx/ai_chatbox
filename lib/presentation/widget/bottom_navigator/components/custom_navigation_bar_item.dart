part of app_bottom_navigator;



class CustomNavBarItem extends StatelessWidget {
  final String image;
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final int? count;
  final Color? backgroundColor;

  const CustomNavBarItem({
    super.key,
    required this.image,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.count,
    this.backgroundColor,
  });

  const CustomNavBarItem.circle({
    super.key,
    required this.image,
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
            child: Image.asset(
              image,
              scale: 2,
              color: isSelected ? context.colorScheme.onSurface : Colors.grey,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontWeight:  FontWeight.bold,
              fontSize: 10,
              color: isSelected ? context.colorScheme.onSurface : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}