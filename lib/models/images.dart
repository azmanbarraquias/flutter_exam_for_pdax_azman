// To parse this JSON data, do
//
//     final images = imagesFromJson(jsonString);

import 'dart:convert';

Images imagesFromJson(String str) => Images.fromJson(json.decode(str));

String imagesToJson(Images data) => json.encode(data.toJson());

class Images {
  String status;
  int code;
  String locale;
  dynamic seed;
  int total;
  List<Datum> data;

  Images({
    required this.status,
    required this.code,
    required this.locale,
    required this.seed,
    required this.total,
    required this.data,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    status: json["status"],
    code: json["code"],
    locale: json["locale"],
    seed: json["seed"],
    total: json["total"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "locale": locale,
    "seed": seed,
    "total": total,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String title;
  String description;
  String url;

  Datum({
    required this.title,
    required this.description,
    required this.url,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["title"],
    description: json["description"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "url": url,
  };
}
