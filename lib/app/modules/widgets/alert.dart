import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alert {
  snaksbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.white,
      margin: EdgeInsets.all(0),
      borderRadius: 0,
    );
  }
}
