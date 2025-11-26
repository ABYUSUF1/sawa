import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sawa/core/router/app_route_name.dart';
import '../../riverpod/chat_rooms_providers.dart';

class ChatsList extends ConsumerWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatRooms = ref.watch(chatRoomsNotifierProvider);

    return chatRooms.when(
      loading: () => const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      error: (err, _) =>
          SliverToBoxAdapter(child: Center(child: Text('Error: $err'))),
      data: (rooms) {
        if (rooms == null || rooms.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(child: Text("No chats yet")),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final room = rooms[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.accents[index % Colors.accents.length],
                child: Text(room.name[0].toUpperCase()),
              ),
              title: Text(room.name),
              subtitle: Text(room.lastMessagePreview ?? "No messages yet"),
              trailing: Text(
                room.lastMessageAt != null
                    ? _formatTime(room.lastMessageAt!)
                    : "",
              ),
              onTap: () {
                context.pushNamed(
                  AppRouteNames.conversation,
                  pathParameters: {'chatId': room.id},
                );
              },
            );
          }, childCount: rooms.length),
        );
      },
    );
  }

  String _formatTime(DateTime dt) {
    final hour = dt.hour > 12 ? dt.hour - 12 : dt.hour;
    final minute = dt.minute.toString().padLeft(2, '0');
    final period = dt.hour >= 12 ? "PM" : "AM";
    return "$hour:$minute $period";
  }
}
