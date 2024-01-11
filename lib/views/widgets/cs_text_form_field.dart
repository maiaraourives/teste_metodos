import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CsTextFormField<T> extends StatelessWidget {
  const CsTextFormField({
    this.inputFormatters,
    this.hintText,
    this.labelText,
    this.maxLength,
    this.validator,
    this.obscureText = false,
    this.autocorrect = true,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.keyboardType,
    this.enabled = true,
    super.key,
  });

  final bool enabled;
  final int? maxLength;
  final String? hintText;
  final bool autocorrect;
  final bool obscureText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(borderSide: const BorderSide(width: 1, color: Colors.purple), borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 1, color: Colors.purple), borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 1, color: Colors.purple), borderRadius: BorderRadius.circular(10)),
      ),
      inputFormatters: inputFormatters,

      onTap: onTap,
      maxLength: maxLength,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged, //Atualiza o valor do campo NA HORA
      onSaved: onSaved, //Atualiza o valor do campo APÓS o submit
      enabled: enabled, //Desabilita o campo
    );
  }
}
