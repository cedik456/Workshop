import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';

enum CustomButtonType {
  primary,
  secondary,
}

enum CustomPrimaryButtonType {
  follow,
  following,
  requested,
}

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final Color? buttonColor;
  final CustomButtonType type;
  final CustomPrimaryButtonType primaryButtonType;

  const CustomButton({
    super.key,
    this.onPressed,
    this.text,
    this.buttonColor,
    this.type = CustomButtonType.primary,
    this.primaryButtonType = CustomPrimaryButtonType.follow,
  });

  @override
  Widget build(BuildContext context) {
    ButtonStyle? buttonStyle;
    Color fontColor = Colors.black;
    String textButton = 'Follow';

    switch (type) {
      case CustomButtonType.primary:
        buttonStyle = ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashFactory: NoSplash.splashFactory,
        );
        switch (primaryButtonType) {
          case CustomPrimaryButtonType.follow:
            textButton = 'Follow';
            break;
          case CustomPrimaryButtonType.following:
            textButton = 'Following';
            fontColor = Colors.grey.shade400;
            break;
          case CustomPrimaryButtonType.requested:
            textButton = 'Requested';
            fontColor = Colors.grey.shade400;
            break;
        }
        break;
      case CustomButtonType.secondary:
        buttonStyle = ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: buttonColor ?? Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashFactory: NoSplash.splashFactory,
        );
        fontColor = Colors.white;
        break;
    }

    return SizedBox(
      height: 33,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(
          text ?? textButton,
          style: TextStyles.bodyText
              .copyWith(fontWeight: FontWeight.w500, color: fontColor),
        ),
      ),
    );
  }
}
