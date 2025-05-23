import 'package:flutter/material.dart';
import '../models/post_model.dart';

class PostService extends ChangeNotifier {
  final List<Post> _posts = [];
  bool _isLoading = false;
  bool _hasMore = true;
  String? _error;
  int _page = 1;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  String? get error => _error;

  // 初始化加载帖子
  Future<void> loadPosts() async {
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // 模拟网络请求延迟
      await Future.delayed(const Duration(seconds: 1));

      // 在实际应用中，这里应该调用API获取数据
      // 这里使用模拟数据
      final newPosts = await _getMockPosts(_page);

      // 如果没有更多数据，设置hasMore为false
      if (newPosts.isEmpty) {
        _hasMore = false;
      } else {
        _posts.addAll(newPosts);
        _page++;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = '加载帖子失败: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  // 刷新帖子列表
  Future<void> refreshPosts() async {
    _posts.clear();
    _page = 1;
    _hasMore = true;
    notifyListeners();

    await loadPosts();
  }

  // 模拟获取帖子数据
  Future<List<Post>> _getMockPosts(int page) async {
    // 每页帖子数量
    const perPage = 5;

    // 模拟总共有30篇帖子
    if (page > 6) return [];

    // 生成模拟数据
    return List.generate(
      perPage,
      (index) {
        final postIndex = (page - 1) * perPage + index;

        // 为了展示多图功能，有些帖子只有1张图，有些有多张图
        final int imageCount = (postIndex % 4) + 1; // 1到4张图片

        return Post(
          id: 'post_$postIndex',
          userId: 'user_${postIndex % 5}',
          username: '用户${postIndex % 5}',
          userProfileImageUrl:
              'https://randomuser.me/api/portraits/${postIndex % 2 == 0 ? 'men' : 'women'}/${(postIndex % 10) + 1}.jpg',
          imageUrls: List.generate(
              imageCount,
              (i) =>
                  'https://picsum.photos/500/500?random=${postIndex * 10 + i}'),
          caption: '这是第$postIndex条帖子 #Instagram #照片',
          likes: List.generate(postIndex % 20 + 1, (i) => 'user_$i'),
          comments: List.generate(
            postIndex % 5,
            (i) => Comment(
              id: 'comment_${postIndex}_$i',
              userId: 'user_$i',
              username: '评论用户$i',
              userProfileImageUrl:
                  'https://randomuser.me/api/portraits/${i % 2 == 0 ? 'women' : 'men'}/${(i % 10) + 1}.jpg',
              text: '这是第$i条评论',
              timestamp: DateTime.now().subtract(Duration(hours: i + 1)),
            ),
          ),
          timestamp: DateTime.now().subtract(Duration(hours: postIndex * 2)),
          location:
              postIndex % 3 == 0 ? '北京' : (postIndex % 3 == 1 ? '上海' : '广州'),
        );
      },
    );
  }

  // 清除错误信息
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
