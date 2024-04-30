import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poker_stats_app/router/router.dart';
import 'package:poker_stats_app/theme/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/action_button_widget.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Spacer(flex: 1),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          isLastPage = index == 1;
                        });
                      },
                      controller: controller,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Analyze your moves to improve your poker game.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                  'Master the game with our poker analysis app. ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.white40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Take your gaming strategy to the next level.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                  'Our intelligent tools will help you improve and optimize your gaming process.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.white40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 2,
                        effect: WormEffect(
                          activeDotColor: AppColors.accentGreen,
                          dotColor: AppColors.white15,
                          dotHeight: 8,
                          dotWidth: 64,
                          radius: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 4),
              ActionButtonWidget(
                  text: isLastPage ? 'Get Started' : 'Next',
                  width: MediaQuery.of(context).size.width * 0.8,
                  onTap: () {
                    isLastPage ? context.router.push(ResultRoute()) :
                    controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  }),
              Spacer(flex: 1),

            ],
          ),
        ),
      ),
    );
  }
}
