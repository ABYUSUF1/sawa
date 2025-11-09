import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final bool? readOnly;
  final void Function(String)? onChanged;
  final int? maxLines;

  const CustomTextField({
    super.key,
    required this.title,
    this.controller,
    this.validator,
    this.hintText,
    this.prefix,
    this.keyboardType,
    this.onTap,
    this.readOnly,
    this.onChanged,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormField<String>(
      validator: validator,
      builder: (state) {
        return TextField(
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          controller: controller,
          onChanged: (value) {
            state.didChange(value);
            onChanged?.call(value);
          },
          onTap: onTap,
          maxLines: maxLines ?? 1,
          minLines: 1,
          readOnly: readOnly ?? false,
          keyboardType: keyboardType,
          inputFormatters: [
            if (keyboardType == TextInputType.number ||
                keyboardType == TextInputType.phone)
              FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            labelText: title,
            hintText: hintText,
            prefixIcon: prefix,
            error: state.hasError
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        IconsaxPlusLinear.danger,
                        color: theme.colorScheme.error,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          state.errorText!,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: theme.colorScheme.error,
                          ),
                        ),
                      ),
                    ],
                  )
                : null,

            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 5),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }
}
