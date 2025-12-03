import '../entities/message_entity.dart';

abstract class ChatRepository {
  Stream<List<MessageEntity>> watchMessages({
    required String currentUserId,
    required String otherUserId,
  });

  Future<void> sendMessage({
    required String currentUserId,
    required String otherUserId,
    required String text,
  });

  Future<void> updateMessage({
    required String chatId,
    required String messageId,
    required String newText,
  });

  Future<void> deleteMessage({
    required String chatId,
    required String messageId,
  });

  Future<void> deleteMessageForMe({
    required String chatId,
    required String messageId,
    required String userId,
  });
}
