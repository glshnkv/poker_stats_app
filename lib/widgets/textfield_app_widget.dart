
import 'package:flutter/material.dart';
import 'package:poker_stats_app/theme/colors.dart';

class TextFieldAppWidget extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;


  const TextFieldAppWidget({
    super.key,
    required this.controller,
    required this.title, required this.hintText,
  });

  @override
  State<TextFieldAppWidget> createState() => _TextFieldAppWidgetState();
}

class _TextFieldAppWidgetState extends State<TextFieldAppWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.white40,
            ),
          ),
        ),
        SizedBox(height: 5),
        TextField(
          style: TextStyle(color: AppColors.white),
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColors.white15),
            filled: true,
            fillColor: AppColors.white10,
            contentPadding:
            EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(16))),
          ),
        ),
      ],
    );
  }
}