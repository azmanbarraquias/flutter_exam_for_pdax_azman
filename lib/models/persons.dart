// To parse this JSON data, do
//
//     final persons = personsFromJson(jsonString);

import 'dart:convert';

Persons personsFromJson(String str) => Persons.fromJson(json.decode(str));

String personsToJson(Persons data) => json.encode(data.toJson());

class Persons {
  String status;
  int code;
  String locale;
  dynamic seed;
  int total;
  List<Datum> data;

  Persons({
    required this.status,
    required this.code,
    required this.locale,
    required this.seed,
    required this.total,
    required this.data,
  });

  factory Persons.fromJson(Map<String, dynamic> json) => Persons(
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
  int id;
  String firstname;
  String lastname;
  String email;
  String phone;
  DateTime birthday;
  String gender;
  Address address;
  String website;
  String image;

  Datum({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.address,
    required this.website,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    birthday: DateTime.parse(json["birthday"]),
    gender: json["gender"],
    address: Address.fromJson(json["address"]),
    website: json["website"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "address": address.toJson(),
    "website": website,
    "image": image,
  };
}

class Address {
  int id;
  String street;
  String streetName;
  String buildingNumber;
  String city;
  String zipcode;
  String country;
  String countryCode;
  double latitude;
  double longitude;

  Address({
    required this.id,
    required this.street,
    required this.streetName,
    required this.buildingNumber,
    required this.city,
    required this.zipcode,
    required this.country,
    required this.countryCode,
    required this.latitude,
    required this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    street: json["street"],
    streetName: json["streetName"],
    buildingNumber: json["buildingNumber"],
    city: json["city"],
    zipcode: json["zipcode"],
    country: json["country"],
    countryCode: json["country_code"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "street": street,
    "streetName": streetName,
    "buildingNumber": buildingNumber,
    "city": city,
    "zipcode": zipcode,
    "country": country,
    "country_code": countryCode,
    "latitude": latitude,
    "longitude": longitude,
  };
}
