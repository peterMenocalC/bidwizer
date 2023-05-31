// To parse this JSON data, do
//
//     final wishListUser = wishListUserFromJson(jsonString);

import 'dart:convert';

WishListUser wishListUserFromJson(String str) => WishListUser.fromJson(json.decode(str));

String wishListUserToJson(WishListUser data) => json.encode(data.toJson());

class WishListUser {
  WishListUser({
    this.getWatchListUsers,
  });

  List<GetWatchListUser> getWatchListUsers;

  factory WishListUser.fromJson(Map<String, dynamic> json) => WishListUser(
    getWatchListUsers: List<GetWatchListUser>.from(json["getWatchListUsers"].map((x) => GetWatchListUser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "getWatchListUsers": List<dynamic>.from(getWatchListUsers.map((x) => x.toJson())),
  };
}

class GetWatchListUser {
  GetWatchListUser({
    this.userId,
    this.user,
  });

  String userId;
  User user;

  factory GetWatchListUser.fromJson(Map<String, dynamic> json) => GetWatchListUser(
    userId: json["userId"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "user": user.toJson(),
  };
}

class User {
  User({
    this.firstName,
    this.lastName,
  });

  String firstName;
  String lastName;

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["firstName"],
    lastName: json["lastName"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
  };
}
