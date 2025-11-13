import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'phone_field_controller.dart';

class CustomPhoneField extends StatefulWidget {
  final PhoneFieldController controller;
  final bool isSearchMode;
  final void Function(String)? onValidSearch;
  final void Function()? onClear;

  const CustomPhoneField({
    super.key,
    required this.controller,
    this.isSearchMode = false,
    this.onValidSearch,
    this.onClear,
  });

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  void _handleTextChange(String value) {
    if (widget.isSearchMode && widget.controller.isValid) {
      // Use e164 instead of nationalRaw since we removed it
      widget.onValidSearch?.call(widget.controller.e164);
    }
  }

  void _handleCountryCodeChange(String? value) {
    if (value != null) {
      setState(() {
        widget.controller.setCountryCode(value, clear: widget.isSearchMode);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get current country directly
    final country = widget.controller.supportedCountries.firstWhere(
      (c) => c.code == widget.controller.countryCode,
      orElse: () => widget.controller.supportedCountries.first,
    );

    final maxLength = country.maxLength;

    return TextFormField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      controller: widget.controller.textController,
      keyboardType: TextInputType.phone,
      maxLength: maxLength,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(maxLength),
      ],
      validator: (value) => widget.controller.validate(),
      onChanged: _handleTextChange,
      decoration: InputDecoration(
        labelText: widget.isSearchMode ? 'Search by phone' : 'Phone number',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: _buildCountryCodePicker(),
        suffixIcon: _buildSuffixIcon(),
        helperText: widget.isSearchMode ? null : 'Enter your phone number',
        counterText: '', // Hide counter but keep maxLength enforcement
      ),
    );
  }

  Widget _buildCountryCodePicker() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 12, end: 8),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.controller.countryCode,
          onChanged: _handleCountryCodeChange,
          items: widget.controller.supportedCountries.map((country) {
            return DropdownMenuItem<String>(
              value: country.code,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(country.flag, style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 6),
                  Text(country.code),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    if (!widget.isSearchMode) return const Icon(Icons.phone);

    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: widget.controller.textController,
      builder: (context, value, child) {
        return value.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  widget.controller.clear();
                  widget.onClear?.call();
                },
              )
            : const Icon(Icons.search);
      },
    );
  }
}
