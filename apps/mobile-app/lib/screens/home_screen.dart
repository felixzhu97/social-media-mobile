import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../widgets/post_card.dart';
import '../widgets/story_circle.dart';
import '../widgets/post_skeleton_card.dart';
import '../widgets/story_skeleton_loader.dart';
import '../models/post_model.dart';
import '../services/post_service.dart';
import '../services/story_service.dart';
import '../services/auth_service.dart';
import 'story_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();
  bool _isInitialized = false;
  bool _isFirstLoad = true;

  @override
  bool get wantKeepAlive => true; // 保持页面状态

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    // 确保在initState后再加载数据
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isInitialized) {
        _isInitialized = true;
        // 加载帖子数据
        Provider.of<PostService>(context, listen: false).loadPosts().then((_) {
          setState(() {
            _isFirstLoad = false;
          });
        });
        // 加载故事数据
        Provider.of<StoryService>(context, listen: false).loadStories();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  // 滚动监听器 - 用于实现无限滚动
  void _scrollListener() {
    final postService = Provider.of<PostService>(context, listen: false);

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      if (!postService.isLoading && postService.hasMore) {
        postService.loadPosts();
      }
    }
  }

  // 打开故事查看器
  void _openStoryView(Story story, List<Story> stories, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoryViewScreen(
          story: story,
          stories: stories,
          initialStoryIndex: index,
        ),
      ),
    );
  }

  // 构建故事栏
  Widget _buildStories() {
    final storyService = Provider.of<StoryService>(context);

    if (storyService.isLoading) {
      return const StorySkeletonLoader();
    }

    return Container(
      height: 110,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.3,
          ),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: storyService.stories.length + 1, // +1 for user's own story
        itemBuilder: (context, index) {
          // 用户自己的故事
          if (index == 0) {
            return StoryCircle(
              imageUrl: 'https://randomuser.me/api/portraits/men/40.jpg',
              username: '你的故事',
              isCurrentUser: true,
              onTap: () {
                // 添加故事功能
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('添加故事功能待实现')),
                );
              },
            );
          }

          // 其他用户的故事
          final story = storyService.stories[index - 1];
          return StoryCircle(
            imageUrl: story.userImageUrl,
            username: story.username,
            isViewed: story.isViewed,
            onTap: () {
              _openStoryView(story, storyService.stories, index - 1);
            },
          );
        },
      ),
    );
  }

  // 构建首页帖子列表
  Widget _buildPostsList() {
    final postService = Provider.of<PostService>(context);

    // 首次加载显示骨架屏
    if (_isFirstLoad) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3, // 显示3个骨架屏
        itemBuilder: (context, index) {
          return const PostSkeletonCard();
        },
      );
    }

    if (postService.posts.isEmpty) {
      if (postService.isLoading) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3, // 显示3个骨架屏
          itemBuilder: (context, index) {
            return const PostSkeletonCard();
          },
        );
      }

      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.photo_library_outlined,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              '没有帖子',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '关注更多用户以查看他们的帖子',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: postService.posts.length + (postService.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        // 如果到达列表底部且还有更多数据，显示骨架屏加载指示器
        if (index == postService.posts.length && postService.hasMore) {
          return postService.isLoading
              ? const PostSkeletonCard()
              : const SizedBox.shrink();
        }

        // 否则显示帖子
        if (index < postService.posts.length) {
          return PostCard(post: postService.posts[index]);
        }

        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用super.build

    final postService = Provider.of<PostService>(context);
    final storyService = Provider.of<StoryService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.network(
          'https://www.instagram.com/static/images/web/mobile_nav_type_logo.png/735145cfe0a4.png',
          height: 32,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_border,
              size: 28,
            ),
            onPressed: () {
              // 导航到通知页面
            },
          ),
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.paperPlane,
              size: 22,
            ),
            onPressed: () {
              // 导航到消息页面
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _isFirstLoad = true;
          });
          // 同时刷新故事和帖子
          await Future.wait([
            storyService.loadStories(),
            postService.refreshPosts(),
          ]);
          setState(() {
            _isFirstLoad = false;
          });
        },
        child: ListView(
          controller: _scrollController,
          children: [
            // 故事栏
            _buildStories(),

            // 帖子列表
            _buildPostsList(),
          ],
        ),
      ),
    );
  }
}
