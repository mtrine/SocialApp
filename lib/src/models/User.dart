import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String? username;
  String? email ;
  String? photoUrl;
  String? country;
  String? bio;
  String? id;
  Timestamp? signedUpAt;
  Timestamp? lastSeen;
  bool? isOnline;

  User({
    this.username,
    this.email,
    this.photoUrl,
    this.country,
    this.bio,
    this.id,
    this.signedUpAt,
    this.lastSeen,
    this.isOnline
  });
  User.fromJson(Map<String,dynamic> json){
    username = json['username'];
    email = json['email'];
    country = json['country'];
    photoUrl = json['photoUrl'];
    signedUpAt = json['signedUpAt'];
    isOnline = json['isOnline'];
    lastSeen = json['lastSeen'];
    bio = json['bio'];
    id = json['id'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['country'] = this.country;
    data['photoUrl'] = this.photoUrl;
    data['bio'] = this.bio;
    data['signedUpAt'] = this.signedUpAt;
    data['isOnline'] = this.isOnline;
    data['lastSeen'] = this.lastSeen;
    data['id'] = this.id;
    return data;
  }
}