// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chatRepository)
const chatRepositoryProvider = ChatRepositoryProvider._();

final class ChatRepositoryProvider
    extends
        $FunctionalProvider<
          ChatRepositoryImpl,
          ChatRepositoryImpl,
          ChatRepositoryImpl
        >
    with $Provider<ChatRepositoryImpl> {
  const ChatRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatRepositoryHash();

  @$internal
  @override
  $ProviderElement<ChatRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChatRepositoryImpl create(Ref ref) {
    return chatRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatRepositoryImpl>(value),
    );
  }
}

String _$chatRepositoryHash() => r'637dcb5f4ef1996c371c2a7dfcf5f80d3855c2a2';

@ProviderFor(ChatMessages)
const chatMessagesProvider = ChatMessagesFamily._();

final class ChatMessagesProvider
    extends $StreamNotifierProvider<ChatMessages, List<MessageEntity>> {
  const ChatMessagesProvider._({
    required ChatMessagesFamily super.from,
    required ({String currentUserId, String otherUserId}) super.argument,
  }) : super(
         retry: null,
         name: r'chatMessagesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$chatMessagesHash();

  @override
  String toString() {
    return r'chatMessagesProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ChatMessages create() => ChatMessages();

  @override
  bool operator ==(Object other) {
    return other is ChatMessagesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$chatMessagesHash() => r'06a15a00428cc018e25da7bef473b2783da970f0';

final class ChatMessagesFamily extends $Family
    with
        $ClassFamilyOverride<
          ChatMessages,
          AsyncValue<List<MessageEntity>>,
          List<MessageEntity>,
          Stream<List<MessageEntity>>,
          ({String currentUserId, String otherUserId})
        > {
  const ChatMessagesFamily._()
    : super(
        retry: null,
        name: r'chatMessagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChatMessagesProvider call({
    required String currentUserId,
    required String otherUserId,
  }) => ChatMessagesProvider._(
    argument: (currentUserId: currentUserId, otherUserId: otherUserId),
    from: this,
  );

  @override
  String toString() => r'chatMessagesProvider';
}

abstract class _$ChatMessages extends $StreamNotifier<List<MessageEntity>> {
  late final _$args = ref.$arg as ({String currentUserId, String otherUserId});
  String get currentUserId => _$args.currentUserId;
  String get otherUserId => _$args.otherUserId;

  Stream<List<MessageEntity>> build({
    required String currentUserId,
    required String otherUserId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      currentUserId: _$args.currentUserId,
      otherUserId: _$args.otherUserId,
    );
    final ref =
        this.ref as $Ref<AsyncValue<List<MessageEntity>>, List<MessageEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<MessageEntity>>, List<MessageEntity>>,
              AsyncValue<List<MessageEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
