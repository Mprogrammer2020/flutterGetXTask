import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../models/children_details.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(
          centerTitle: true,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          title: const Text(
            "Children List",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red),
      body: MixinBuilder<HomeController>(
        builder: (homeController) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              controller: homeController.scrollController,
              itemBuilder: (context, index) {
                ChildDetails child = homeController.childrenProfileList[index];
                return GestureDetector(
                  onTap: () {
                    homeController.isNaughtyChildUpdate(position: index, isNice: !child.isNaughty);
                  },
                  child: Container(
                    width: Get.width, // Use Get.width for consistency
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Child Name: ${child.name}"),
                                    Text("Country: ${child.homeCountry}"),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Naughty",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Switch(
                                      value: child.isNaughty,
                                      onChanged: (value) {
                                        homeController.isNaughtyChildUpdate(
                                            position: index, isNice: value);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
              itemCount: homeController.childrenProfileList.length,
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            homeController.showModal(context);
          },
        ),
      ),
    );
  }
}
