import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/repositories/chat_repository.dart';
import '../models/message_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<MessageEntity>> watchMessages({
    required String currentUserId,
    required String otherUserId,
  }) {
    final chatId = getChatId(currentUserId, otherUserId);
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .limit(30)  // Reduced from 50 for better performance
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => MessageModel.fromFirestore(doc))
            .where((message) => !message.deletedFor.contains(currentUserId))
            .toList())
        .handleError((error) {
      if (error is FirebaseException && error.code == 'permission-denied') {
        // If permission is denied, it might be because the chat document doesn't exist yet.
        // In this case, we return an empty list to allow the UI to show the "Start conversation" state.
        return <MessageEntity>[];
      }
      throw error;
    });
  }

  @override
  Future<void> sendMessage({
    required String currentUserId,
    required String otherUserId,
    required String text,
  }) async {
    final chatId = getChatId(currentUserId, otherUserId);
    final chatDoc = _firestore.collection('chats').doc(chatId);
    
    // Ensure chat document exists
    final chatSnapshot = await chatDoc.get();
    if (!chatSnapshot.exists) {
      await chatDoc.set({
        'participants': [currentUserId, otherUserId],
        'lastMessage': text,
        'lastMessageTime': FieldValue.serverTimestamp(),
      });
    } else {
      await chatDoc.update({
        'lastMessage': text,
        'lastMessageTime': FieldValue.serverTimestamp(),
      });
    }

    final messageModel = MessageModel(
      id: '',
      senderId: currentUserId,
      text: text,
      timestamp: DateTime.now(),
    );

    await chatDoc.collection('messages').add(messageModel.toFirestore());
  }

  @override
  Future<void> updateMessage({
    required String chatId,
    required String messageId,
    required String newText,
  }) async {
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(messageId)
        .update({
      'text': newText,
      'isEdited': true,
    });
  }

  @override
  Future<void> deleteMessage({
    required String chatId,
    required String messageId,
  }) async {
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(messageId)
        .delete();
  }

  @override
  Future<void> deleteMessageForMe({
    required String chatId,
    required String messageId,
    required String userId,
  }) async {
    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(messageId)
        .update({
      'deletedFor': FieldValue.arrayUnion([userId]),
    });
  }

  String getChatId(String userId1, String userId2) {
    final users = [userId1, userId2]..sort();
    return users.join('_');
  }
}