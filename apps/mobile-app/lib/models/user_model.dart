import 'package:flutter/material.dart';

class User {
  final String id;
  final String username;
  final String email;
  final String profileImageUrl;
  final String bio;
  final int followers;
  final int following;
  final int posts;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.profileImageUrl,
    this.bio = '',
    this.followers = 0,
    this.following = 0,
    this.posts = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      profileImageUrl: json['profileImageUrl'],
      bio: json['bio'] ?? '',
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      posts: json['posts'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'bio': bio,
      'followers': followers,
      'following': following,
      'posts': posts,
    };
  }
}

class UserModel extends ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setCurrentUser(User user) {
    _currentUser = user;
    notifyListeners();
  }

  void clearUser() {
    _currentUser = null;
    notifyListeners();
  }

  // 这里可以添加更多用户相关操作，如获取用户信息、更新用户资料等
} 