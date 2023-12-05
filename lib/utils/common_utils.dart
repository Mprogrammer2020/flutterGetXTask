
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(elevation: 20,content: Text(message)));
}