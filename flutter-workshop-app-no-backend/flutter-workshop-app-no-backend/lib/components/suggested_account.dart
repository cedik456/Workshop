import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/components/custom_button.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';

class SuggestedAccount extends StatelessWidget {
  const SuggestedAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Icon(
              Icons.person_pin,
              size: 30,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'nkcardel',
                      style: TextStyles.titleText,
                    ),
                    Text(
                      'Nicole',
                      style: TextStyles.bodyText.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '127 followers',
                      style: TextStyles.bodyText,
                    ),
                  ],
                ),
                const CustomButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
