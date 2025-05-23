import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = false;
  String? _error;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // 模拟登录请求
  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // 模拟网络请求延迟
      await Future.delayed(const Duration(seconds: 1));

      // 简单验证逻辑 - 实际应用中应与后端API交互
      if (username == 'user' && password == 'password') {
        // 登录成功，保存到本地存储
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('username', username);

        _isAuthenticated = true;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        // 登录失败
        _error = '用户名或密码不正确';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = '登录时发生错误: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // 模拟注册请求
  Future<bool> register(
      String email, String fullName, String username, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // 模拟网络请求延迟
      await Future.delayed(const Duration(seconds: 1));

      // 模拟注册成功
      // 实际应用中应与后端API交互

      // 注册成功后自动登录
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('username', username);

      _isAuthenticated = true;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = '注册时发生错误: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // 检查用户是否已登录
  Future<bool> checkAuth() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

      _isAuthenticated = isLoggedIn;
      _isLoading = false;
      notifyListeners();
      return isLoggedIn;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // 退出登录
  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      await prefs.remove('username');

      _isAuthenticated = false;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 清除错误信息
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
