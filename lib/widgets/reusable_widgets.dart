import 'package:flutter/material.dart';
import 'package:kundali_gpt/constants/constant.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.prefixIcon,
    this.keyboardType,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...{
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text(
              widget.labelText!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        },
        const SizedBox(
          height: defaultPadding / 2,
        ),
        TextFormField(
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          controller: widget.controller,
          obscureText: widget.obscureText,
          cursorColor: Theme.of(context).primaryColor,
          style: Theme.of(context).textTheme.titleMedium,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
          onSaved: widget.onSaved,
          validator: widget.validator,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}

class CustomField extends StatefulWidget {
  final String? labelText;
  final Widget widget1;

  const CustomField({Key? key, this.labelText, required this.widget1})
      : super(key: key);

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...{
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text(
              widget.labelText!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        },
        const SizedBox(
          height: defaultPadding / 2,
        ),
        Container(
          width: double.infinity,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: Center(
            child: widget.widget1,
          ),
        ),
      ],
    );
  }
}
