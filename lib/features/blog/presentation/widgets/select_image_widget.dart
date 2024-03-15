// ignore_for_file: sized_box_for_whitespace

import 'dart:io';

import 'package:blogger/core/utils/pick_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class SelectImageWidget extends StatefulWidget {
  const SelectImageWidget({
    super.key,
  });

  @override
  State<SelectImageWidget> createState() => _SelectImageWidgetState();
}

class _SelectImageWidgetState extends State<SelectImageWidget> {
  File? image;
  void selectImage() async {
    final pickImage = await picImage();
    setState(() {
      image = pickImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectImage();
      },
      child: image != null
          ? SizedBox(
              height: 160,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  image!,
                  fit: BoxFit.cover,
                ),
              ),
            )
          : GestureDetector(
              onTap: () {
                selectImage();
                print("wwwwwwwwwwwwwwwwwwwwwwwww");
              },
              child: DottedBorder(
                color: AppColors.borderColor,
                dashPattern: const [10, 4],
                radius: const Radius.circular(10),
                borderType: BorderType.RRect,
                strokeCap: StrokeCap.round,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.folder_open,
                        size: 40,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Select your image",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
