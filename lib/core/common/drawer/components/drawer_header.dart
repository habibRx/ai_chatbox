part of '../dashboard_drawer.dart';

class ProfileDrawerHeader extends StatelessWidget {
  const ProfileDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Search bar
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(
                    color: AppColors.ruleText
                ),
                filled: true,
                fillColor: AppColors.postBackgroundColor,
                prefixIcon: Icon(Icons.search,
                    color: AppColors.ruleText
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Filter icon button
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: implement filter logic
            },
          ),
        ],
      ).withHorViewPadding,
    );

  }
}
