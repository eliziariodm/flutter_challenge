import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    Key? key,
    required this.onChangedWidget,
    this.textCapitalizationWidget,
    required this.focusWidget,
    this.keyboardWidget,
    required this.labelWidget,
    this.textInputFormatterWidget,
    required this.onFieldSubmittedWidget,
    required this.validator,
  }) : super(key: key);

  final Function(String) onChangedWidget;

  final TextCapitalization? textCapitalizationWidget;

  final FocusNode focusWidget;

  final TextInputType? keyboardWidget;

  final String labelWidget;

  final List<TextInputFormatter>? textInputFormatterWidget;

  final Function(String) onFieldSubmittedWidget;

  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChangedWidget,
      textCapitalization: textCapitalizationWidget ?? TextCapitalization.none,
      focusNode: focusWidget,
      keyboardType: keyboardWidget,
      style: TextStyle(
        color: Get.theme.primaryColor,
        fontSize: 14.0,
      ),
      decoration: InputDecoration(
        labelText: labelWidget,
        border: const OutlineInputBorder(),
      ),
      inputFormatters: textInputFormatterWidget,
      onFieldSubmitted: onFieldSubmittedWidget,
      validator: validator,
    );
  }
}
