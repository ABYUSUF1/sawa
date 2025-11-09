import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CustomPasswordField extends StatefulWidget {
  final String title;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? prefix;
  final void Function(String)? onChanged;

  const CustomPasswordField({
    super.key,
    required this.title,
    this.controller,
    this.validator,
    this.hintText,
    this.prefix,
    this.onChanged,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormField<String>(
      validator: widget.validator,
      builder: (state) {
        return TextField(
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          controller: widget.controller,
          obscureText: _obscure,
          onChanged: (value) {
            state.didChange(value);
            widget.onChanged?.call(value);
          },
          decoration: InputDecoration(
            labelText: widget.title,
            hintText: widget.hintText,
            prefixIcon: widget.prefix,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscure = !_obscure;
                });
              },
              icon: Icon(
                _obscure ? IconsaxPlusLinear.eye_slash : IconsaxPlusLinear.eye,
              ),
            ),
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
              borderSide: BorderSide(
                width: 5,
                color: theme.colorScheme.outline,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }
}
