import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poker_stats_app/router/router.dart';
import 'package:poker_stats_app/screens/settings/widgets/settings_tile.dart';
import 'package:poker_stats_app/theme/colors.dart';
import 'package:poker_stats_app/widgets/app_container.dart';
import 'package:poker_stats_app/widgets/custom_back_button.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
        leading: CustomBackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Give us 5 star!',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Your feedback helps us to improve',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.white40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/settings/image.png',
                      width: 110,
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              AppContainer(
                child: Column(
                  children: [
                    SettingsTile(iconPath: 'assets/images/settings/terms.svg', title: 'Terms of use', onTap: () {}),
                    SizedBox(height: 10),
                    Divider(thickness: 0.2, color: AppColors.white40),
                    SizedBox(height: 10),
                    SettingsTile(iconPath: 'assets/images/settings/privacy.svg', title: 'Privacy Policy', onTap: () {}),
                    SizedBox(height: 10),
                    Divider(thickness: 0.2, color: AppColors.white40),
                    SizedBox(height: 10),
                    SettingsTile(iconPath: 'assets/images/settings/support.svg', title: 'Support page', onTap: () {}),
                    SizedBox(height: 10),
                    Divider(thickness: 0.2, color: AppColors.white40),
                    SizedBox(height: 10),
                    SettingsTile(iconPath: 'assets/images/settings/share.svg', title: 'Share with friends', onTap: () {}),
                    SizedBox(height: 10),
                    Divider(thickness: 0.2, color: AppColors.white40),
                    SizedBox(height: 10),
                    SettingsTile(iconPath: 'assets/images/settings/subs.svg', title: 'Subscription info', onTap: () {}),
                  ],
                ),
              ),
              SizedBox(height: 15),

            ],
          ),
        ),
      ),
    );
  }
}
