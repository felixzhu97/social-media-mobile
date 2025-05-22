import 'package:flutter/material.dart';

class Story {
  final String id;
  final String userId;
  final String username;
  final String userImageUrl;
  final List<StoryItem> items;
  final DateTime createdAt;
  bool isViewed;

  Story({
    required this.id,
    required this.userId,
    required this.username,
    required this.userImageUrl,
    required this.items,
    required this.createdAt,
    this.isViewed = false,
  });
}

class StoryItem {
  final String id;
  final String imageUrl;
  final String? caption;
  final DateTime createdAt;
  final Duration duration;

  StoryItem({
    required this.id,
    required this.imageUrl,
    this.caption,
    required this.createdAt,
    this.duration = const Duration(seconds: 5),
  });
}

class StoryService extends ChangeNotifier {
  List<Story> _stories = [];
  bool _isLoading = false;

  List<Story> get stories => _stories;
  bool get isLoading => _isLoading;

  // 获取所有故事
  Future<void> loadStories() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      // 模拟网络请求延迟
      await Future.delayed(const Duration(milliseconds: 800));

      // 获取模拟数据
      _stories = _getMockStories();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 将故事标记为已查看
  void markStoryAsViewed(String storyId) {
    final storyIndex = _stories.indexWhere((story) => story.id == storyId);
    if (storyIndex != -1) {
      _stories[storyIndex].isViewed = true;
      notifyListeners();
    }
  }

  // 生成模拟故事数据
  List<Story> _getMockStories() {
    return [
      Story(
        id: 'story1',
        userId: 'user1',
        username: '张三',
        userImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
        items: [
          StoryItem(
            id: 'item1',
            imageUrl: 'https://picsum.photos/400/800?random=101',
            caption: '周末的旅行 #旅行 #周末',
            createdAt: DateTime.now().subtract(const Duration(hours: 2)),
          ),
          StoryItem(
            id: 'item2',
            imageUrl: 'https://picsum.photos/400/800?random=102',
            createdAt: DateTime.now().subtract(const Duration(hours: 1)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Story(
        id: 'story2',
        userId: 'user2',
        username: '李四',
        userImageUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
        items: [
          StoryItem(
            id: 'item3',
            imageUrl: 'https://picsum.photos/400/800?random=103',
            caption: '今天的美食 #美食',
            createdAt: DateTime.now().subtract(const Duration(hours: 3)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      ),
      Story(
        id: 'story3',
        userId: 'user3',
        username: '王五',
        userImageUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
        items: [
          StoryItem(
            id: 'item4',
            imageUrl: 'https://picsum.photos/400/800?random=104',
            createdAt: DateTime.now().subtract(const Duration(hours: 4)),
          ),
          StoryItem(
            id: 'item5',
            imageUrl: 'https://picsum.photos/400/800?random=105',
            createdAt:
                DateTime.now().subtract(const Duration(hours: 3, minutes: 30)),
          ),
          StoryItem(
            id: 'item6',
            imageUrl: 'https://picsum.photos/400/800?random=106',
            caption: '我的新车 #汽车',
            createdAt: DateTime.now().subtract(const Duration(hours: 3)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 4)),
      ),
      Story(
        id: 'story4',
        userId: 'user4',
        username: '赵六',
        userImageUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
        items: [
          StoryItem(
            id: 'item7',
            imageUrl: 'https://picsum.photos/400/800?random=107',
            createdAt: DateTime.now().subtract(const Duration(hours: 6)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 6)),
        isViewed: true,
      ),
      Story(
        id: 'story5',
        userId: 'user5',
        username: '小明',
        userImageUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
        items: [
          StoryItem(
            id: 'item8',
            imageUrl: 'https://picsum.photos/400/800?random=108',
            createdAt: DateTime.now().subtract(const Duration(hours: 8)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      ),
      Story(
        id: 'story6',
        userId: 'user6',
        username: '小红',
        userImageUrl: 'https://randomuser.me/api/portraits/women/3.jpg',
        items: [
          StoryItem(
            id: 'item9',
            imageUrl: 'https://picsum.photos/400/800?random=109',
            createdAt: DateTime.now().subtract(const Duration(hours: 10)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 10)),
        isViewed: true,
      ),
      Story(
        id: 'story7',
        userId: 'user7',
        username: '小华',
        userImageUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
        items: [
          StoryItem(
            id: 'item10',
            imageUrl: 'https://picsum.photos/400/800?random=110',
            createdAt: DateTime.now().subtract(const Duration(hours: 12)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 12)),
      ),
    ];
  }
}
