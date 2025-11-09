import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

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
    return TextField(
      style: const TextStyle(fontSize: 20),
      controller: controller,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 5),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: const Icon(IconsaxPlusLinear.search_normal_1),
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
        hintText: hintText ?? "Search",
        hintStyle: const TextStyle(fontSize: 20),
      ),
      onChanged: onChanged,
    );
  }
}
