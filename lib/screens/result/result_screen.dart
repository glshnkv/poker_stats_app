import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_stats_app/router/router.dart';
import 'package:poker_stats_app/screens/result/bloc/result_bloc.dart';
import 'package:poker_stats_app/screens/result/bloc/result_bloc.dart';
import 'package:poker_stats_app/theme/colors.dart';
import 'package:poker_stats_app/widgets/action_button_widget.dart';
import 'package:poker_stats_app/widgets/app_container.dart';
import 'package:poker_stats_app/widgets/settings_button.dart';

@RoutePage()
class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        automaticallyImplyLeading: false,
        title: Text(
          'Poker chance',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: AppColors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SettingsButton(),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            create: (context) => ResultBloc()..add(GetResultEvent()),
            child: BlocConsumer<ResultBloc, ResultState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is EmptyResultState) {
                  return AppContainer(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/chance-list/empty.png'),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start analyzing your victories',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Analyze your successes and keep track of victories according to various parameters.',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.white40,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ActionButtonWidget(
                          text: 'Start',
                          width: double.infinity,
                          onTap: () {
                            context.router.push(AnalysisRoute());
                          }),
                    ],
                  ));
                } else if (state is LoadedResultState) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Your result',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.white40,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      AppContainer(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: AppColors.green15,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                  child: Text(
                                    state.result.result,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      color: AppColors.accentGreen,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                    'assets/images/chance-list/clever.png')
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              state.result.subtitle,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.white40,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              state.result.message,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.white40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      ActionButtonWidget(
                          text: 'New analysis',
                          width: double.infinity,
                          onTap: () {
                            context.router.push(AnalysisRoute());
                          }),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
