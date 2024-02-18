import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/components.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';

enum NotificationsTemplateType {
  accounts,
  startThread,
  replies,
  mentions,
  quotes,
  reposts,
  verified,
}

enum NotificationsAccountTemplateStatus {
  follower,
  requested,
  mutuals,
  newbie,
}

class NotificationsTemplate extends StatelessWidget {
  final NotificationsTemplateType templateType;
  final NotificationsAccountTemplateStatus accountTemplateStatus;

  const NotificationsTemplate({
    super.key,
    this.templateType = NotificationsTemplateType.accounts,
    this.accountTemplateStatus = NotificationsAccountTemplateStatus.follower,
  });

  @override
  Widget build(BuildContext context) {
    Widget widgetType = const SizedBox();
    Widget buttonType = const SizedBox();
    String? accountStatusDesc;

    switch (accountTemplateStatus) {
      case NotificationsAccountTemplateStatus.follower:
        accountStatusDesc = 'Followed you';
        buttonType = const CustomButton(
            primaryButtonType: CustomPrimaryButtonType.follow);
        break;
      case NotificationsAccountTemplateStatus.requested:
        accountStatusDesc = 'Requested';
        buttonType = const CustomButton(
            primaryButtonType: CustomPrimaryButtonType.requested);
        break;
      case NotificationsAccountTemplateStatus.mutuals:
        accountStatusDesc = 'You\'re now following';
        buttonType = const CustomButton(
            primaryButtonType: CustomPrimaryButtonType.following);
        break;
      case NotificationsAccountTemplateStatus.newbie:
        accountStatusDesc = 'New to Threads';
        buttonType = const CustomButton(
            primaryButtonType: CustomPrimaryButtonType.follow);
        break;
    }

    switch (templateType) {
      case NotificationsTemplateType.accounts:
        widgetType = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Icon(
                  Icons.person_pin,
                  size: 35,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'nkcardel',
                              style: TextStyles.titleText,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              '20h',
                              style: TextStyles.bodyText
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          accountStatusDesc,
                          style:
                              TextStyles.bodyText.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    buttonType,
                  ],
                ),
              ),
            ],
          ),
        );
        break;
      case NotificationsTemplateType.startThread:
        widgetType = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Icon(
                  Icons.person_pin,
                  size: 35,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'nkcardel',
                          style: TextStyles.titleText,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '20h',
                          style:
                              TextStyles.bodyText.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Started a thread',
                      style: TextStyles.bodyText.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        break;
      case NotificationsTemplateType.replies:
        break;
      case NotificationsTemplateType.mentions:
        break;
      case NotificationsTemplateType.quotes:
        break;
      case NotificationsTemplateType.reposts:
        break;
      case NotificationsTemplateType.verified:
        break;
    }

    return widgetType;
  }
}
