import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTwoController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  RxList<Map<String, String>> items = <Map<String, String>>[].obs;


  void setTitle(String value) {
    titleController.text = value;
  }


  void setDescription(String value) {
    descriptionController.text = value;
  }


  void addToList(String title, String description) {
    items.add({'title': title, 'description': description});
  }
  void onModifyPressed(String newTitle, String newDescription) {
    String newTitle = titleController.text;
    String newDescription = descriptionController.text;
    if (newTitle.isNotEmpty && newDescription.isNotEmpty) {
      addToList(newTitle, newDescription);
      Get.back();
    }
  }
}
