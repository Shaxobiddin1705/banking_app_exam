
import 'dart:convert';

import 'package:banking_app_exam/models/card_model.dart';
import 'package:http/http.dart';

class Network{

  static String baseApi = "620a799192946600171c5aa7.mockapi.io";

  static Map<String, String> headers = {'Content-type': 'application/json; charset=UTF-8',};


  /* Http Requests */

  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(baseApi, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) return response.body;
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async{
    var uri = Uri.https(baseApi, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, dynamic> params) async{
    var uri = Uri.https(baseApi, api, params);
    var response = await delete(uri, headers: headers);
    if(response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Apis */
  static String API_GET = "/api/add-card";
  static String API_POST = "/api/add-card";
  static String API_DELETE = "/api/add-card/"; //{id}

  /* Http Params */
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, dynamic> paramsPost(BankCard card) {
    Map<String, dynamic> params = {};
    params.addAll({
      'cardNumber': card.cardNumber,
      'cardHolder': card.cardHolder,
      'cvv2': card.cvv2,
      'expiredDate': card.expiredDate,
    });
    return params;
  }

  /* Http parsing */
  static List<BankCard> parseResponse(String response) {
    List json = jsonDecode(response);
    List<BankCard> cards = List<BankCard>.from(json.map((x) => BankCard.fromJson(x)));
    return cards;
  }
}