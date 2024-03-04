import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_application_snakes/data/snakes_models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<SnakesModel> snakesList = List<SnakesModel>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    String jsonString = await rootBundle.loadString('assets/snakes.json');
    List<dynamic> itemList = json.decode(jsonString);
    snakesList.assignAll(itemList.map((data) => SnakesModel.fromJson(data)));
  }
}
