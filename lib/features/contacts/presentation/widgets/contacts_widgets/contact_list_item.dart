import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sawa/core/riverpod/auth/global_auth_provider.dart';
import 'package:sawa/core/router/app_route_name.dart';
import '../../../../chats/domain/entity/chat_room_entity.dart';
import '../../../../chats/presentation/riverpod/chat_rooms_providers.dart';
import '../../../../conversation/presentation/args/conversation_args.dart';
import '../../../domain/entities/contact_entity.dart';
import '../../riverpod/contacts_providers.dart';
import '../../riverpod/notifiers/contacts_state.dart';

class ContactListItem extends ConsumerWidget {
  final ContactEntity contact;
  final bool selectable;
  final bool navigateOnTap;

  const ContactListItem({
    super.key,
    required this.contact,
    this.selectable = false,
    this.navigateOnTap = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(contactsNotifierProvider);
    final notifier = ref.read(contactsNotifierProvider.notifier);

    final isSelectionMode = state is ContactsSuccess && state.isSelectionMode;
    final isSelected =
        state is ContactsSuccess && state.selectedContacts.contains(contact);

    final theme = Theme.of(context);

    return Container(
      color: isSelected
          ? theme.colorScheme.primary.withValues(alpha: .08)
          : null,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: Text(
            contact.contactName.isNotEmpty
                ? contact.contactName[0].toUpperCase()
                : '?',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        title: Text(contact.contactName),
        subtitle: contact.isAppUser
            ? (contact.user == null || contact.user!.isBioEmpty
                  ? null
                  : Text(contact.user!.bio ?? ''))
            : Text(contact.phoneNumber),
        trailing: selectable
            ? Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                  color: isSelected ? theme.colorScheme.primary : null,
                ),
                child: isSelected
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : null,
              )
            : (contact.isAppUser
                  ? null
                  : Text(
                      "Invite",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    )),
        // Tap logic depends on selectable flag:
        onTap: () async {
          if (selectable) {
            // If already in selection mode, toggle. Otherwise, start selection mode
            if (isSelectionMode) {
              notifier.toggleContactSelection(contact);
            } else {
              // start selection mode and select this contact
              notifier.enterSelectionMode(contact);
            }
            return;
          }

          // Non-selectable: normal behavior (navigate only if allowed)
          if (contact.isAppUser && navigateOnTap) {
            final updated = await notifier.onContactTap(contact);
            if (updated != null && context.mounted) {
              final chatNotifier = ref.read(chatRoomsNotifierProvider.notifier);
              final currentUser = ref.read(globalAuthProvider).value!;
              await chatNotifier
                  .getDirectChatRoom(otherUserId: updated.user!.id)
                  .then((existingRoom) {
                    final chat =
                        existingRoom ??
                        ChatRoomEntity.newChatRoomEntity(
                          currentUser: currentUser,
                          otherUser: updated.user!,
                        );
                    if (context.mounted) {
                      context.pushNamed(
                        AppRouteNames.conversation,
                        extra: ConversationArgs.direct(
                          room: chat,
                          otherUser: updated.user!,
                          isExistingRoom: existingRoom != null,
                        ),
                      );
                    }
                  });
            }
          } else {
            // Invite flow or do nothing depending on your app
          }
        },

        // Long press: only used to begin selection when selectable true.
        onLongPress: selectable
            ? () {
                if (!isSelectionMode) {
                  notifier.enterSelectionMode(contact);
                } else {
                  notifier.toggleContactSelection(contact);
                }
              }
            : null,
      ),
    );
  }
}
