import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_time/common/widgets/main_navigation/main_navigation_screen.dart';

final router = GoRouter(
  initialLocation: "/search",
  routes: [
    GoRoute(
      name: MainNavigationScreen.routeName,
      path: "/:tab(home|search|post|like|user)",
      builder: (context, state) {
        final tab = state.params["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    // GoRoute(
    //   name: ActivityScreen.routeName,
    //   path: ActivityScreen.routeURL,
    //   builder: (context, state) => const ActivityScreen(),
    // ),
    // GoRoute(
    //   name: ChatsScreen.routeName,
    //   path: ChatsScreen.routeURL,
    //   builder: (context, state) => const ChatsScreen(),
    //   routes: [
    //     GoRoute(
    //       name: ChatDetailScreen.routeName,
    //       path: ChatDetailScreen.routeURL,
    //       builder: (context, state) {
    //         final chatId = state.params["chatId"]!;
    //         return ChatDetailScreen(
    //           chatId: chatId,
    //         );
    //       },
    //     )
    //   ],
    // ),
    // GoRoute(
    //   name: VideoRecordingScreen.routeName,
    //   path: VideoRecordingScreen.routeURL,
    //   pageBuilder: (context, state) => CustomTransitionPage(
    //     transitionDuration: const Duration(milliseconds: 200),
    //     child: const VideoRecordingScreen(),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       final position = Tween(
    //         begin: const Offset(0, 1),
    //         end: Offset.zero,
    //       ).animate(animation);
    //       return SlideTransition(
    //         position: position,
    //         child: child,
    //       );
    //     },
    //   ),
    // ),
  ],
);
