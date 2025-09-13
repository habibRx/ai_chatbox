import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String profileImage;
  final bool isEmailVerified;
  final double? initialCap;
  final double? currentCap;
  final double? targetCap;

  User(
   {
    required this.uid,
    required this.name,
     this.initialCap,
     this.currentCap,
     this.targetCap,
     required this.email,
    required this.profileImage,
    required this.isEmailVerified,
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return User(
      uid: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      profileImage: data['profileImage'] ?? '',
      initialCap: (data['initialCap'] ?? 0).toDouble(),
      targetCap: (data['targetCap'] ?? 0).toDouble(),
      currentCap: (data['currentCap'] ?? 0).toDouble(),
      isEmailVerified: data['isEmailVerified'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'targetCap' : targetCap,
      'currentCap' : currentCap,
      'initialCap' : initialCap,
      'isEmailVerified': isEmailVerified,
    };
  }

  // Create from map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      initialCap: (map['initialCap'] ?? 0).toDouble(),
      targetCap: (map['targetCap'] ?? 0).toDouble(),
      currentCap: (map['currentCap'] ?? 0).toDouble(),
      profileImage: map['profileImage'] ?? '',
      isEmailVerified: map['isEmailVerified'] ?? false,
    );
  }

  // Convert object to JSON string
  String toJson() => json.encode(toMap());

  // Convert JSON string to object
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  factory User.initial() {
    return User(
      uid: "",
      name: "",
      email: "",
      initialCap: 0,
      targetCap: 0,
      currentCap: 0,
      profileImage: "",
      isEmailVerified: false,
    );
  }

  User copyWith({
    String? uid,
    String? name,
    String? email,
    String? profileImage,
    double? initialCap,
    double? currentCap,
    double? targetCap,
    bool? isEmailVerified,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      initialCap: initialCap ?? this.initialCap,
      targetCap:  targetCap ?? this.targetCap,
      currentCap: currentCap ?? this.currentCap,
      profileImage: profileImage ?? this.profileImage,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }
}
