import 'package:aikata_v2/constants/colors.dart';
import 'package:aikata_v2/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customTextField({
  String? title,
  String? hint,
  controller,
  required bool isPass,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: turuncu,
            ),
          ),
        ),
      ),
      5.heightBox,
    ],
  );
}

Widget customTextField2({
  String? title,
  String? hint,
  controller,
  required bool isPass,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: textfieldGrey,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: lightGrey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: turuncu,
            ),
          ),
          // filled: true,
          hintText: hint,
          hintStyle: const TextStyle(
            color: textfieldGrey,
            fontFamily: semibold,
          ),
        ),
      ),
      5.heightBox,
    ],
  );
}
