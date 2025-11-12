import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../generated/locale_keys.g.dart';

class CustomSearchField extends StatelessWidget {
  final String? hintText;
  final void Function(String)? onChanged;
  final VoidCallback? onClear;
  final TextEditingController? controller;
  const CustomSearchField({
    super.key,
    this.hintText,
    this.onChanged,
    this.controller,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        prefixIcon: const Icon(IconsaxPlusLinear.search_normal),
        suffixIcon: controller?.text.isNotEmpty ?? false
            ? ZoomIn(
                child: IconButton(
                  onPressed: () {
                    controller?.clear();
                    onClear?.call();
                  },
                  icon: const Icon(Icons.clear),
                ),
              )
            : null,
        hintText: hintText ?? context.tr(LocaleKeys.common_search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: theme.colorScheme.surfaceContainerHigh,
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
      ),
      onChanged: onChanged,
    );
  }
}
