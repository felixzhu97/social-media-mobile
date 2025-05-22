import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  // 模拟用户数据
  final User _user = User(
    id: 'user1',
    username: '张三',
    email: 'zhangsan@example.com',
    profileImageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
    bio: '摄影爱好者 | 旅行达人 | 美食探索者',
    followers: 1024,
    following: 365,
    posts: 42,
  );

  // 模拟帖子图片
  final List<String> _posts = List.generate(
    15,
    (index) => 'https://picsum.photos/500/500?random=${index + 30}',
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_user.username),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // 显示菜单
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 个人资料头部
          _buildProfileHeader(),
          
          // 选项卡
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.bookmark_border)),
            ],
            indicatorColor: Colors.black,
          ),
          
          // 选项卡内容
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPostsGrid(),
                _buildSavedGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 头像和统计数据
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(_user.profileImageUrl),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatColumn('帖子', _user.posts),
                    _buildStatColumn('粉丝', _user.followers),
                    _buildStatColumn('关注', _user.following),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // 用户名和简介
          Text(
            _user.username,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          if (_user.bio.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(_user.bio),
            ),
          
          const SizedBox(height: 16),
          
          // 编辑资料按钮
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                // 编辑资料
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.grey),
              ),
              child: const Text('编辑资料'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, int count) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildPostsGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        return Image.network(
          _posts[index],
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget _buildSavedGrid() {
    // 为简化起见，使用与帖子相同的数据
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: _posts.length ~/ 2, // 收藏的数量通常少于帖子
      itemBuilder: (context, index) {
        return Image.network(
          _posts[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
} 