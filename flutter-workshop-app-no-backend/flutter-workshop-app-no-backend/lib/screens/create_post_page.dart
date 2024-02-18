import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/components.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    final thread = FirebaseFirestore.instance.collection('thread');
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'New thread',
              style: TextStyles.displayTextMedium,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
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
                  child: Text(
                    'Cancel',
                    style: TextStyles.titleText
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
            leadingWidth: 100,
          ),
          Divider(thickness: 0.5, color: Colors.grey[200]),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CreatePostContainer(
                  controller: textEditingController,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Anyone can reply',
                          style:
                              TextStyles.bodyText.copyWith(color: Colors.grey),
                        ),
                        CustomButton(
                          text: 'Post',
                          type: CustomButtonType.secondary,
                          onPressed: () async {
                              
                              Map<String,dynamic> threadData = {
                                'fromUser' : 'Hello World!',
                                'message'  : textEditingController.text
                              };
                            await thread.doc().set(threadData).then((value) {
                              Fluttertoast.showToast(
                                msg: 'Thread posted succesfully!',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white);
                              Navigator.of(context).pop();
                            }
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 10),
        ],
      ),
    );
  }
}
