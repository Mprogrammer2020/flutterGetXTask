import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmas/models/children_details.dart';

import '../utils/common_utils.dart';

class HomeController extends GetxController {
  ScrollController scrollController = ScrollController();

  final _childrenProfileList = <ChildDetails>[].obs;
  List<ChildDetails> get childrenProfileList => _childrenProfileList.toList();

   TextEditingController childNameController=TextEditingController();
   TextEditingController childCountryController=TextEditingController();
  var isNaughty = false.obs;

  void toggleNaughty(bool value) {
    isNaughty.value = value;
    update();
  }

  @override
  void onInit(){
    super.onInit();
    addDefaultChildren();
  }

  void isNaughtyChildUpdate({required int position, required bool isNice}) {
    if (position >= 0 && position < _childrenProfileList.length) {
      _childrenProfileList[position].isNaughty = isNice;
      update();
      print("List updated. New value at position $position: ${_childrenProfileList[position].isNaughty}");
    }
  }
  /*void updateChildData({required int position,required ChildDetails childDetails}) {
    if (position >= 0 && position < _childrenProfileList.length) {
      _childrenProfileList[position] = childDetails;
      update();
    }
  }*/
  void deleteChild({required int position}) {
    if (position >= 0 && position < _childrenProfileList.length) {
      _childrenProfileList.removeAt(position);
      update();
    }


  }
  void addChild(ChildDetails child) {
    _childrenProfileList.add(child);
    update();
  }

  void addDefaultChildren() {
    _childrenProfileList.add(ChildDetails(
      name: "Jessica",
      homeCountry: "England",
      isNaughty: false,
    ));
    update();
  }

  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Scaffold(
          body: Stack(
            children: [
           SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: 5,
                  left: 10,
                  right: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20,),
                    Text("Child Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: childNameController,
                      decoration: InputDecoration(hintText: "Enter name",labelText: "Name"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: childCountryController,
                      decoration: InputDecoration(hintText: "Enter country",labelText: "Country"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Naughty"),
                        Obx(
                         () => Checkbox(
                            value: isNaughty.value,
                            onChanged: (value) => toggleNaughty(value!),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) =>Colors.black)),
                      onPressed: () {
                        if(childNameController.text.isEmpty){
                          showSnackbar(context,"Name field can't be empty.");
                        }else if(childCountryController.text.isEmpty){
                          showSnackbar(context,"Country field can't be empty.");
                        }else{
                          addChild(
                            ChildDetails(
                              name: childNameController.text,
                              homeCountry: childCountryController.text,
                              isNaughty: isNaughty.value,
                            ),
                          );
                          childNameController.text = "";
                          childCountryController.text = "";
                          isNaughty.value=false;
                          Navigator.of(context).pop();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("Add New",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            ),]
          ),
        );
      },
    );
  }
}
