class Post {
  final String id;
  final String userId;
  final String username;
  final String userProfileImageUrl;
  final List<String> imageUrls;
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
    required this.imageUrls,
    this.caption = '',
    this.likes = const [],
    this.comments = const [],
    required this.timestamp,
    this.location = '',
  });

  factory Post.singleImage({
    required String id,
    required String userId,
    required String username,
    required String userProfileImageUrl,
    required String imageUrl,
    String caption = '',
    List<String> likes = const [],
    List<Comment> comments = const [],
    required DateTime timestamp,
    String location = '',
  }) {
    return Post(
      id: id,
      userId: userId,
      username: username,
      userProfileImageUrl: userProfileImageUrl,
      imageUrls: [imageUrl],
      caption: caption,
      likes: likes,
      comments: comments,
      timestamp: timestamp,
      location: location,
    );
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    List<Comment> commentsList = [];
    if (json['comments'] != null) {
      commentsList = List<Comment>.from(
          json['comments'].map((comment) => Comment.fromJson(comment)));
    }

    List<String> imageUrlsList = [];
    if (json['imageUrl'] != null) {
      imageUrlsList.add(json['imageUrl']);
    } else if (json['imageUrls'] != null) {
      imageUrlsList = List<String>.from(json['imageUrls']);
    }

    return Post(
      id: json['id'],
      userId: json['userId'],
      username: json['username'],
      userProfileImageUrl: json['userProfileImageUrl'],
      imageUrls: imageUrlsList,
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
      'imageUrls': imageUrls,
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
    List<String>? imageUrls,
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
      imageUrls: imageUrls ?? this.imageUrls,
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
