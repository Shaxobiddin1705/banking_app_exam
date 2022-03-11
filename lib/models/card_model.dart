
import 'dart:convert';

List<BankCard> imagesFromJson(String str) => List<BankCard>.from(json.decode(str).map((x) => BankCard.fromJson(x)));

String imagesToJson(List<BankCard> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

bool isConnected = false;

class BankCard{

  late String id;
  late String cardNumber;
  late String cardHolder;
  late String expiredDate;
  late String cvv2;

  BankCard(this.cardNumber, this.cardHolder, this.expiredDate, this.cvv2);

  BankCard.fromJson(Map<String, dynamic> json) {
    cardNumber = json['cardNumber'].toString();
    cardHolder = json['cardHolder'];
    expiredDate = json['expiredDate'].toString();
    cvv2 = json['cvv2'].toString();
    id = json['id'].toString();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cardNumber'] = cardNumber.toString();
    map['cardHolder'] = cardHolder;
    map['expiredDate'] = expiredDate.toString();
    map['cvv2'] = cvv2.toString();
    return map;
  }

}