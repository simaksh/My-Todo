import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/Controller-page-one.dart';

class PageOneView extends StatelessWidget {
  static const String pageRoute = '/pageOne';

  const PageOneView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
      ),
      body: GetBuilder<PageOneController>(
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue.shade100),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            String title = '';
                            String description = '';

                            return AlertDialog(
                              title: Text('Add Item'),
                              backgroundColor: Colors.blue.shade200,
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextField(
                                    onChanged: (value) {
                                      title = value;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Title',
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  TextField(
                                    onChanged: (value) {
                                      description = value;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Description',
                                    ),
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    if (title.isNotEmpty && description.isNotEmpty) {
                                      controller.addItem(title, description);
                                      Navigator.of(context).pop();
                                    } else {
                                      Get.snackbar(
                                        'Error',
                                        'Please fill in both title and description',
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  },
                                  child: Text('Submit'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Icon(Icons.add, color: Colors.green),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade200),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Obx(
                              () => ListView.builder(
                            itemCount: controller.items.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey)),
                                ),
                                child: ListTile(
                                  leading: Checkbox(
                                    value: controller.isChecked(index),
                                    onChanged: (value) {
                                      controller.toggleCheck(index, value ?? false);
                                    },
                                  ),
                                  title: Text(
                                    'Title: ${controller.items[index]['title']!}',
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Description: ${controller.items[index]['description']!}',
                                    style: TextStyle(
                                      color: Colors.purple,
                                    ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          controller.editItem(index);
                                          Get.snackbar(
                                            'Edit',
                                            'Item at index $index edited',
                                            backgroundColor: Colors.blue,
                                            colorText: Colors.white,
                                          );
                                        },
                                        icon: Icon(Icons.edit, color: Colors.deepOrange),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.deleteItem(index);
                                          Get.snackbar(
                                            'Delete',
                                            'Item at index $index deleted',
                                            backgroundColor: Colors.red,
                                            colorText: Colors.white,
                                          );
                                        },
                                        icon: Icon(Icons.delete, color: Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
