import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_stats_app/models/result_model.dart';
import 'package:poker_stats_app/router/router.dart';
import 'package:poker_stats_app/screens/analysis/widgets/button_selection_component.dart';
import 'package:poker_stats_app/screens/result/bloc/result_bloc.dart';
import 'package:poker_stats_app/theme/colors.dart';
import 'package:poker_stats_app/widgets/action_button_widget.dart';
import 'package:poker_stats_app/widgets/custom_back_button.dart';
import 'package:poker_stats_app/widgets/textfield_app_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

@RoutePage()
class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final controller = PageController();
  int _currentIndex = 0;

  final List<String> _stepTitles = [
    'Game',
    'Opponents',
    'Strategize your game',
    'Your bet',
    'Beginning of the game',
    'Betting during the game',
    'Bluff',
    'A major factor in the game',
    'The outcome of current game',
  ];

  String game = '';
  String opponent = '';
  String strategy = '';
  final amountController = TextEditingController();
  String beginningCard = '';
  String place = 'Doubled the bet';
  String bluff = '';
  final bluffingTimesController = TextEditingController();
  String factor = 'Successful bluffs';
  String outcome = 'Winning';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text(
          'New analysis',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
        leading: CustomBackButton(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: StepProgressIndicator(
                          padding: 3,
                          roundedEdges: Radius.circular(30),
                          totalSteps: 9,
                          currentStep: _currentIndex + 1,
                          selectedColor: AppColors.accentGreen,
                          unselectedColor: AppColors.white10,
                          size: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            '${_currentIndex + 1}/9',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.white40,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            _stepTitles[_currentIndex],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                controller: controller,
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Select a game',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.white40,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              ButtonSelectionComponent(buttonValues: [
                                'Poker',
                                'Baccarat',
                                'Brag',
                                'Badugi',
                                'Five',
                                'More then five',
                              ], value: game),
                            ],
                          ),
                          SizedBox(height: 20),
                          ActionButtonWidget(
                              text: 'Next',
                              width: MediaQuery.of(context).size.width * 0.8,
                              onTap: () {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              }),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'How many opponents you have?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.white40,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              ButtonSelectionComponent(buttonValues: [
                                'One',
                                'Two',
                                'Three',
                                'Four',
                                'Five',
                                'More then five',
                              ], value: opponent),
                            ],
                          ),
                          SizedBox(height: 20),
                          ActionButtonWidget(
                              text: 'Next',
                              width: MediaQuery.of(context).size.width * 0.8,
                              onTap: () {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              }),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'What strategy did you use in this game?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.white40,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              ButtonSelectionComponent(buttonValues: [
                                'Aggressive',
                                'Conservative',
                                'Balanced',
                                'None',
                              ], value: strategy),
                            ],
                          ),
                          SizedBox(height: 20),
                          ActionButtonWidget(
                              text: 'Next',
                              width: MediaQuery.of(context).size.width * 0.8,
                              onTap: () {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              }),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          TextFieldAppWidget(
                            controller: amountController,
                            title: 'What bet did you place?',
                            hintText: 'Sum',
                          ),
                          SizedBox(height: 20),
                          ActionButtonWidget(
                              text: 'Next',
                              width: MediaQuery.of(context).size.width * 0.8,
                              onTap: () {
                                if (amountController.text.isNotEmpty &&
                                    int.tryParse(amountController.text) !=
                                        null) {
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.accentGreen,
                                      content: Text(
                                        'Firstly, enter information',
                                        style:
                                            TextStyle(color: AppColors.white),
                                      ),
                                    ),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'What cards did you have at the beginning of the game?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.white40,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              ButtonSelectionComponent(buttonValues: [
                                'Novice',
                                'Begginer',
                                'Intermediate',
                                'Advanced',
                              ], value: beginningCard),
                            ],
                          ),
                          SizedBox(height: 20),
                          ActionButtonWidget(
                              text: 'Next',
                              width: MediaQuery.of(context).size.width * 0.8,
                              onTap: () {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              }),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'What bets did you place during the game?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.white40,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Column(
                                children: [
                                  _buildPlaceButton('Doubled the bet'),
                                  SizedBox(height: 15),
                                  _buildPlaceButton(
                                      'Set the minimum'),
                                  SizedBox(height: 15),
                                  _buildPlaceButton(
                                      'Raised the bet'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          ActionButtonWidget(
                              text: 'Next',
                              width: MediaQuery.of(context).size.width * 0.8,
                              onTap: () {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              }),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Were you bluffing?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.white40,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              ButtonSelectionComponent(buttonValues: [
                                'Yes',
                                'No',
                              ], value: beginningCard),
                            ],
                          ),
                          SizedBox(height: 20),
                          TextFieldAppWidget(
                            controller: bluffingTimesController,
                            title: 'How many times?',
                            hintText: 'Quantity',
                          ),
                          SizedBox(height: 20),
                          ActionButtonWidget(
                              text: 'Next',
                              width: MediaQuery.of(context).size.width * 0.8,
                              onTap: () {
                                if (amountController.text.isNotEmpty &&
                                    int.tryParse(amountController.text) !=
                                        null) {
                                  controller.nextPage(
                                      duration:
                                      const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.accentGreen,
                                      content: Text(
                                        'Firstly, enter information',
                                        style:
                                        TextStyle(color: AppColors.white),
                                      ),
                                    ),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'What were the main factors determining the outcome of this game?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.white40,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Column(
                                children: [
                                  _buildFactorButton('Successful bluffs'),
                                  SizedBox(height: 15),
                                  _buildFactorButton(
                                      'Winning card combinations'),
                                  SizedBox(height: 15),
                                  _buildFactorButton(
                                      'Underestimating opponents'),
                                  SizedBox(height: 15),
                                  _buildFactorButton(
                                      'I do not remember'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          ActionButtonWidget(
                              text: 'Next',
                              width: MediaQuery.of(context).size.width * 0.8,
                              onTap: () {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              }),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'What is the outcome of this game?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.white40,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Column(
                                children: [
                                  _buildOutcomeButton('Winning'),
                                  SizedBox(height: 15),
                                  _buildOutcomeButton(
                                      'Loss'),
                                  SizedBox(height: 15),
                                  _buildOutcomeButton(
                                      'Draw'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          ActionButtonWidget(
                              text: 'Next',
                              width: MediaQuery.of(context).size.width * 0.8,
                              onTap: () {
                                int resultIndex = Random().nextInt(4);
                                context
                                    .read<ResultBloc>()
                                    .add(AddResultEvent(result: results[resultIndex]));
                                context.router.push(ResultRoute());
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildPlaceButton(String title) {
    return GestureDetector(
      onTap: () => _onPlaceButtonPressed(title),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            color: place == title
                ? AppColors.accentGreen
                : AppColors.white10,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                place == title
                    ? Icon(
                  Icons.done,
                  color: AppColors.white,
                )
                    : Icon(
                  Icons.circle,
                  color: AppColors.white15,
                )
              ],
            )),
      ),
    );
  }

  void _onPlaceButtonPressed(String title) {
    setState(() {
      place = title;
    });
  }

  Widget _buildFactorButton(String title) {
    return GestureDetector(
      onTap: () => _onFactorButtonPressed(title),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            color: factor == title
                ? AppColors.accentGreen
                : AppColors.white10,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                factor == title
                    ? Icon(
                  Icons.done,
                  color: AppColors.white,
                )
                    : Icon(
                  Icons.circle,
                  color: AppColors.white15,
                )
              ],
            )),
      ),
    );
  }

  void _onFactorButtonPressed(String title) {
    setState(() {
      factor = title;
    });
  }

  Widget _buildOutcomeButton(String title) {
    return GestureDetector(
      onTap: () => _onOutcomeButtonPressed(title),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
            color: outcome == title
                ? AppColors.accentGreen
                : AppColors.white10,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                outcome == title
                    ? Icon(
                  Icons.done,
                  color: AppColors.white,
                )
                    : Icon(
                  Icons.circle,
                  color: AppColors.white15,
                )
              ],
            )),
      ),
    );
  }

  void _onOutcomeButtonPressed(String title) {
    setState(() {
      outcome = title;
    });
  }
}

final List<ResultModel> results = [
  ResultModel(result: 'Experienced player',
    subtitle: 'You have a balanced style. You flexibly adapt to different situations in the game.',
    message: 'You skillfully use bluffs and manage bets depending on the combination of cards, most likely have a good strategic foundation.',
  ),
  ResultModel(result: 'Average player',
    subtitle: 'Your game is decent, but there is room for improvement.',
    message: 'You understand the rules and basic strategies of card games, but you may need to work on your decision-making and reading opponents moves to become a more competitive player.',
  ),
  ResultModel(result: 'Above player',
    subtitle: 'You have a solid foundation and show potential for growth.',
    message: 'Your ability to analyze situations and make calculated decisions sets you apart from other players. With practice and refinement, you have the potential to become a formidable opponent at the card table.',
  ),
  ResultModel(result: 'Strong player',
    subtitle: 'You are a skilled and experienced player.',
    message: 'Your mastery of card games is evident in your strategic gameplay and insightful decision-making. You have a knack for reading opponents, making well-timed bluffs, and maximizing your winning potential. Keep up the good work and continue honing your skills to dominate the card table.',
  ),
];