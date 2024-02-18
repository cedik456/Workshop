import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';

class NotificationRepostsPage extends StatelessWidget {
  const NotificationRepostsPage({super.key});

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
