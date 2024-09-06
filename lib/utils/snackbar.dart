import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

customSnackbar(title,message,type){

  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: type == "error" ? Colors.red:Colors.green,
    colorText: Colors.white,
  );
}