
import 'dart:convert';

import 'package:banking_app_exam/models/card_model.dart';
import 'package:hive/hive.dart';

class HiveDB{
  static String DB_NAME = "add_card_with_hive_database";
  static var box = Hive.box(DB_NAME);

  static Future<void> storeCardList(List<BankCard> list) async{
    List<String> stringList = list.map((card) => jsonEncode(card.toJson())).toList();
    await box.put('cardList', stringList);
  }

  static Future<List> loadList() async{
    var result = await box.get("cardList");
    List cardList = result.map((stringCard) => BankCard.fromJson(jsonDecode(stringCard))).toList();
    return cardList;
  }

  static void removeCard(int index) async{
    await box.deleteAt(index);
  }

}