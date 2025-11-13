import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../../generated/locale_keys.g.dart';

class CustomPhoneField extends StatelessWidget {
  final TextEditingController controller;
  const CustomPhoneField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // TO keep the hint LTR
      child: PhoneFormField(
        autofocus: true,
        autovalidateMode: null,
        onTapOutside: (p0) => FocusScope.of(context).unfocus(),
        initialValue: const PhoneNumber(isoCode: IsoCode.EG, nsn: ''),
        validator: (value) => value == null || !value.isValid()
            ? context.tr(LocaleKeys.validators_phone_invalid)
            : null,
        decoration: InputDecoration(
          hintTextDirection: TextDirection.ltr, // TO keep the hint LTR
          labelText: context.tr(LocaleKeys.auth_phone),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        shouldLimitLengthByCountry: true,
        onChanged: (p0) {
          if (p0.isValid()) {
            controller.text = p0.international;
          } else {
            controller.clear();
          }
          print('Phone changed: ${controller.text}');
        },
      ),
    );
  }
}
