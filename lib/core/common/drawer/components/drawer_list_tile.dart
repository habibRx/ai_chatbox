part of '../dashboard_drawer.dart';


class DrawerTileList extends StatelessWidget with FirebaseAuthenticationMixin {
  DrawerTileList({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

    void closeDrawer() =>
        context.read<AppScaffoldController>().closeEndDrawer();

    void clearDashboardCubit() {
      context.read<UserCubit>().clear();
    }
    final List<Map<String, dynamic>> chats = List.generate(20, (index) => {
      'id': 'chat_${index + 1}',
      'title': 'Chat ${index + 1}',
      'lastMessage': 'Last message ${index + 1}',
      'unreadCount': index % 5 == 0 ? index + 1 : 0,
      'isSelected': currentRoute == '${AppRoutes.chat}/chat_${index + 1}',
    });

    return Column(
      children: [
        Expanded(
          child: Container(
            color:context.colorScheme.surface,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: Row(
                    children: [
                      Text(
                        'Your Chats',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(Icons.add, size: 20, color: Theme.of(context).colorScheme.onSurface),
                        onPressed: () {
                          closeDrawer();
                        },
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                    color: Theme.of(context).colorScheme.surface,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 8),
                      itemCount: chats.length,
                      itemBuilder: (context, index) {
                        final chat = chats[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: chat['isSelected']
                                ? Theme.of(context).colorScheme.secondaryContainer
                                : Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              chat['title'],
                              style: TextStyle(
                                color: chat['isSelected']
                                    ? Theme.of(context).colorScheme.onSecondaryContainer
                                    : Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: chat['unreadCount'] > 0
                                ? Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.error,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${chat['unreadCount']}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onError,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                                : null,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                            onTap: () {
                              closeDrawer();
                              AppRouter.router.go('${AppRoutes.chat}/${chat['id']}');
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Menu Items
              ],
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(Icons.person, size: 20, color: Theme.of(context).colorScheme.onPrimary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Profile',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      'View and edit profile',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios, size: 16, color: Theme.of(context).colorScheme.onSurface),
                onPressed: () {
                  closeDrawer();
                  AppRouter.router.go(AppRoutes.profile);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}