import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  final String imageUrl;
  final String username;
  final bool isViewed;
  final bool isCurrentUser;
  final VoidCallback onTap;

  const StoryCircle({
    Key? key,
    required this.imageUrl,
    required this.username,
    this.isViewed = false,
    this.isCurrentUser = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isViewed
                  ? null
                  : const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFE040FB),
                        Color(0xFFE91E63),
                        Color(0xFFFF9800),
                      ],
                    ),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(imageUrl),
                  child: isCurrentUser
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 72,
            child: Text(
              isCurrentUser ? '你的故事' : username,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
