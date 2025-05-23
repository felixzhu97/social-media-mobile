import 'package:flutter/material.dart';
import 'skeleton_loader.dart';

class StorySkeletonLoader extends StatelessWidget {
  const StorySkeletonLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        itemCount: 8, // 显示8个故事骨架
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: const SkeletonLoader(
                  width: 72,
                  height: 72,
                  borderRadius: 36,
                ),
              ),
              const SizedBox(height: 4),
              const SkeletonLoader(
                width: 60,
                height: 12,
                borderRadius: 2,
              ),
            ],
          );
        },
      ),
    );
  }
}
