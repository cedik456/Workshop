import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/components.dart';
import 'package:flutter_workshop_app/screens.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);
  Widget bodyWidget = const SizedBox();

  List<String> chipText = [
    'All',
    'Follows',
    'Replies',
    'Mentions',
    'Quotes',
    'Reposts',
    'Verified',
  ];

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex.value) {
      case 0:
        bodyWidget = const NotificationAllPage();
        break;
      case 1:
        bodyWidget = const NotificationFollowsPage();
        break;
      case 2:
        bodyWidget = const NotificationRepliesPage();
        break;
      case 3:
        bodyWidget = const NotificationMentionsPage();
        break;
      case 4:
        bodyWidget = const NotificationQuotesPage();
        break;
      case 5:
        bodyWidget = const NotificationRepostsPage();
        break;
      case 6:
        bodyWidget = const NotificationVerifiedPage();
        break;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: kToolbarHeight + 35,
        scrolledUnderElevation: 0,
        flexibleSpace: Center(
          child: SizedBox(
            height: 40,
            child: ValueListenableBuilder(
              valueListenable: selectedIndex,
              builder: (context, value, child) {
                return ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 12 : 0,
                        right: index == 6 ? 12 : 0,
                      ),
                      child: CustomChip(
                        text: chipText[index],
                        onPressed: () {
                          setState(() {
                            selectedIndex.value = index;
                          });
                        },
                        state: selectedIndex.value == index
                            ? CustomChipState.selected
                            : CustomChipState.unselected,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
      body: bodyWidget,
    );
  }
}
