import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/components.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: kToolbarHeight + 40,
            floating: true,
            pinned: true,
            snap: true,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 28),
                child: CustomTextField(
                  controller: textEditingController,
                  type: CustomTextFieldType.search,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    const SuggestedAccount(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey[200],
                      ),
                    ),
                  ],
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
