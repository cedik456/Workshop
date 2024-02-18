import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/components.dart';

class NotificationFollowsPage extends StatelessWidget {
  const NotificationFollowsPage({super.key});

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
        final int randomIndex = Random().nextInt(3);

        NotificationsAccountTemplateStatus accountTemplateStatus;

        // Assign the accountTemplateStatus based on the random index
        switch (randomIndex) {
          case 0:
            accountTemplateStatus = NotificationsAccountTemplateStatus.newbie;
            break;
          case 1:
            accountTemplateStatus = NotificationsAccountTemplateStatus.mutuals;
            break;
          case 2:
            accountTemplateStatus =
                NotificationsAccountTemplateStatus.requested;
            break;
          default:
            accountTemplateStatus = NotificationsAccountTemplateStatus.newbie;
            break;
        }

        return NotificationsTemplate(
          templateType: NotificationsTemplateType.accounts,
          accountTemplateStatus: accountTemplateStatus,
        );
      },
    );
  }
}
