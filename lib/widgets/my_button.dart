import 'package:chatting_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  MyButton({super.key, this.onTap, required this.text});
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
            disabledBackgroundColor: Colors.yellow,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(10),
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        child: GetBuilder<AuthController>(
            builder: (_) => _authController.isLoading
                ? const CircularProgressIndicator()
                : Text(
                    text,
                    style: const TextStyle(color: Colors.black),
                  )));
  }
}
