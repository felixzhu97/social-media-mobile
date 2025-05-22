class Post {
  final String id;
  final String userId;
  final String username;
  final String userProfileImageUrl;
  final String imageUrl;
  final String caption;
  final List<String> likes;
  final List<Comment> comments;
  final DateTime timestamp;
  final String location;

  Post({
    required this.id,
    required this.userId,
    required this.username,
    required this.userProfileImageUrl,
    required this.imageUrl,
    this.caption = '',
    this.likes = const [],
    this.comments = const [],
    required this.timestamp,
    this.location = '',
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    List<Comment> commentsList = [];
    if (json['comments'] != null) {
      commentsList = List<Comment>.from(
          json['comments'].map((comment) => Comment.fromJson(comment)));
    }

    return Post(
      id: json['id'],
      userId: json['userId'],
      username: json['username'],
      userProfileImageUrl: json['userProfileImageUrl'],
      imageUrl: json['imageUrl'],
      caption: json['caption'] ?? '',
      likes: List<String>.from(json['likes'] ?? []),
      comments: commentsList,
      timestamp: DateTime.parse(json['timestamp']),
      location: json['location'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'username': username,
      'userProfileImageUrl': userProfileImageUrl,
      'imageUrl': imageUrl,
      'caption': caption,
      'likes': likes,
      'comments': comments.map((comment) => comment.toJson()).toList(),
      'timestamp': timestamp.toIso8601String(),
      'location': location,
    };
  }

  Post copyWith({
    String? id,
    String? userId,
    String? username,
    String? userProfileImageUrl,
    String? imageUrl,
    String? caption,
    List<String>? likes,
    List<Comment>? comments,
    DateTime? timestamp,
    String? location,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      userProfileImageUrl: userProfileImageUrl ?? this.userProfileImageUrl,
      imageUrl: imageUrl ?? this.imageUrl,
      caption: caption ?? this.caption,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      timestamp: timestamp ?? this.timestamp,
      location: location ?? this.location,
    );
  }
}

class Comment {
  final String id;
  final String userId;
  final String username;
  final String userProfileImageUrl;
  final String text;
  final DateTime timestamp;

  Comment({
    required this.id,
    required this.userId,
    required this.username,
    required this.userProfileImageUrl,
    required this.text,
    required this.timestamp,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      userId: json['userId'],
      username: json['username'],
      userProfileImageUrl: json['userProfileImageUrl'],
      text: json['text'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'username': username,
      'userProfileImageUrl': userProfileImageUrl,
      'text': text,
      'timestamp': timestamp.toIso8601String(),
    };
  }
} 