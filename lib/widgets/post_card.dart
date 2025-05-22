import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../models/post_model.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    // 检查当前用户是否已点赞
    // 这里应该从UserModel中获取当前用户ID，暂时硬编码为'user1'
    isLiked = widget.post.likes.contains('user1');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
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
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(widget.post.userProfileImageUrl),
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
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPostImage() {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          isLiked = true;
        });
      },
      child: Image.network(
        widget.post.imageUrl,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildPostActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.comment),
            onPressed: () {
              // 打开评论区
            },
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.paperPlane),
            onPressed: () {
              // 分享帖子
            },
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
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
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                '查看全部${widget.post.comments.length}条评论',
                style: TextStyle(color: Colors.grey[600]),
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
} 