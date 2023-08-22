import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../utils/debouncer.dart';

class CommentTextField extends StatefulWidget {
  const CommentTextField({
    super.key,
    this.controller,
    required this.onTextChange,
    required this.hintText,
  });
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String> onTextChange;

  @override
  State<CommentTextField> createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {
  late final textController = widget.controller ?? TextEditingController();
  final debouncer = Debouncer();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide.none,
    );
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: textTheme.bodyLarge?.copyWith(
          color: AppColors.neutral05,
          height: 1.5,
        ),
        contentPadding: const EdgeInsets.all(12),
        hoverColor: AppColors.neutral10,
        fillColor: AppColors.neutral09,
        border: textFieldBorder,
        errorBorder: textFieldBorder,
        enabledBorder: textFieldBorder,
        focusedBorder: textFieldBorder,
        disabledBorder: textFieldBorder,
        focusedErrorBorder: textFieldBorder,
      ),
      onChanged: (value) {
        setState(() {});
        debouncer.run(() => widget.onTextChange(value));
      },
    );
  }
}
