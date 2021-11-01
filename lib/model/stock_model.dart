// To parse this JSON data, do
//
//     final stockDetails = stockDetailsFromJson(jsonString);

import 'dart:convert';

List<StockItem> stockDetailsFromJson(String str) =>
    List<StockItem>.from(json.decode(str).map((x) => StockItem.fromJson(x)));

String stockDetailsToJson(List<StockItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StockItem extends Comparable {
  StockItem({
    required this.securityCode,
    required this.issuerName,
    required this.securityId,
    required this.securityName,
    required this.status,
    required this.group,
    required this.faceValue,
    required this.isinNo,
    required this.industry,
    required this.instrument,
  });

  int securityCode;
  String issuerName;
  String securityId;
  String securityName;
  String status;
  String group;
  double faceValue;
  String isinNo;
  String industry;
  String instrument;

  factory StockItem.fromJson(Map<String, dynamic> json) => StockItem(
        securityCode: json["Security Code"],
        issuerName: json["Issuer Name"],
        securityId: json["Security Id"],
        securityName: json["Security Name"],
        status: json["Status"],
        group: json["Group"],
        faceValue: json["Face Value"].toDouble(),
        isinNo: json["ISIN No"],
        industry: json["Industry"],
        instrument: json["Instrument"],
      );

  Map<String, dynamic> toJson() => {
        "Security Code": securityCode,
        "Issuer Name": issuerName,
        "Security Id": securityId,
        "Security Name": securityName,
        "Status": status,
        "Group": group,
        "Face Value": faceValue,
        "ISIN No": isinNo,
        "Industry": industry,
        "Instrument": instrument,
      };

  @override
  int compareTo(other) {
    return other;
  }
}
