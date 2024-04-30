import 'package:flutter/material.dart';
import 'package:poker_stats_app/theme/colors.dart';

class ButtonSelectionComponent extends StatefulWidget {
  final List<String> buttonValues;
  String value;

  ButtonSelectionComponent({
    required this.buttonValues,
    required this.value,
  });

  @override
  _ButtonSelectionComponentState createState() =>
      _ButtonSelectionComponentState();
}

class _ButtonSelectionComponentState extends State<ButtonSelectionComponent> {
  int _selectedButton = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ...List.generate(widget.buttonValues.length ~/ 2, (index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton(widget.buttonValues[index * 2]),
              SizedBox(width: 8),
              _buildButton(widget.buttonValues[index * 2 + 1]),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildButton(String value) {
    int _index = widget.buttonValues.indexOf(value);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedButton = _index;
              widget.value = widget.buttonValues[_selectedButton];
              print(widget.value);
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 55,
            decoration: BoxDecoration(
                color: _selectedButton == _index
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
                      value,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white),
                    ),
                    _selectedButton == _index
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
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
