import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/message_entity.dart';
import '../../data/repositories/chat_repository_impl.dart';

part 'chat_provider.g.dart';

@Riverpod(keepAlive: false)  // Allow disposal when not in use
ChatRepositoryImpl chatRepository(Ref ref) {
  return ChatRepositoryImpl();
}

@riverpod
class ChatMessages extends _$ChatMessages {
  @override
  Stream<List<MessageEntity>> build({
    required String currentUserId,
    required String otherUserId,
  }) {
    return ref.watch(chatRepositoryProvider).watchMessages(
          currentUserId: currentUserId,
          otherUserId: otherUserId,
        );
  }

  Future<void> sendMessage(String text) async {
    await ref.read(chatRepositoryProvider).sendMessage(
          currentUserId: currentUserId,
          otherUserId: otherUserId,
          text: text,
        );
  }

  Future<void> updateMessage(String messageId, String newText) async {
    await ref.read(chatRepositoryProvider).updateMessage(
          chatId: _getChatId(currentUserId, otherUserId),
          messageId: messageId,
          newText: newText,
        );
  }

  Future<void> deleteMessage(String messageId) async {
    await ref.read(chatRepositoryProvider).deleteMessage(
          chatId: _getChatId(currentUserId, otherUserId),
          messageId: messageId,
        );
  }

  Future<void> deleteMessageForMe(String messageId) async {
    await ref.read(chatRepositoryProvider).deleteMessageForMe(
          chatId: _getChatId(currentUserId, otherUserId),
          messageId: messageId,
          userId: currentUserId,
        );
  }

  String _getChatId(String userId1, String userId2) {
    final users = [userId1, userId2]..sort();
    return users.join('_');
  }
}