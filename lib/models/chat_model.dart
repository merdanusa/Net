class ChatModel {
  final String id;
  final String title;
  final DateTime updatedAt;
  final List<dynamic> messages;

  ChatModel({
    required this.id,
    required this.title,
    required this.updatedAt,
    required this.messages,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['_id'] as String,
      title: (json['title'] as String?)?.trim() ?? 'New Chat',
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      messages: json['messages'] as List<dynamic>,
    );
  }

  String get displayTitle {
    if (title != 'New Chat' && title.isNotEmpty) return title;
    final userMsg = messages.cast<Map<String, dynamic>>().firstWhere(
      (m) => m['role'] == 'user',
      orElse: () => {'content': 'Empty chat'},
    );
    String content = userMsg['content']?.toString() ?? 'Empty chat';
    return content.length > 50 ? '${content.substring(0, 47)}...' : content;
  }

  String get relativeTime {
    final diff = DateTime.now().difference(updatedAt);
    if (diff.inMinutes < 1) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    if (diff.inDays < 30) return '${(diff.inDays / 7).floor()}w ago';
    return '${updatedAt.month}/${updatedAt.day}';
  }
}
