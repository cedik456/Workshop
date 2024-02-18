import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/screens/login_page.dart';
import 'package:flutter_workshop_app/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});


  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    List<IconData> icons = [
      Icons.person_add_alt_1_outlined,
      Icons.notifications_outlined,
      Icons.favorite_border_rounded,
      Icons.lock_outline,
      Icons.person_4_outlined,
      Icons.help_outline_rounded,
      Icons.info_outline_rounded,
    ];


    List<String> title = [
      'Follow and invite friends',
      'Notifications',
      'Your likes',
      'Privacy',
      'Account',
      'Help',
      'About',
    ];


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Settings',
          style: TextStyles.displayTextMedium,
        ),
        shape: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Back',
                    style: TextStyles.titleText
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
        ),
        leadingWidth: 100,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: icons.length,
              separatorBuilder: ((context, index) =>
                  const SizedBox(height: 25)),
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(icons[index]),
                    const SizedBox(width: 10),
                    Text(title[index], style: TextStyles.bodyText)
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          Divider(
            thickness: 1,
            color: Colors.grey[200],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              'Switch profiles',
              style: TextStyles.bodyText.copyWith(color: CustomColors.blue),
            ),
          ),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () async {
              await auth.signOut().then((value) {
                Fluttertoast.showToast(
                    msg: 'Successfully Logged out!',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                'Log out',
                style: TextStyles.bodyText.copyWith(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
