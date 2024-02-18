import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/components.dart';

class NotificationAllPage extends StatelessWidget {
  const NotificationAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Divider(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        // Generate a random index
        final bool randomTemplateType = Random().nextBool();
        final bool randomAccTemplateStatus = Random().nextBool();

        return NotificationsTemplate(
          templateType: randomTemplateType
              ? NotificationsTemplateType.startThread
              : NotificationsTemplateType.accounts,
          accountTemplateStatus: randomAccTemplateStatus
              ? NotificationsAccountTemplateStatus.newbie
              : NotificationsAccountTemplateStatus.mutuals,
        );
      },
    );
  }
}
