import 'package:chatapp/shared/componets/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {

  CustomFormTextField({required this.hintText, this.onChanged, this.hiddenText = false});
  String? hintText;
  Function(String)? onChanged;
  bool? hiddenText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data){
        if(data!.isEmpty){
          return'field is required';
        }
      },
      obscureText: hiddenText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: whiteColor,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: whiteColor,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: whiteColor,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: blackColor,
          ),
        ),
      ),

    );
  }
}
