import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_workshop_app/components.dart';
import 'package:flutter_workshop_app/screens.dart';
import 'package:flutter_workshop_app/styles.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.language,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.instagramLogo,
                              colorFilter: const ColorFilter.mode(
                                  Colors.black, BlendMode.srcIn),
                              width: 28,
                            ),
                            const SizedBox(width: 13),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const SettingsPage(),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.menu,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nicole Kaye Cardel',
                              style: TextStyles.displayTextMedium,
                            ),
                            const Text(
                              'nkcardel',
                              style: TextStyles.bodyText,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '107 followers',
                              style: TextStyles.bodyText
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.person_pin,
                          size: 80,
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomButton(
                              text: 'Edit profile',
                              type: CustomButtonType.primary),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CustomButton(
                              text: 'Share profile',
                              type: CustomButtonType.primary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            TabBar(
              controller: _tabController,
              labelStyle: TextStyles.titleText,
              indicatorWeight: 1.0,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 15),
              overlayColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              tabs: const [
                Tab(
                  text: 'Threads',
                ),
                Tab(
                  text: 'Replies',
                ),
                Tab(
                  text: 'Reposts',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: List.generate(3, (index) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[200],
                      ),
                    ),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return index == 0
                          ? const NotificationsTemplate()
                          : index == 1
                              ? const NotificationsTemplate()
                              : index == 2
                                  ? const NotificationsTemplate()
                                  : const NotificationsTemplate();
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
