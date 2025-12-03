import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants/app_routes.dart';
import '../../presentation/screens/splash_screen.dart';
import '../../presentation/screens/sign_in_screen.dart';
import '../../presentation/screens/sign_up_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/chat_screen.dart';
import '../../presentation/screens/profile_screen.dart';
import '../../presentation/providers/auth_provider.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // Initialize with current state
  var authState = ref.read(authStateProvider);
  final routerNotifier = ValueNotifier<AsyncValue<User?>>(authState);

  // Listen for changes
  ref.listen<AsyncValue<User?>>(
    authStateProvider,
    (_, next) {
      authState = next;
      routerNotifier.value = next;
    },
  );

  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: routerNotifier,
    redirect: (context, state) {
      final currentAuth = routerNotifier.value;

      // If loading, keep showing splash (return null means no redirect)
      if (currentAuth.isLoading) return null;

      // Check authentication status
      final isAuthenticated = currentAuth.asData?.value != null;
      
      final isSplashing = state.matchedLocation == AppRoutes.splash;
      final isSigningIn = state.matchedLocation == AppRoutes.signIn;
      final isSigningUp = state.matchedLocation == AppRoutes.signUp;

      if (isAuthenticated) {
        // If authenticated and on splash or auth screens, go to Home
        if (isSplashing || isSigningIn || isSigningUp) {
          return AppRoutes.home;
        }
      } else {
        // If NOT authenticated
        
        // If on Splash, go to SignIn
        if (isSplashing) {
          return AppRoutes.signIn;
        }
        
        // If trying to access protected routes, go to SignIn
        if (state.matchedLocation == AppRoutes.home || 
            state.matchedLocation.startsWith(AppRoutes.chat) ||
            state.matchedLocation == AppRoutes.profile) {
          return AppRoutes.signIn;
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SignInScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SignUpScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: AppRoutes.home,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: '${AppRoutes.chat}/:userId',
        pageBuilder: (context, state) {
          final userId = state.pathParameters['userId']!;
          final userName = state.uri.queryParameters['userName'] ?? 'User';
          return CustomTransitionPage(
            key: state.pageKey,
            child: ChatScreen(userId: userId, userName: userName),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;
              final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(position: animation.drive(tween), child: child);
            },
          );
        },
      ),
      GoRoute(
        path: AppRoutes.profile,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ProfileScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
    ],
  );
});
