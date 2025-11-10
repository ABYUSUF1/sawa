import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sawa/generated/locale_keys.g.dart';

import '../../utils/controllers/phone_field_controller.dart';

const List<Map<String, String>> _countryCodes = [
  {'flag': '🇪🇬', 'code': '+20'},
  {'flag': '🇸🇦', 'code': '+966'},
  {'flag': '🇦🇪', 'code': '+971'},
  {'flag': '🇶🇦', 'code': '+974'},
  {'flag': '🇰🇼', 'code': '+965'},
];

class CustomPhoneField extends StatefulWidget {
  final PhoneFieldController controller;
  final bool hideCounter;
  final void Function(String)? onChanged;

  // Search mode specific properties
  final void Function(String value)? onValidSearch;
  final bool isSearchMode;
  final void Function()? onClear;

  const CustomPhoneField({
    super.key,
    required this.controller,
    this.hideCounter = true,
    this.onChanged,
    this.onValidSearch,
    this.isSearchMode = false,
    this.onClear,
  });

  /// A factory constructor for easily creating a search-optimized phone field.
  factory CustomPhoneField.search({
    Key? key,
    required PhoneFieldController controller,
    void Function(String value)? onValidSearch,
    void Function()? onClear,
  }) {
    return CustomPhoneField(
      key: key,
      controller: controller,
      hideCounter: true,
      isSearchMode: true,
      onValidSearch: onValidSearch,
      onClear: onClear,
    );
  }

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  // Getters are used for derived data to ensure they are always up-to-date
  // with the latest controller state without needing to store them in state variables.
  int get _expectedLength =>
      widget.controller.expectedLen[widget.controller.countryCode] ?? 8;
  int get _maxLength => _expectedLength + 1; // Allows for optional leading zero

  String get _helperText => context.tr(LocaleKeys.auth_phone_field_hint);

  /// Handles the text change event from the TextFormField.
  /// It avoids calling `setState` for performance, as UI updates for the
  /// suffix icon are handled by a `ValueListenableBuilder`.
  void _handleChange(String value) {
    widget.onChanged?.call(value);

    if (widget.isSearchMode && widget.controller.isValid) {
      widget.onValidSearch?.call(widget.controller.nationalRaw);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      controller: widget.controller.textController,
      keyboardType: TextInputType.number,
      // style: const TextStyle(fontFamily: kRobotoMonoFont),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(_maxLength),
      ],
      validator: (value) => widget.controller.validate(),
      onChanged: _handleChange,
      decoration: InputDecoration(
        labelText: widget.isSearchMode
            ? context.tr(LocaleKeys.common_search_by_phone)
            : context.tr(LocaleKeys.auth_phone),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: _buildCountryCodePicker(),
        // PERFORMANCE: ValueListenableBuilder listens to the text controller
        // and rebuilds ONLY the suffix icon when the text changes. This is
        // far more efficient than rebuilding the entire widget with setState.
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: widget.controller.textController,
          builder: (context, textValue, child) {
            return _buildSuffixIcon(textValue.text);
          },
        ),
        counterText: widget.hideCounter ? '' : null,
        helperText: widget.isSearchMode ? null : _helperText,
      ),
    );
  }

  /// Builds the interactive dropdown for selecting a country code.
  /// This widget is extracted into its own method to keep the `build` method clean.
  Widget _buildCountryCodePicker() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 12, end: 8),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.controller.countryCode,
          icon: const SizedBox.shrink(), // No dropdown arrow needed
          onChanged: (String? value) {
            if (value != null) {
              // setState is necessary here because the country code change
              // affects multiple parts of the UI (helperText, validation logic).
              setState(() {
                widget.controller.setCountryCode(
                  value,
                  clear: widget.isSearchMode,
                );
              });
            }
          },
          items: _countryCodes.map((country) {
            return DropdownMenuItem<String>(
              value: country['code'],
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(country['flag']!, style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 6),
                  Text(
                    country['code']!,
                    // style: const TextStyle(fontFamily: kRobotoMonoFont),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  /// Builds the suffix icon based on the current mode (search or normal)
  /// and the input text. This is a "pure" build function that depends only on its inputs.
  Widget _buildSuffixIcon(String textValue) {
    if (!widget.isSearchMode) {
      return const Icon(IconsaxPlusLinear.call);
    }

    // In search mode, show a clear button if there's text, otherwise a search icon.
    if (textValue.isNotEmpty) {
      return ZoomIn(
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
        child: IconButton(
          icon: const Icon(IconsaxPlusLinear.close_square),
          onPressed: () {
            widget.controller.clear();
            widget.onClear?.call();
          },
        ),
      );
    } else {
      return const Icon(IconsaxPlusLinear.search_normal);
    }
  }
}
