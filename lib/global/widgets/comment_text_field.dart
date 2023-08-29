import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../utils/debouncer.dart';

class CommentTextField extends StatefulWidget {
  const CommentTextField({
    super.key,
    this.controller,
    required this.onTextChange,
    required this.hintText,
    required this.onTapSend,
  });
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String> onTextChange;
  final void Function(String) onTapSend;

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
      controller: textController,
      onFieldSubmitted: (value) {
        widget.onTapSend(value);
        textController.clear();
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: textTheme.bodyLarge?.copyWith(
          color: AppColors.neutral05,
          height: 1.5,
        ),
        suffixIcon: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.hardEdge,
          child: IconButton(
            onPressed: () {
              widget.onTapSend(textController.text);
              textController.clear();
            },
            icon: const Icon(Icons.send),
            hoverColor: AppColors.neutral09,
          ),
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
