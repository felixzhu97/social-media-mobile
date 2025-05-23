import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';
import '../models/post_model.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard>
    with SingleTickerProviderStateMixin {
  bool isLiked = false;
  bool isBookmarked = false;
  bool _showLikeAnimation = false;
  late AnimationController _likeAnimationController;
  final PageController _pageController = PageController();
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    // 检查当前用户是否已点赞
    // 这里应该从UserModel中获取当前用户ID，暂时硬编码为'user1'
    isLiked = widget.post.likes.contains('user1');

    // 初始化点赞动画控制器
    _likeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _likeAnimationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  // 双击点赞动画
  void _showLikeOverlayAnimation() {
    setState(() {
      _showLikeAnimation = true;
      isLiked = true;
    });

    _likeAnimationController.forward().then((_) {
      _likeAnimationController.reverse().then((_) {
        setState(() {
          _showLikeAnimation = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade200),
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 帖子头部信息
          _buildPostHeader(),

          // 帖子图片
          _buildPostImage(),

          // 帖子操作按钮
          _buildPostActions(),

          // 点赞信息
          _buildLikesInfo(),

          // 帖子描述
          _buildCaption(),

          // 评论区
          _buildComments(),

          // 时间戳
          _buildTimestamp(),
        ],
      ),
    );
  }

  Widget _buildPostHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage:
                CachedNetworkImageProvider(widget.post.userProfileImageUrl),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                if (widget.post.location.isNotEmpty)
                  Text(
                    widget.post.location,
                    style: const TextStyle(fontSize: 12),
                  ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // 显示更多选项
              _showPostOptions(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPostImage() {
    return GestureDetector(
      onDoubleTap: () {
        _showLikeOverlayAnimation();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 使用PageView实现图片滑动
          AspectRatio(
            aspectRatio: 1.0,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.post.imageUrls.length,
              onPageChanged: (index) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: widget.post.imageUrls[index],
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.error),
                  ),
                );
              },
            ),
          ),

          // 图片数量指示器（当有多张图片时显示）
          if (widget.post.imageUrls.length > 1)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${_currentImageIndex + 1}/${widget.post.imageUrls.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          // 多图指示器（底部小点）
          if (widget.post.imageUrls.length > 1)
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.post.imageUrls.length,
                  (index) => Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentImageIndex == index
                          ? Colors.blue
                          : Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),

          // 双击点赞动画
          if (_showLikeAnimation)
            AnimatedBuilder(
              animation: _likeAnimationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1.0 + _likeAnimationController.value,
                  child: Opacity(
                    opacity: 0.8,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildPostActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : null,
              size: 28,
            ),
            onPressed: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
          ),
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.comment,
              size: 24,
            ),
            onPressed: () {
              // 打开评论区
              _showCommentsBottomSheet(context);
            },
          ),
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.paperPlane,
              size: 24,
            ),
            onPressed: () {
              // 分享帖子
              _showShareOptions(context);
            },
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              size: 28,
            ),
            onPressed: () {
              setState(() {
                isBookmarked = !isBookmarked;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLikesInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        '${widget.post.likes.length}人赞了',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: widget.post.username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: ' ${widget.post.caption}'),
          ],
        ),
      ),
    );
  }

  Widget _buildComments() {
    if (widget.post.comments.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.post.comments.length > 2)
            GestureDetector(
              onTap: () {
                _showCommentsBottomSheet(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  '查看全部${widget.post.comments.length}条评论',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
          ...widget.post.comments.take(2).map((comment) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: comment.username,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' ${comment.text}'),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildTimestamp() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Text(
        timeago.format(widget.post.timestamp, locale: 'zh_CN'),
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 12.0,
        ),
      ),
    );
  }

  // 显示帖子选项菜单
  void _showPostOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.link),
                title: const Text('复制链接'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('链接已复制')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('分享到...'),
                onTap: () {
                  Navigator.pop(context);
                  _showShareOptions(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.report),
                title: const Text('举报'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.cancel, color: Colors.red),
                title: const Text('取消', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // 显示分享选项
  void _showShareOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '分享',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildShareOption(context, Icons.message, '私信'),
                  _buildShareOption(context, FontAwesomeIcons.weixin, '微信'),
                  _buildShareOption(context, FontAwesomeIcons.qq, 'QQ'),
                  _buildShareOption(context, FontAwesomeIcons.weibo, '微博'),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildShareOption(context, Icons.link, '复制链接'),
                  _buildShareOption(context, Icons.email, '邮件'),
                  _buildShareOption(context, Icons.more_horiz, '更多'),
                  const SizedBox(width: 60), // 占位
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  // 构建分享选项
  Widget _buildShareOption(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('已分享到$label')),
        );
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 30),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  // 显示评论底部弹窗
  void _showCommentsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (_, controller) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // 顶部句柄
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  // 标题
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      '评论',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(),
                  // 评论列表
                  Expanded(
                    child: widget.post.comments.isEmpty
                        ? const Center(child: Text('暂无评论'))
                        : ListView.builder(
                            controller: controller,
                            itemCount: widget.post.comments.length,
                            itemBuilder: (context, index) {
                              final comment = widget.post.comments[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                    comment.userProfileImageUrl,
                                  ),
                                ),
                                title: Text(comment.username),
                                subtitle: Text(comment.text),
                                trailing: Text(
                                  timeago.format(
                                    comment.timestamp,
                                    locale: 'zh_CN',
                                  ),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                  // 评论输入框
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(color: Colors.grey[300]!),
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: CachedNetworkImageProvider(
                            'https://randomuser.me/api/portraits/men/40.jpg',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '添加评论...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[100],
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // 发布评论
                          },
                          child: const Text(
                            '发布',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
