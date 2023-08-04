// To parse this JSON data, do
//
//     final coffee = coffeeFromJson(jsonString);

import 'dart:convert';

Coffee coffeeFromJson(String str) => Coffee.fromJson(json.decode(str));

String coffeeToJson(Coffee data) => json.encode(data.toJson());

class Coffee {
    int count;
    List<Datum> data;

    Coffee({
        required this.count,
        required this.data,
    });

    factory Coffee.fromJson(Map<String, dynamic> json) => Coffee(
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String name;
    int price;
    String description;
    String image;
    String category;
    String company;
    List<String> colors;
    bool featured;
    bool freeShipping;
    int inventory;
    int averageRating;
    Admin? admin;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Datum({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.image,
        required this.category,
        required this.company,
        required this.colors,
        required this.featured,
        required this.freeShipping,
        required this.inventory,
        required this.averageRating,
        this.admin,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
        category: json["category"],
        company: json["company"],
        colors: List<String>.from(json["colors"].map((x) => x)),
        featured: json["featured"],
        freeShipping: json["freeShipping"],
        inventory: json["inventory"],
        averageRating: json["averageRating"],
        admin: json["admin"] == null ? null : Admin.fromJson(json["admin"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "description": description,
        "image": image,
        "category": category,
        "company": company,
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "featured": featured,
        "freeShipping": freeShipping,
        "inventory": inventory,
        "averageRating": averageRating,
        "admin": admin?.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Admin {
    String id;
    String name;

    Admin({
        required this.id,
        required this.name,
    });

    factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}
