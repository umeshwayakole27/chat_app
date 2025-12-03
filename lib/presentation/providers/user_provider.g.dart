// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userRepository)
const userRepositoryProvider = UserRepositoryProvider._();

final class UserRepositoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  const UserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepositoryHash() => r'f85bcb6cd5eadec39ff05f02dcffe78a37ff8eba';

@ProviderFor(allUsers)
const allUsersProvider = AllUsersProvider._();

final class AllUsersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserEntity>>,
          List<UserEntity>,
          Stream<List<UserEntity>>
        >
    with $FutureModifier<List<UserEntity>>, $StreamProvider<List<UserEntity>> {
  const AllUsersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allUsersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allUsersHash();

  @$internal
  @override
  $StreamProviderElement<List<UserEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<UserEntity>> create(Ref ref) {
    return allUsers(ref);
  }
}

String _$allUsersHash() => r'91d1ce29e65260f063639a6a44c1f8df91c43164';

@ProviderFor(currentUserData)
const currentUserDataProvider = CurrentUserDataProvider._();

final class CurrentUserDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserEntity?>,
          UserEntity?,
          FutureOr<UserEntity?>
        >
    with $FutureModifier<UserEntity?>, $FutureProvider<UserEntity?> {
  const CurrentUserDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserDataHash();

  @$internal
  @override
  $FutureProviderElement<UserEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserEntity?> create(Ref ref) {
    return currentUserData(ref);
  }
}

String _$currentUserDataHash() => r'2a54b2b77df188accbe687a33f2fa51b4287efd6';

@ProviderFor(user)
const userProvider = UserFamily._();

final class UserProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserEntity?>,
          UserEntity?,
          FutureOr<UserEntity?>
        >
    with $FutureModifier<UserEntity?>, $FutureProvider<UserEntity?> {
  const UserProvider._({
    required UserFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userHash();

  @override
  String toString() {
    return r'userProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<UserEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserEntity?> create(Ref ref) {
    final argument = this.argument as String;
    return user(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userHash() => r'54f0651cc91898cffe9445dd20d75100952fc6e4';

final class UserFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<UserEntity?>, String> {
  const UserFamily._()
    : super(
        retry: null,
        name: r'userProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserProvider call(String uid) => UserProvider._(argument: uid, from: this);

  @override
  String toString() => r'userProvider';
}
