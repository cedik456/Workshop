import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';

class NotificationRepliesPage extends StatelessWidget {
  const NotificationRepliesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Nothing to see here yet.',
        style: TextStyles.bodyText.copyWith(color: Colors.grey),
      ),
    );
  }
}
