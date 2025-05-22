import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/story_service.dart';

class StoryViewScreen extends StatefulWidget {
  final Story story;
  final List<Story> stories;
  final int initialStoryIndex;

  const StoryViewScreen({
    Key? key,
    required this.story,
    required this.stories,
    this.initialStoryIndex = 0,
  }) : super(key: key);

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  late int _currentStoryIndex;
  late int _currentItemIndex;
  late int _currentStoryItemsLength;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialStoryIndex);
    _currentStoryIndex = widget.initialStoryIndex;
    _currentItemIndex = 0;
    _currentStoryItemsLength = widget.stories[_currentStoryIndex].items.length;

    // 设置动画控制器
    _animationController = AnimationController(vsync: this);
    _animationController.addStatusListener(_animationStatusListener);

    // 标记故事为已查看
    _markStoryAsViewed();

    // 开始播放故事
    _loadStory();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  // 监听动画状态
  void _animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _animationController.stop();
      _nextItem();
    }
  }

  // 标记故事为已查看
  void _markStoryAsViewed() {
    final storyService = Provider.of<StoryService>(context, listen: false);
    storyService.markStoryAsViewed(widget.stories[_currentStoryIndex].id);
  }

  // 加载当前故事
  void _loadStory() {
    _animationController.stop();
    _animationController.reset();

    // 获取当前故事项的持续时间
    final storyItem =
        widget.stories[_currentStoryIndex].items[_currentItemIndex];
    final duration = storyItem.duration;

    _animationController.duration = duration;
    _animationController.forward();
  }

  // 下一个故事项
  void _nextItem() {
    if (_currentItemIndex < _currentStoryItemsLength - 1) {
      setState(() {
        _currentItemIndex++;
      });
      _loadStory();
    } else {
      // 如果是最后一个故事项，切换到下一个故事
      if (_currentStoryIndex < widget.stories.length - 1) {
        setState(() {
          _currentStoryIndex++;
          _currentItemIndex = 0;
          _currentStoryItemsLength =
              widget.stories[_currentStoryIndex].items.length;
        });
        _markStoryAsViewed();
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else {
        // 如果是最后一个故事，退出查看
        Navigator.of(context).pop();
      }
    }
  }

  // 上一个故事项
  void _previousItem() {
    if (_currentItemIndex > 0) {
      setState(() {
        _currentItemIndex--;
      });
      _loadStory();
    } else {
      // 如果是第一个故事项，切换到上一个故事
      if (_currentStoryIndex > 0) {
        setState(() {
          _currentStoryIndex--;
          _currentStoryItemsLength =
              widget.stories[_currentStoryIndex].items.length;
          _currentItemIndex = _currentStoryItemsLength - 1;
        });
        _markStoryAsViewed();
        _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    }
  }

  // 构建进度条
  Widget _buildProgressIndicators() {
    return Row(
      children: List.generate(
        _currentStoryItemsLength,
        (index) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: LinearProgressIndicator(
                value: index < _currentItemIndex
                    ? 1.0
                    : index == _currentItemIndex
                        ? _animationController.value
                        : 0.0,
                backgroundColor: Colors.grey.withOpacity(0.3),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentStory = widget.stories[_currentStoryIndex];
    final currentStoryItem = currentStory.items[_currentItemIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) {
          // 点击左侧区域，显示上一个故事项
          if (details.globalPosition.dx <
              MediaQuery.of(context).size.width / 2) {
            _previousItem();
          } else {
            // 点击右侧区域，显示下一个故事项
            _nextItem();
          }
        },
        onLongPressStart: (details) {
          // 长按暂停故事
          _animationController.stop();
        },
        onLongPressEnd: (details) {
          // 结束长按继续播放
          _animationController.forward();
        },
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.stories.length,
          onPageChanged: (index) {
            setState(() {
              _currentStoryIndex = index;
              _currentItemIndex = 0;
              _currentStoryItemsLength =
                  widget.stories[_currentStoryIndex].items.length;
            });
            _markStoryAsViewed();
            _loadStory();
          },
          itemBuilder: (context, index) {
            final story = widget.stories[index];
            final storyItem = index == _currentStoryIndex
                ? story.items[_currentItemIndex]
                : story.items[0];

            return Stack(
              children: [
                // 故事内容
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(storyItem.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // 顶部控制栏
                SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: _buildProgressIndicators(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage(story.userImageUrl),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              story.username,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _getTimeAgo(storyItem.createdAt),
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 12,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // 底部内容区
                if (storyItem.caption != null)
                  Positioned(
                    bottom: 24,
                    left: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        storyItem.caption!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final Duration difference = DateTime.now().difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}秒前';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}分钟前';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}小时前';
    } else {
      return '${difference.inDays}天前';
    }
  }
}
