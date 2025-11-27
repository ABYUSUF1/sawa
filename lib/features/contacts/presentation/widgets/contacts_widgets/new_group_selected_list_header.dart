import 'package:flutter/material.dart';

import '../../../domain/entities/contact_entity.dart';
import 'new_group_selected_list_item.dart';

class NewGroupSelectedListHeader extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final List<ContactEntity> selectedContacts;
  final void Function(ContactEntity) onRemove;

  NewGroupSelectedListHeader({
    required this.maxHeight,
    required this.minHeight,
    required this.selectedContacts,
    required this.onRemove,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);
    return Material(
      // use Material so elevation/shadow and ink effects (if needed) behave nicely
      color: theme.scaffoldBackgroundColor,
      elevation: overlapsContent ? 1.0 : 0.0,
      child: Container(
        height: maxHeight,
        alignment: Alignment.center,
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: selectedContacts.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final c = selectedContacts[index];
            return NewGroupSelectedListItem(
              contact: c,
              onRemove: () => onRemove(c),
            );
          },
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant NewGroupSelectedListHeader oldDelegate) {
    // rebuild when the list length or identity changes; assuming state provides new list instance on changes
    return oldDelegate.selectedContacts != selectedContacts ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.minHeight != minHeight;
  }
}
