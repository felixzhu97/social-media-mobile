import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/post_card.dart';
import '../models/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 模拟数据
  final List<Post> _posts = [
    Post(
      id: '1',
      userId: 'user1',
      username: '张三',
      userProfileImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
      imageUrl: 'https://picsum.photos/500/500?random=1',
      caption: '美好的一天 #阳光 #旅行',
      likes: ['user2', 'user3'],
      comments: [
        Comment(
          id: 'c1',
          userId: 'user2',
          username: '李四',
          userProfileImageUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
          text: '好美的风景！',
          timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        )
      ],
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      location: '北京',
    ),
    Post(
      id: '2',
      userId: 'user2',
      username: '李四',
      userProfileImageUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
      imageUrl: 'https://picsum.photos/500/500?random=2',
      caption: '美食时间 #美食 #晚餐',
      likes: ['user1'],
      comments: [],
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      location: '上海',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://www.instagram.com/static/images/web/mobile_nav_type_logo.png/735145cfe0a4.png',
          height: 32,
        ),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.paperPlane),
            onPressed: () {
              // 导航到消息页面
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return PostCard(post: _posts[index]);
        },
      ),
    );
  }
} 