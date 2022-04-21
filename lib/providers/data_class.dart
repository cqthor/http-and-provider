import 'package:flutter/material.dart';
import 'package:http_provider/models/users.dart';
import 'package:http_provider/services/users.dart';

class DataClass extends  ChangeNotifier{
  ListUsers? post;
  bool loading = false;

  getPostData() async{
    loading = true;
    post = await getUsersdata();
    loading = false;

    notifyListeners();
  }
}