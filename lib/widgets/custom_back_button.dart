import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poker_stats_app/router/router.dart';
import 'package:poker_stats_app/theme/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          context.router.push(ResultRoute());
        },
        child: SizedBox(
          width: 32,
          height: 32,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.accentGreen,
                borderRadius: BorderRadius.all(Radius.circular(100.0))),
            child: Center(child: SvgPicture.asset('assets/images/settings/arrow.svg')),
          ),
        ),
      ),
    );
  }
}
