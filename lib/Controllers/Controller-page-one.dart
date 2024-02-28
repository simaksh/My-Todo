import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageOneController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<bool> isCheckedList = <bool>[].obs;
  RxList<Map<String, String>> items = <Map<String, String>>[].obs;
  RxnInt currentIndex = RxnInt();

  void addItem(String title, String description) {
    items.add({'title': title, 'description': description});
    isCheckedList.add(false);
  }

  void editItem(int index) {
    String title = items[index]['title']!;
    String description = items[index]['description']!;
    currentIndex.value = index;

    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        String newTitle = title;
        String newDescription = description;

        return AlertDialog(
          title: Text('Edit Item'),
          backgroundColor: Colors.blue.shade100,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  newTitle = value;
                },
                controller: TextEditingController(text: title),
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  newDescription = value;
                },
                controller: TextEditingController(text: description),
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                if (newTitle.isNotEmpty && newDescription.isNotEmpty) {
                  items[index]['title'] = newTitle;
                  items[index]['description'] = newDescription;
                  Get.back(); // Close the dialog
                } else {
                  Get.snackbar(
                    'Error',
                    'Please fill in both title and description',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void deleteItem(int index) {
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      isCheckedList.removeAt(index);
    }
  }

  void clearForm() {
    titleController.clear();
    descriptionController.clear();
  }

  void toggleCheck(int index, bool value) {
    isCheckedList[index] = value;
    update();
  }
  bool isChecked(int index){
    return isCheckedList[index];
  }
}