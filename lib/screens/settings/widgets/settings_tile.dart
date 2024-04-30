import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poker_stats_app/theme/colors.dart';

class SettingsTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final void Function()? onTap;

  const SettingsTile({super.key, required this.iconPath, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: AppColors.white10,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: SvgPicture.asset(iconPath),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(title, style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.white,
            ),),
          ),
          Icon(Icons.arrow_forward_ios, size: 20, color: AppColors.white40),
        ],
      ),
    );
  }
}