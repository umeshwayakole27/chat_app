class MessageEntity {
  final String id;
  final String senderId;
  final String text;
  final DateTime timestamp;
  final bool isEdited;
  final List<String> deletedFor;

  const MessageEntity({
    required this.id,
    required this.senderId,
    required this.text,
    required this.timestamp,
    this.isEdited = false,
    this.deletedFor = const [],
  });

  MessageEntity copyWith({
    String? id,
    String? senderId,
    String? text,
    DateTime? timestamp,
    bool? isEdited,
    List<String>? deletedFor,
  }) {
    return MessageEntity(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      text: text ?? this.text,
      timestamp: timestamp ?? this.timestamp,
      isEdited: isEdited ?? this.isEdited,
      deletedFor: deletedFor ?? this.deletedFor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageEntity &&
        other.id == id &&
        other.senderId == senderId &&
        other.text == text &&
        other.timestamp == timestamp &&
        other.isEdited == isEdited &&
        _listEquals(other.deletedFor, deletedFor);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        senderId.hashCode ^
        text.hashCode ^
        timestamp.hashCode ^
        isEdited.hashCode ^
        deletedFor.hashCode;
  }

  bool _listEquals<T>(List<T>? a, List<T>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    if (identical(a, b)) return true;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
