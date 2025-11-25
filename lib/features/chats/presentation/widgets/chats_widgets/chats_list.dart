import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sawa/core/router/app_route_name.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(
          leading: CircleAvatar(
            // Simple placeholder image
            backgroundColor: Colors.accents[index % Colors.accents.length],
            child: Text(
              'U${index + 1}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(
            'Mahmoud Glal${index + 1}',
            style: theme.textTheme.titleMedium,
          ),
          subtitle: const Text('Last message goes here...'),
          trailing: Text('10:3$index AM'),
          onTap: () {
            context.pushNamed(AppRouteNames.conversation);
          },
        ),
        childCount: 20, // Example: 20 chats
      ),
    );
  }
}
