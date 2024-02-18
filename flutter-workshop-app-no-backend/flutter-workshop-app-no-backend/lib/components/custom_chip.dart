import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';

enum CustomChipState {
  selected,
  unselected,
}

class CustomChip extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final CustomChipState state;

  const CustomChip({
    super.key,
    this.onPressed,
    this.text,
    this.state = CustomChipState.unselected,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.white;
    Color fontColor = Colors.black;

    switch (state) {
      case CustomChipState.selected:
        backgroundColor = Colors.black;
        fontColor = Colors.white;
        break;
      case CustomChipState.unselected:
        fontColor = Colors.black;
        break;
    }

    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashFactory: NoSplash.splashFactory,
        ),
        child: Text(
          text ?? 'All',
          style: TextStyles.bodyText
              .copyWith(fontWeight: FontWeight.w500, color: fontColor),
        ),
      ),
    );
  }
}
