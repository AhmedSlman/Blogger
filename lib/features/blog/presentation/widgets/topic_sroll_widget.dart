// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class TopicsScrollWidget extends StatefulWidget {
  const TopicsScrollWidget({
    super.key,
  });

  @override
  State<TopicsScrollWidget> createState() => _TopicsScrollWidgetState();
}

class _TopicsScrollWidgetState extends State<TopicsScrollWidget> {
  List<String> selectedTopics = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: [
        'Technology',
        'Business',
        'Programming',
        'Entertainment',
      ]
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      if (selectedTopics.contains(e)) {
                        selectedTopics.remove(e);
                      } else {
                        selectedTopics.add(e);
                      }
                      setState(() {});
                      print(selectedTopics);
                    },
                    child: Chip(
                      backgroundColor: selectedTopics.contains(e)
                          ? AppColors.gradient1
                          : null,
                      label: Text(e),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      side: selectedTopics.contains(e)
                          ? null
                          : const BorderSide(
                              color: AppColors.borderColor,
                            ),
                    ),
                  ),
                ),
              )
              .toList()),
    );
  }
}
