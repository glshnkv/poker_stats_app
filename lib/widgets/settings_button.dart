import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poker_stats_app/router/router.dart';
import 'package:poker_stats_app/theme/colors.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(SettingsRoute());
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.white10,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/settings/settings.svg'),
            SizedBox(width: 4),
            Text(
              'Settings',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
