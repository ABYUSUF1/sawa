import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../../core/constants/app_assets.dart';
import 'chats_pop_menu_button.dart';
import 'chats_search_bar.dart';

class ChatsAppBar extends StatelessWidget {
  const ChatsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      // Pinned: true keeps the app bar visible at the top when you scroll.
      pinned: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      surfaceTintColor: theme.scaffoldBackgroundColor,
      shadowColor: theme.colorScheme.shadow,
      elevation: 1,

      title: VectorGraphic(
        loader: const AssetBytesLoader(AppAssets.logosSawaLogo),
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          theme.colorScheme.onSurface,
          BlendMode.srcIn,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(IconsaxPlusLinear.camera),
        ),
        const ChatsPopMenuButton(),
      ],
      bottom: const ChatsSearchBar(),
    );
  }
}
