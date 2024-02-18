import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';

enum CustomTextFieldType {
  search,
  createPost,
  login,
  password,
}

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? labelText;
  final CustomTextFieldType type;

  const CustomTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.labelText,
    this.type = CustomTextFieldType.search,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Widget widgetType = const SizedBox();
  bool showPassword = false;
  FocusNode focusNode = FocusNode();
  Color borderColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        borderColor = focusNode.hasFocus ? Colors.black : Colors.grey;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case CustomTextFieldType.search:
        widgetType = TextFormField(
          controller: widget.controller,
          cursorColor: Colors.grey,
          style: TextStyles.bodyText,
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Search',
            hintStyle: TextStyles.bodyText.copyWith(color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: Colors.grey,
              size: 25,
            ),
            suffixIcon: widget.controller.text.isNotEmpty &&
                    widget.controller.text != ''
                ? GestureDetector(
                    onTap: () {
                      widget.controller.clear();
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 25,
                    ),
                  )
                : const SizedBox(),
          ),
          onChanged: (value) {
            setState(() {});
            widget.onChanged;
          },
        );
        break;
      case CustomTextFieldType.createPost:
        widgetType = TextFormField(
          controller: widget.controller,
          cursorColor: Colors.black,
          style: TextStyles.bodyText,
          maxLines: null,
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Start a thread...',
            hintStyle: TextStyles.bodyText.copyWith(color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            filled: false,
          ),
          onChanged: (value) {
            setState(() {});
            widget.onChanged;
          },
        );
        break;
      case CustomTextFieldType.login:
        widgetType = Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: TextFormField(
              focusNode: focusNode,
              controller: widget.controller,
              cursorColor: Colors.grey,
              style: TextStyles.bodyText,
              decoration: InputDecoration(
                isDense: true,
                labelText: widget.labelText ?? 'Username',
                labelStyle: TextStyles.bodyText.copyWith(color: Colors.grey),
                floatingLabelStyle: TextStyles.bodyText
                    .copyWith(color: Colors.black.withOpacity(0.7)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
                border: InputBorder.none,
                filled: false,
                suffixIcon: widget.controller.text.isNotEmpty &&
                        widget.controller.text != ''
                    ? GestureDetector(
                        onTap: () {
                          widget.controller.clear();
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.grey,
                          size: 25,
                        ),
                      )
                    : const SizedBox(),
              ),
              onChanged: (value) {
                setState(() {});
                widget.onChanged;
              },
            ),
          ),
        );
        break;
      case CustomTextFieldType.password:
        widgetType = Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: TextFormField(
              focusNode: focusNode,
              controller: widget.controller,
              cursorColor: Colors.grey,
              style: TextStyles.bodyText,
              obscureText: !showPassword,
              obscuringCharacter: '•',
              decoration: InputDecoration(
                  isDense: true,
                  labelText: widget.labelText ?? 'Username',
                  labelStyle: TextStyles.bodyText.copyWith(color: Colors.grey),
                  floatingLabelStyle: TextStyles.bodyText
                      .copyWith(color: Colors.black.withOpacity(0.7)),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 15),
                  border: InputBorder.none,
                  filled: false,
                  suffixIcon: widget.controller.text.isNotEmpty &&
                          widget.controller.text != ''
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: Icon(
                            showPassword == true
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.grey,
                            size: 22,
                          ),
                        )
                      : const SizedBox()),
              onChanged: (value) {
                setState(() {});
                widget.onChanged;
              },
            ),
          ),
        );

        break;
    }

    return widgetType;
  }
}
