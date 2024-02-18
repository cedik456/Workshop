import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/screens/edit_post_page.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';

class ThreadContainer extends StatefulWidget {
  final Map<String,dynamic> threadData;
  const ThreadContainer({
    super.key,
    required this.threadData
  });

  @override
  State<ThreadContainer> createState() => _ThreadContainerState();
}

class _ThreadContainerState extends State<ThreadContainer> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Text(
                      widget.threadData['fromUser'],
                       // From user
                      style: TextStyles.titleText,
                    ),
                    Row(
                      children: [
                        Text(
                          '26m',
                          style:
                              TextStyles.bodyText.copyWith(color: Colors.grey),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0, vertical: 12),
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).pop();
                                                    showModalBottomSheet(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return const FractionallySizedBox(
                                                          heightFactor: 0.97,
                                                          child: EditPostPage(),
                                                        );
                                                      },
                                                      backgroundColor:
                                                          Colors.white,
                                                      isScrollControlled: true,
                                                      useSafeArea: true,
                                                    );
                                                  },
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 3.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Edit',
                                                          style: TextStyles
                                                              .bodyText,
                                                        ),
                                                        Icon(
                                                          Icons.edit_outlined,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 3.0),
                                                  child: Divider(
                                                    thickness: 1,
                                                    color: Colors.grey[200],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // Delete
                                                  },
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 3.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Delete',
                                                          style: TextStyles
                                                              .bodyText,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .delete_outline_outlined,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              isScrollControlled: true,
                              useSafeArea: true,
                            );
                          },
                          child: const Icon(
                            Icons.more_horiz,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                      Text(
                  widget.threadData['message'], // Message here
                  style: TextStyles.bodyText,
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(height: 12),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border_rounded,
                      size: 22,
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.mode_comment_outlined,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.compare_arrows_rounded,
                      size: 22,
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.share_outlined,
                      size: 21,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '25 replies · View Activity',
                  style: TextStyles.bodyText.copyWith(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
