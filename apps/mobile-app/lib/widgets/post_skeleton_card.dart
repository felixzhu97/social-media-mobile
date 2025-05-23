import 'package:flutter/material.dart';
import 'skeleton_loader.dart';

class PostSkeletonCard extends StatelessWidget {
  const PostSkeletonCard({Key? key}) : super(key: key);

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
          // 帖子头部骨架
          _buildHeaderSkeleton(),

          // 帖子图片骨架
          AspectRatio(
            aspectRatio: 1.0,
            child: SkeletonLoader(
              borderRadius: 0,
            ),
          ),

          // 帖子操作按钮骨架
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: [
                const SkeletonLoader(
                  width: 36,
                  height: 36,
                  borderRadius: 18,
                ),
                const SizedBox(width: 16),
                const SkeletonLoader(
                  width: 36,
                  height: 36,
                  borderRadius: 18,
                ),
                const SizedBox(width: 16),
                const SkeletonLoader(
                  width: 36,
                  height: 36,
                  borderRadius: 18,
                ),
                const Spacer(),
                const SkeletonLoader(
                  width: 36,
                  height: 36,
                  borderRadius: 18,
                ),
              ],
            ),
          ),

          // 点赞信息骨架
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: SkeletonLoader(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 16,
            ),
          ),

          // 帖子描述骨架
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonLoader(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 16,
                ),
                const SizedBox(height: 6),
                SkeletonLoader(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 16,
                ),
              ],
            ),
          ),

          // 评论区骨架
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonLoader(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 14,
                ),
                const SizedBox(height: 8),
                SkeletonLoader(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 14,
                ),
              ],
            ),
          ),

          // 时间戳骨架
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SkeletonLoader(
              width: 100,
              height: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSkeleton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Row(
        children: [
          // 头像骨架
          const SkeletonLoader(
            width: 36,
            height: 36,
            borderRadius: 18,
          ),
          const SizedBox(width: 12),
          // 用户名和位置骨架
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SkeletonLoader(
                  width: 120,
                  height: 14,
                ),
                SizedBox(height: 4),
                SkeletonLoader(
                  width: 80,
                  height: 12,
                ),
              ],
            ),
          ),
          // 更多按钮骨架
          const SkeletonLoader(
            width: 24,
            height: 24,
            borderRadius: 12,
          ),
        ],
      ),
    );
  }
}
