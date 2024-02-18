import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/components.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';

class CreatePostContainer extends StatefulWidget {
  final TextEditingController controller;
  const CreatePostContainer({super.key, required this.controller});

  @override
  State<CreatePostContainer> createState() => _CreatePostContainerState();
}

class _CreatePostContainerState extends State<CreatePostContainer> {
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
                  children: [
                    const Text(
                      'User', // Change to your nickname
                      style: TextStyles.titleText,
                    ),
                    widget.controller.text.isNotEmpty &&
                            widget.controller.text != ''
                        ? GestureDetector(
                            onTap: () {
                              widget.controller.clear();
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.grey,
                              size: 20,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                const SizedBox(height: 1),
                CustomTextField(
                  controller: widget.controller,
                  type: CustomTextFieldType.createPost,
                ),
                const SizedBox(height: 12),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.photo_library_outlined,
                      size: 22,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.gif_box_outlined,
                      size: 22,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.mic_none,
                      size: 22,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.numbers_rounded,
                      size: 22,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.poll_outlined,
                      size: 22,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  'Add to thread',
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
